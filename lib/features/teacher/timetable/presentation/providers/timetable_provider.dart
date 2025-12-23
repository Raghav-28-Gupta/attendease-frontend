import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../data/datasources/timetable_remote_datasource.dart';
import '../../data/repositories/timetable_repository_impl.dart';
import '../../data/models/timetable_model.dart';
import '../../domain/repositories/timetable_repository.dart';

// Datasource Provider
final timetableRemoteDatasourceProvider =
    Provider<TimetableRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return TimetableRemoteDatasourceImpl(dio);
});

// Repository Provider
final timetableRepositoryProvider = Provider<TimetableRepository>((ref) {
  final remoteDatasource = ref.watch(timetableRemoteDatasourceProvider);
  return TimetableRepositoryImpl(remoteDatasource);
});

// Teacher Timetable Provider
final teacherTimetableProvider =
    FutureProvider<List<TimetableEntryModel>>((ref) async {
  final repository = ref.watch(timetableRepositoryProvider);
  final result = await repository.getTeacherTimetable();

  return result.fold(
    (error) => throw NetworkException.getErrorMessage(error),
    (entries) => entries,
  );
});

// Enrollment Timetable Provider
final enrollmentTimetableProvider = FutureProvider.family<
    List<TimetableEntryModel>,
    String>((ref, enrollmentId) async {
  final repository = ref.watch(timetableRepositoryProvider);
  final result = await repository.getEnrollmentTimetable(enrollmentId);

  return result.fold(
    (error) => throw NetworkException.getErrorMessage(error),
    (entries) => entries,
  );
});

// Timetable Operations Provider
final timetableOperationsProvider = StateNotifierProvider<
    TimetableOperationsNotifier,
    AsyncValue<TimetableEntryModel?>>((ref) {
  final repository = ref.watch(timetableRepositoryProvider);
  return TimetableOperationsNotifier(repository, ref);
});

class TimetableOperationsNotifier
    extends StateNotifier<AsyncValue<TimetableEntryModel?>> {
  final TimetableRepository _repository;
  final Ref _ref;

  TimetableOperationsNotifier(this._repository, this._ref)
      : super(const AsyncValue.data(null));

  Future<bool> createEntry(CreateTimetableEntryRequest request) async {
    state = const AsyncValue.loading();

    final result = await _repository.createTimetableEntry(request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Create timetable entry failed: $message');
        return false;
      },
      (entry) {
        state = AsyncValue.data(entry);
        AppLogger.info('Timetable entry created successfully');

        // Refresh timetable lists
        _ref.invalidate(teacherTimetableProvider);
        _ref.invalidate(enrollmentTimetableProvider);
        return true;
      },
    );
  }

  Future<bool> updateEntry(
    String id,
    UpdateTimetableEntryRequest request,
  ) async {
    state = const AsyncValue.loading();

    final result = await _repository.updateTimetableEntry(id, request);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Update timetable entry failed: $message');
        return false;
      },
      (entry) {
        state = AsyncValue.data(entry);
        AppLogger.info('Timetable entry updated successfully');

        // Refresh timetable lists
        _ref.invalidate(teacherTimetableProvider);
        _ref.invalidate(enrollmentTimetableProvider);
        return true;
      },
    );
  }

  Future<bool> deleteEntry(String id) async {
    state = const AsyncValue.loading();

    final result = await _repository.deleteTimetableEntry(id);

    return result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = AsyncValue.error(message, StackTrace.current);
        AppLogger.error('Delete timetable entry failed: $message');
        return false;
      },
      (_) {
        state = const AsyncValue.data(null);
        AppLogger.info('Timetable entry deleted successfully');

        // Refresh timetable lists
        _ref.invalidate(teacherTimetableProvider);
        _ref.invalidate(enrollmentTimetableProvider);
        return true;
      },
    );
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}
