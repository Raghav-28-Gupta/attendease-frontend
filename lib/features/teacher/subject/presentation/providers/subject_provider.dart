import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../data/datasources/subject_remote_datasource.dart';
import '../../data/repositories/subject_repository_impl.dart';
import '../../data/models/subject_model.dart';
import '../../domain/repositories/subject_repository.dart';

// Datasource Provider
final subjectRemoteDatasourceProvider = Provider<SubjectRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return SubjectRemoteDatasourceImpl(dio);
});

// Repository Provider
final subjectRepositoryProvider = Provider<SubjectRepository>((ref) {
  final remoteDatasource = ref.watch(subjectRemoteDatasourceProvider);
  return SubjectRepositoryImpl(remoteDatasource);
});

// Subjects List Provider
final subjectsProvider = FutureProvider<List<SubjectModel>>((ref) async {
  final repository = ref.watch(subjectRepositoryProvider);
  final result = await repository.getSubjects();

  return result.fold(
    (error) => throw NetworkException.getErrorMessage(error),
    (subjects) => subjects,
  );
});

// Subject Operations Provider
final subjectOperationsProvider =
    StateNotifierProvider<SubjectOperationsNotifier, AsyncValue<SubjectModel?>>(
  (ref) {
    final repository = ref.watch(subjectRepositoryProvider);
    return SubjectOperationsNotifier(repository, ref);
  },
);

class SubjectOperationsNotifier extends StateNotifier<AsyncValue<SubjectModel?>> {
  final SubjectRepository _repository;
  final Ref _ref;

  SubjectOperationsNotifier(this._repository, this._ref)
      : super(const AsyncValue.data(null));

  Future<bool> createSubject(CreateSubjectRequest request) async {
    state = const AsyncValue.loading();

    final result = await _repository.createSubject(request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Subject creation failed: $message');
        return false;
      },
      (subject) {
        state = AsyncValue.data(subject);
        AppLogger.info('Subject created successfully: ${subject.name}');
        
        // Refresh subjects list
        _ref.invalidate(subjectsProvider);
        return true;
      },
    );
  }

  Future<bool> updateSubject(String id, UpdateSubjectRequest request) async {
    state = const AsyncValue.loading();

    final result = await _repository.updateSubject(id, request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Subject update failed: $message');
        return false;
      },
      (subject) {
        state = AsyncValue.data(subject);
        AppLogger.info('Subject updated successfully: ${subject.name}');
        
        // Refresh subjects list
        _ref.invalidate(subjectsProvider);
        return true;
      },
    );
  }

  Future<bool> deleteSubject(String id) async {
    state = const AsyncValue.loading();

    final result = await _repository.deleteSubject(id);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Subject deletion failed: $message');
        return false;
      },
      (_) {
        state = const AsyncValue.data(null);
        AppLogger.info('Subject deleted successfully');
        
        // Refresh subjects list
        _ref.invalidate(subjectsProvider);
        return true;
      },
    );
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}
