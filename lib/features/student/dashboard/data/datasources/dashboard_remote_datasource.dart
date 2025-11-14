import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/student_dashboard_model.dart';

abstract class StudentDashboardRemoteDatasource {
  Future<StudentDashboardModel> getStudentDashboard();
}

class StudentDashboardRemoteDatasourceImpl
    implements StudentDashboardRemoteDatasource {
  final Dio dio;

  StudentDashboardRemoteDatasourceImpl(this.dio);

  @override
  Future<StudentDashboardModel> getStudentDashboard() async {
    try {
      final response = await dio.get(ApiEndpoints.studentDashboard);
      return StudentDashboardModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
