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
      final response = await dio.get(ApiEndpoints.myProfile);

      if (response.data['success'] == true) {
        return StudentProfileModel.fromJson(response.data['data']);
      } else {
        throw const NetworkException.defaultError('Failed to load profile');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<StudentProfileModel> updateProfile(
    UpdateProfileRequest request,
  ) async {
    try {
      final response = await dio.put(
        ApiEndpoints.myProfile,
        data: request.toJson(),
      );

      if (response.data['success'] == true) {
        return StudentProfileModel.fromJson(response.data['data']);
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to update profile',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
