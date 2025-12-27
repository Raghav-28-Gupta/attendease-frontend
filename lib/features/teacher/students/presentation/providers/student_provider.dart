import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../data/datasources/student_remote_datasource.dart';
import '../../data/repositories/student_repository_impl.dart';
import '../../domain/repositories/student_repository.dart';
import '../../data/models/student_model.dart';

// Datasource Provider
final studentRemoteDatasourceProvider =
    Provider<StudentRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return StudentRemoteDatasourceImpl(dio);
});

// Repository Provider
final studentRepositoryProvider = Provider<StudentRepository>((ref) {
  final remoteDatasource = ref.watch(studentRemoteDatasourceProvider);
  return StudentRepositoryImpl(remoteDatasource);
});

// Import Students Provider (now requires batchId)
final importStudentsProvider = StateNotifierProvider<ImportStudentsNotifier,
    AsyncValue<Map<String, dynamic>?>>(
  (ref) {
    final repository = ref.watch(studentRepositoryProvider);
    return ImportStudentsNotifier(repository);
  },
);

class ImportStudentsNotifier
    extends StateNotifier<AsyncValue<Map<String, dynamic>?>> {
  final StudentRepository _repository;

  ImportStudentsNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<bool> importCSV(String batchId, File csvFile) async {
    state = const AsyncValue.loading();

    final result = await _repository.importStudentsToBatch(batchId, csvFile);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Import failed: $message');
        return false;
      },
      (data) {
        state = AsyncValue.data(data);
        AppLogger.info('Import successful: ${data['imported']} students');
        return true;
      },
    );
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

// Students by Batch Provider
final studentsByBatchProvider = FutureProvider.family<List<dynamic>, String>(
  (ref, batchId) async {
    final repository = ref.watch(studentRepositoryProvider);
    final result = await repository.getStudentsByBatch(batchId);

    return result.fold(
      (error) => throw NetworkException.getErrorMessage(error),
      (students) => students,
    );
  },
);

final enrollmentStudentsProvider =
    FutureProvider.family<List<StudentModel>, String>(
        (ref, enrollmentId) async {
  final repo = ref.watch(studentRepositoryProvider);
  final result = await repo.getEnrollmentStudents(enrollmentId);
  return result.fold(
    (error) => throw error,
    (students) => students,
  );
});
