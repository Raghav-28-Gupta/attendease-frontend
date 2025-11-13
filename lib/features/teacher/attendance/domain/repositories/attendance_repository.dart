import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/models/attendance_session_model.dart';

abstract class AttendanceRepository {
  Future<Either<NetworkException, Map<String, dynamic>>> createSession(
    CreateSessionRequest request,
  );

  Future<Either<NetworkException, List<StudentAttendanceModel>>>
      getSessionStudents(String sessionId);

  Future<Either<NetworkException, Map<String, dynamic>>> markAttendance(
    MarkAttendanceRequest request,
  );

  Future<Either<NetworkException, List<AttendanceSessionModel>>>
      getTeacherSessions();
}
