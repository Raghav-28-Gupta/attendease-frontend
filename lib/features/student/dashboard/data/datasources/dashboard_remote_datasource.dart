import 'package:attendease_frontend/core/utils/logger.dart';
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
      AppLogger.info('🌐 Fetching student dashboard...');
      
      final response = await dio.get(ApiEndpoints.studentDashboard);
      
      if (response.data['success'] != true) {
        throw const NetworkException.defaultError('Failed to load dashboard');
      }

      AppLogger.info('✅ Student dashboard fetched successfully');
      return StudentDashboardModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      AppLogger.error('❌ Failed to fetch student dashboard', e);
      throw NetworkException.getDioException(e);
    } catch (e) {
      AppLogger.error('❌ Unexpected error fetching student dashboard', e);
      throw const NetworkException.defaultError('Unexpected error occurred');
    }
  }
}
