import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/repositories/attendance_repository.dart';
import '../datasources/attendance_remote_datasource.dart';
import '../models/attendance_session_model.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDatasource remoteDatasource;

  AttendanceRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<NetworkException, Map<String, dynamic>>> createSession(
    CreateSessionRequest request,
  ) async {
    try {
      final result = await remoteDatasource.createSession(request);
      AppLogger.info('✅ Session created successfully');
      return Right(result);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to create session', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, List<StudentAttendanceModel>>>
      getSessionStudents(String sessionId) async {
    try {
      final students = await remoteDatasource.getSessionStudents(sessionId);
      AppLogger.info('✅ Fetched ${students.length} students');
      return Right(students);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch students', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, Map<String, dynamic>>> markAttendance(
    MarkAttendanceRequest request,
  ) async {
    try {
      final result = await remoteDatasource.markAttendance(request);
      AppLogger.info('✅ Attendance marked for ${request.records.length} students');
      return Right(result);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to mark attendance', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, List<AttendanceSessionModel>>>
      getTeacherSessions() async {
    try {
      final sessions = await remoteDatasource.getTeacherSessions();
      AppLogger.info('✅ Fetched ${sessions.length} sessions');
      return Right(sessions);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch sessions', e);
      return Left(e);
    }
  }


  @override
  Future<Either<NetworkException, List<SessionWithDetails>>>
      getEnrollmentSessions(String enrollmentId) async {
    try {
      final sessions = await remoteDatasource.getEnrollmentSessions(enrollmentId);
      AppLogger.info('✅ Fetched ${sessions.length} sessions for enrollment');
      return Right(sessions);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch enrollment sessions', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, Map<String, dynamic>>> getSessionDetails(
    String sessionId,
  ) async {
    try {
      final details = await remoteDatasource.getSessionDetails(sessionId);
      AppLogger.info('✅ Fetched session details');
      return Right(details);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch session details', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, void>> updateAttendanceRecord(
    String recordId,
    Map<String, dynamic> data,
  ) async {
    try {
      await remoteDatasource.updateAttendanceRecord(recordId, data);
      AppLogger.info('✅ Attendance record updated');
      return const Right(null);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to update attendance record', e);
      return Left(e);
    }
  }

}
