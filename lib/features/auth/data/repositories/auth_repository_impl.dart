import 'package:dartz/dartz.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request.dart';
import '../models/user_model.dart';
import '../models/change_password_request.dart';
import 'dart:convert';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;
  final SecureStorage secureStorage;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.secureStorage,
  });

  @override
  Future<Either<NetworkException, User>> login(LoginRequest request) async {
    try {
      final response = await remoteDatasource.login(request);

      // Save tokens
      await secureStorage.write(
        AppConfig.accessTokenKey,
        response.accessToken,
      );
      await secureStorage.write(
        AppConfig.refreshTokenKey,
        response.refreshToken,
      );

      // Save user data
      final userModel = UserModel.fromUserData(response.user);
      await secureStorage.write(
        AppConfig.userDataKey,
        jsonEncode(userModel.toJson()),
      );

      AppLogger.info('✅ Login successful: ${response.user.email}');

      return Right(userModel.toEntity());
    } on NetworkException catch (e) {
      AppLogger.error('❌ Login failed', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, Unit>> logout() async {
    try {
      // Call API to invalidate token
      await remoteDatasource.logout();

      // Clear local storage
      await secureStorage.deleteAll();

      AppLogger.info('✅ Logout successful');

      return const Right(unit);
    } on NetworkException catch (e) {
      // Even if API call fails, clear local data
      await secureStorage.deleteAll();
      AppLogger.error('❌ Logout error', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, Unit>> changePassword(
    ChangePasswordRequest request,
  ) async {
    try {
      await remoteDatasource.changePassword(request);

      AppLogger.info('✅ Password changed successfully');

      return const Right(unit);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Password change failed', e);
      return Left(e);
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final userJson = await secureStorage.read(AppConfig.userDataKey);
      if (userJson == null) return null;

      final userModel = UserModel.fromJson(jsonDecode(userJson));
      return userModel.toEntity();
    } catch (e) {
      AppLogger.error('❌ Error getting current user', e);
      return null;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await secureStorage.read(AppConfig.accessTokenKey);
    return token != null;
  }
}
