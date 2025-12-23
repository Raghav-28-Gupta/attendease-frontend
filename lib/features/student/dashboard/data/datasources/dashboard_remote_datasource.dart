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

      AppLogger.info('✅ Response status: ${response.statusCode}');
      AppLogger.info('📦 Response data: ${response.data}');

      // ✅ Check response structure
      if (response.data == null) {
        throw const NetworkException.defaultError('Response is null');
      }

      if (response.data['success'] != true) {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to load dashboard',
        );
      }

      // ✅ Extract data field
      final dashboardData = response.data['data'];

      if (dashboardData == null) {
        AppLogger.error('❌ Dashboard data is null in response');
        throw const NetworkException.defaultError(
          'Dashboard data is empty from server',
        );
      }

      AppLogger.info('✅ Student dashboard fetched successfully');
      return StudentDashboardModel.fromJson(dashboardData);
    } on DioException catch (e) {
      AppLogger.error('❌ Dio error fetching student dashboard', e);
      throw NetworkException.getDioException(e);
    } catch (e) {
      AppLogger.error('❌ Unexpected error fetching student dashboard', e);
      throw NetworkException.defaultError(e.toString());
    }
  }
}
