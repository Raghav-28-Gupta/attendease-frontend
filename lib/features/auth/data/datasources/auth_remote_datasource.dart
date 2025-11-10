import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_exceptions.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/change_password_request.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponse> login(LoginRequest request);
  Future<void> logout();
  Future<void> changePassword(ChangePasswordRequest request);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: request.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await dio.post(ApiEndpoints.logout);
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<void> changePassword(ChangePasswordRequest request) async {
    try {
      await dio.post(
        ApiEndpoints.changePassword,
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
