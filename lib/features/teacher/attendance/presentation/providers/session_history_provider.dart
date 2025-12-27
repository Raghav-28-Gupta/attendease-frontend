import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/models/attendance_session_model.dart';
import './attendance_provider.dart';

// Enrollment Sessions Provider
final enrollmentSessionsProvider =
    FutureProvider.family<List<SessionWithDetails>, String>(
        (ref, enrollmentId) async {
  final repo = ref.watch(attendanceRepositoryProvider);
  // ✅ FIXED: Use fold to unwrap Either
  final result = await repo.getEnrollmentSessions(enrollmentId);

  return result.fold(
    (error) => throw NetworkException.getErrorMessage(error),
    (sessions) => sessions,
  );
});

// Session Details Provider
final sessionDetailsProvider =
    FutureProvider.family<Map<String, dynamic>, String>((ref, sessionId) async {
  final repository = ref.watch(attendanceRepositoryProvider);
  final result = await repository.getSessionDetails(sessionId);

  return result.fold(
    (error) => throw NetworkException.getErrorMessage(error),
    (details) => details,
  );
});
