import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/subject_attendance_model.dart';

abstract class SubjectRemoteDatasource {
  Future<SubjectAttendanceDetail> getSubjectAttendance(String subjectCode);
}

class SubjectRemoteDatasourceImpl implements SubjectRemoteDatasource {
  final Dio dio;

  SubjectRemoteDatasourceImpl(this.dio);

  @override
  Future<SubjectAttendanceDetail> getSubjectAttendance(
    String subjectCode,
  ) async {
    try {
      final response = await dio.get(
        ApiEndpoints.subjectAttendance(subjectCode),
      );

      if (response.data['success'] == true) {
        return SubjectAttendanceDetail.fromJson(response.data['data']);
      } else {
        throw const NetworkException.defaultError(
          'Failed to load subject attendance',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
