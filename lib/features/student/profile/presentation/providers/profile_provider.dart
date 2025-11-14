import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../data/datasources/profile_remote_datasource.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../data/models/profile_model.dart';
import '../../domain/repositories/profile_repository.dart';

// Datasource Provider
final profileRemoteDatasourceProvider =
    Provider<ProfileRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return ProfileRemoteDatasourceImpl(dio);
});

// Repository Provider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final remoteDatasource = ref.watch(profileRemoteDatasourceProvider);
  return ProfileRepositoryImpl(remoteDatasource);
});

// Profile Provider
final profileProvider = FutureProvider<StudentProfileModel>((ref) async {
  final repository = ref.watch(profileRepositoryProvider);
  final result = await repository.getMyProfile();

  return result.fold(
    (error) => throw NetworkException.getErrorMessage(error),
    (profile) => profile,
  );
});

// Update Profile Provider
final updateProfileProvider =
    StateNotifierProvider<UpdateProfileNotifier, AsyncValue<StudentProfileModel>>(
  (ref) {
    final repository = ref.watch(profileRepositoryProvider);
    return UpdateProfileNotifier(repository);
  },
);

class UpdateProfileNotifier
    extends StateNotifier<AsyncValue<StudentProfileModel>> {
  final ProfileRepository _repository;

  UpdateProfileNotifier(this._repository)
      : super(const AsyncValue.loading());

  Future<bool> updateProfile(UpdateProfileRequest request) async {
    state = const AsyncValue.loading();

    final result = await _repository.updateProfile(request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Profile update failed: $message');
        return false;
      },
      (profile) {
        state = AsyncValue.data(profile);
        AppLogger.info('Profile updated successfully');
        return true;
      },
    );
  }

  void reset() {
    state = const AsyncValue.loading();
  }
}
