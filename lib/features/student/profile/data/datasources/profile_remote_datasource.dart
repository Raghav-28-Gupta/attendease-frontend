import 'package:attendease_frontend/core/utils/logger.dart';
import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDatasource {
  Future<StudentProfileModel> getMyProfile();
  Future<StudentProfileModel> updateProfile(UpdateProfileRequest request);
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final Dio dio;

  ProfileRemoteDatasourceImpl(this.dio);

  @override
  Future<StudentProfileModel> getMyProfile() async {
    try {
      AppLogger.info('🌐 Fetching student profile...');

      final response = await dio.get(ApiEndpoints.myProfile);

      AppLogger.info('✅ Profile response: ${response.statusCode}');

      if (response.data == null) {
        throw const NetworkException.defaultError('Response is null');
      }

      if (response.data['success'] != true) {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to load profile',
        );
      }

      final profileData = response.data['data'];

      if (profileData == null) {
        throw const NetworkException.defaultError('Profile data is null');
      }

      AppLogger.info('✅ Profile loaded successfully');
      return StudentProfileModel.fromJson(profileData);
    } on DioException catch (e) {
      AppLogger.error('❌ Dio error fetching profile', e);
      throw NetworkException.getDioException(e);
    } catch (e) {
      AppLogger.error('❌ Unexpected error fetching profile', e);
      throw NetworkException.defaultError(e.toString());
    }
  }

  @override
  Future<StudentProfileModel> updateProfile(UpdateProfileRequest request) async {
    try {
      AppLogger.info('🌐 Updating student profile...');

      final response = await dio.put(
        ApiEndpoints.myProfile,
        data: request.toJson(),
      );

      AppLogger.info('✅ Update response: ${response.statusCode}');

      if (response.data == null) {
        throw const NetworkException.defaultError('Response is null');
      }

      if (response.data['success'] != true) {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to update profile',
        );
      }

      final profileData = response.data['data'];

      if (profileData == null) {
        throw const NetworkException.defaultError('Updated profile data is null');
      }

      AppLogger.info('✅ Profile updated successfully');
      return StudentProfileModel.fromJson(profileData);
    } on DioException catch (e) {
      AppLogger.error('❌ Dio error updating profile', e);
      throw NetworkException.getDioException(e);
    } catch (e) {
      AppLogger.error('❌ Unexpected error updating profile', e);
      throw NetworkException.defaultError(e.toString());
    }
  }
}