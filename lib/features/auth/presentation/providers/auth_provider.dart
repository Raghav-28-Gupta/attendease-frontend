import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/utils/logger.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/models/login_request.dart';
import '../../data/models/change_password_request.dart';
import 'auth_state.dart';

// Auth Remote Datasource Provider
final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDatasourceImpl(dio);
});

// Auth Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDatasource = ref.watch(authRemoteDatasourceProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  return AuthRepositoryImpl(
    remoteDatasource: remoteDatasource,
    secureStorage: secureStorage,
  );
});

// Auth State Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthNotifier(this._repository) : super(const AuthState.initial()) {
    _checkAuthStatus();
  }

  // Check if user is already logged in
  Future<void> _checkAuthStatus() async {
    state = const AuthState.loading();

    try {
      final isLoggedIn = await _repository.isLoggedIn();

      if (isLoggedIn) {
        final user = await _repository.getCurrentUser();
        if (user != null) {
          state = AuthState.authenticated(user);
          AppLogger.info('✅ User already logged in: ${user.email}');
        } else {
          state = const AuthState.unauthenticated();
        }
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      AppLogger.error('❌ Error checking auth status', e);
      state = const AuthState.unauthenticated();
    }
  }

  // Login
  Future<bool> login(String email, String password) async {
    state = const AuthState.loading();

    final request = LoginRequest(email: email, password: password);
    final result = await _repository.login(request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AuthState.error(message);
        AppLogger.error('❌ Login error: $message');
        return false;
      },
      (user) {
        state = AuthState.authenticated(user);
        AppLogger.info('✅ Login successful: ${user.email}');
        return true;
      },
    );
  }

  // Logout
  Future<void> logout() async {
    state = const AuthState.loading();

    await _repository.logout();
    state = const AuthState.unauthenticated();

    AppLogger.info('✅ User logged out');
  }

  // Change Password
  Future<bool> changePassword(String oldPassword, String newPassword) async {
    final request = ChangePasswordRequest(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );

    final result = await _repository.changePassword(request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        AppLogger.error('❌ Password change error: $message');
        return false;
      },
      (_) {
        AppLogger.info('✅ Password changed successfully');
        return true;
      },
    );
  }

  // Get current user
  Future<void> refreshUser() async {
    final user = await _repository.getCurrentUser();
    if (user != null) {
      state = AuthState.authenticated(user);
    }
  }
}
