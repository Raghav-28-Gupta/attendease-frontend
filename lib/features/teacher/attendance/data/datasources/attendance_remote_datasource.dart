import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/attendance_session_model.dart';

abstract class AttendanceRemoteDatasource {
  Future<Map<String, dynamic>> createSession(CreateSessionRequest request);
  Future<List<StudentAttendanceModel>> getSessionStudents(String sessionId);
  Future<Map<String, dynamic>> markAttendance(MarkAttendanceRequest request);
  Future<List<AttendanceSessionModel>> getTeacherSessions();
}

class AttendanceRemoteDatasourceImpl implements AttendanceRemoteDatasource {
  final Dio dio;

  AttendanceRemoteDatasourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> createSession(
    CreateSessionRequest request,
  ) async {
    try {
      final response = await dio.post(
        ApiEndpoints.attendanceSessions,
        data: request.toJson(),
      );

      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to create session',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<List<StudentAttendanceModel>> getSessionStudents(
    String sessionId,
  ) async {
    try {
      final response = await dio.get(
        ApiEndpoints.sessionStudents(sessionId),
      );

      if (response.data['success'] == true) {
        final List data = response.data['data'] ?? [];
        return data
            .map((json) => StudentAttendanceModel.fromJson(json))
            .toList();
      } else {
        throw const NetworkException.defaultError('Failed to fetch students');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<Map<String, dynamic>> markAttendance(
    MarkAttendanceRequest request,
  ) async {
    try {
      final response = await dio.post(
        ApiEndpoints.markAttendance,
        data: request.toJson(),
      );

      if (response.data['success'] == true) {
        return response.data;
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to mark attendance',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<List<AttendanceSessionModel>> getTeacherSessions() async {
    try {
      final response = await dio.get(ApiEndpoints.teacherSessions);

      if (response.data['success'] == true) {
        final List data = response.data['data'] ?? [];
        return data
            .map((json) => AttendanceSessionModel.fromJson(json))
            .toList();
      } else {
        throw const NetworkException.defaultError('Failed to fetch sessions');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
