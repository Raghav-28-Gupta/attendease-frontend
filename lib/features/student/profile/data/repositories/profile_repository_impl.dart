import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource remoteDatasource;

  ProfileRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<NetworkException, StudentProfileModel>> getMyProfile() async {
    try {
      final profile = await remoteDatasource.getMyProfile();
      AppLogger.info('✅ Profile loaded successfully');
      return Right(profile);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to load profile: ${NetworkException.getErrorMessage(e)}');
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, StudentProfileModel>> updateProfile(
    UpdateProfileRequest request,
  ) async {
    try {
      final profile = await remoteDatasource.updateProfile(request);
      AppLogger.info('✅ Profile updated successfully');
      return Right(profile);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to update profile: ${NetworkException.getErrorMessage(e)}');
      return Left(e);
    }
  }
}
