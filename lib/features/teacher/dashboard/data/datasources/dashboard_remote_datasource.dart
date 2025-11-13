import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/teacher_dashboard_model.dart';

abstract class DashboardRemoteDatasource {
  Future<TeacherDashboardModel> getTeacherDashboard();
}

class DashboardRemoteDatasourceImpl implements DashboardRemoteDatasource {
  final Dio dio;

  DashboardRemoteDatasourceImpl(this.dio);

  @override
  Future<TeacherDashboardModel> getTeacherDashboard() async {
    try {
      final response = await dio.get(ApiEndpoints.teacherDashboard);

      if (response.data['success'] == true) {
        return TeacherDashboardModel.fromJson(response.data['data']);
      } else {
        throw const NetworkException.defaultError('Failed to load dashboard');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
