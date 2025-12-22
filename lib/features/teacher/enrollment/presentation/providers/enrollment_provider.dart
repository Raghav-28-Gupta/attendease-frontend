import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../data/datasources/enrollment_remote_datasource.dart';
import '../../data/repositories/enrollment_repository_impl.dart';
import '../../data/models/enrollment_model.dart';
import '../../domain/repositories/enrollment_repository.dart';

// Datasource
final enrollmentRemoteDatasourceProvider =
    Provider<EnrollmentRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return EnrollmentRemoteDatasourceImpl(dio);
});

// Repository
final enrollmentRepositoryProvider = Provider<EnrollmentRepository>((ref) {
  final ds = ref.watch(enrollmentRemoteDatasourceProvider);
  return EnrollmentRepositoryImpl(ds);
});

final myEnrollmentsProvider = FutureProvider<List<EnrollmentModel>>(
  (ref) async {
    final repo = ref.watch(enrollmentRepositoryProvider);
    final result = await repo.getMyEnrollments();
    return result.fold(
      (e) => throw NetworkException.getErrorMessage(e),
      (data) => data,
    );
  },
);

// ✅ Get enrollments for a SPECIFIC SUBJECT
final subjectEnrollmentsProvider = FutureProvider.family<List<EnrollmentModel>, String>(
  (ref, subjectId) async {
    final repo = ref.watch(enrollmentRepositoryProvider);
    final result = await repo.getSubjectEnrollments(subjectId);
    return result.fold(
      (e) => throw NetworkException.getErrorMessage(e),
      (data) => data,
    );
  },
);

// ✅ Get subjects for a SPECIFIC BATCH
final batchSubjectsProvider = FutureProvider.family<List<EnrollmentModel>, String>(
  (ref, batchId) async {
    final repo = ref.watch(enrollmentRepositoryProvider);
    final result = await repo.getBatchSubjects(batchId);
    return result.fold(
      (e) => throw NetworkException.getErrorMessage(e),
      (data) => data,
    );
  },
);

// Operations
final enrollmentOpsProvider =
    StateNotifierProvider<EnrollmentOpsNotifier, EnrollmentOpsState>(
  (ref) {
    final repo = ref.watch(enrollmentRepositoryProvider);
    return EnrollmentOpsNotifier(repo, ref);
  },
);

class EnrollmentOpsState {
  final bool isLoading;
  final String? error;
  final EnrollBatchesResponse? lastResponse;

  EnrollmentOpsState({
    this.isLoading = false,
    this.error,
    this.lastResponse,
  });

  EnrollmentOpsState copyWith({
    bool? isLoading,
    String? error,
    EnrollBatchesResponse? lastResponse,
  }) {
    return EnrollmentOpsState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      lastResponse: lastResponse ?? this.lastResponse,
    );
  }
}

class EnrollmentOpsNotifier extends StateNotifier<EnrollmentOpsState> {
  final EnrollmentRepository _repo;
  final Ref _ref;

  EnrollmentOpsNotifier(this._repo, this._ref) : super(EnrollmentOpsState());

  Future<bool> enrollBatches(EnrollBatchesRequest req) async {
    state = state.copyWith(isLoading: true, error: null);
    
    final res = await _repo.enrollBatches(req);
    
    return res.fold(
      (e) {
        final msg = NetworkException.getErrorMessage(e);
        state = state.copyWith(isLoading: false, error: msg);
        AppLogger.error('enrollBatches failed: $msg');
        return false;
      },
      (response) {
        state = state.copyWith(isLoading: false, lastResponse: response);
        // Invalidate the subject enrollments provider
        _ref.invalidate(subjectEnrollmentsProvider(req.subjectId));
        return true;
      },
    );
  }

  Future<bool> deleteEnrollment(String id, String subjectId) async {
    state = state.copyWith(isLoading: true, error: null);
    
    final res = await _repo.deleteEnrollment(id);
    
    return res.fold(
      (e) {
        final msg = NetworkException.getErrorMessage(e);
        state = state.copyWith(isLoading: false, error: msg);
        AppLogger.error('deleteEnrollment failed: $msg');
        return false;
      },
      (_) {
        state = state.copyWith(isLoading: false);
        // Invalidate the subject enrollments provider
        _ref.invalidate(subjectEnrollmentsProvider(subjectId));
        return true;
      },
    );
  }

  void reset() => state = EnrollmentOpsState();
}