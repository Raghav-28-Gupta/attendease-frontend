import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../data/datasources/attendance_remote_datasource.dart';
import '../../data/repositories/attendance_repository_impl.dart';
import '../../data/models/attendance_session_model.dart';
import '../../domain/repositories/attendance_repository.dart';

// Datasource Provider
final attendanceRemoteDatasourceProvider =
    Provider<AttendanceRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return AttendanceRemoteDatasourceImpl(dio);
});

// Repository Provider
final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  final remoteDatasource = ref.watch(attendanceRemoteDatasourceProvider);
  return AttendanceRepositoryImpl(remoteDatasource);
});

// Create Session Provider
final createSessionProvider =
    StateNotifierProvider<CreateSessionNotifier, AsyncValue<Map<String, dynamic>>>(
  (ref) {
    final repository = ref.watch(attendanceRepositoryProvider);
    return CreateSessionNotifier(repository);
  },
);

class CreateSessionNotifier
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final AttendanceRepository _repository;

  CreateSessionNotifier(this._repository) : super(const AsyncValue.data({}));

  Future<bool> createSession(CreateSessionRequest request) async {
    state = const AsyncValue.loading();

    final result = await _repository.createSession(request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Session creation failed: $message');
        return false;
      },
      (data) {
        state = AsyncValue.data(data);
        AppLogger.info('Session created successfully');
        return true;
      },
    );
  }

  void reset() {
    state = const AsyncValue.data({});
  }
}

// Session Students Provider
final sessionStudentsProvider = FutureProvider.family<
    List<StudentAttendanceModel>,
    String>((ref, sessionId) async {
  final repository = ref.watch(attendanceRepositoryProvider);
  final result = await repository.getSessionStudents(sessionId);

  return result.fold(
    (error) => throw NetworkException.getErrorMessage(error),
    (students) => students,
  );
});

// Mark Attendance Provider
final markAttendanceProvider =
    StateNotifierProvider<MarkAttendanceNotifier, AsyncValue<bool>>((ref) {
  final repository = ref.watch(attendanceRepositoryProvider);
  return MarkAttendanceNotifier(repository);
});

class MarkAttendanceNotifier extends StateNotifier<AsyncValue<bool>> {
  final AttendanceRepository _repository;

  MarkAttendanceNotifier(this._repository) : super(const AsyncValue.data(false));

  Future<bool> markAttendance(MarkAttendanceRequest request) async {
    state = const AsyncValue.loading();

    final result = await _repository.markAttendance(request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Mark attendance failed: $message');
        return false;
      },
      (data) {
        state = const AsyncValue.data(true);
        AppLogger.info('Attendance marked successfully');
        return true;
      },
    );
  }

  void reset() {
    state = const AsyncValue.data(false);
  }
}

// Teacher Sessions Provider
final teacherSessionsProvider =
    FutureProvider<List<AttendanceSessionModel>>((ref) async {
  final repository = ref.watch(attendanceRepositoryProvider);
  final result = await repository.getTeacherSessions();

  return result.fold(
    (error) => throw NetworkException.getErrorMessage(error),
    (sessions) => sessions,
  );
});
