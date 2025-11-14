import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../data/datasources/dashboard_remote_datasource.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/repositories/dashboard_repository.dart';
import 'dashboard_state.dart';

// Datasource Provider
final studentDashboardRemoteDatasourceProvider =
    Provider<StudentDashboardRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return StudentDashboardRemoteDatasourceImpl(dio);
});

// Repository Provider
final studentDashboardRepositoryProvider =
    Provider<StudentDashboardRepository>((ref) {
  final remoteDatasource = ref.watch(studentDashboardRemoteDatasourceProvider);
  return StudentDashboardRepositoryImpl(remoteDatasource);
});

// State Provider
final studentDashboardProvider = StateNotifierProvider<
    StudentDashboardNotifier, StudentDashboardState>((ref) {
  final repository = ref.watch(studentDashboardRepositoryProvider);
  return StudentDashboardNotifier(repository);
});

class StudentDashboardNotifier extends StateNotifier<StudentDashboardState> {
  final StudentDashboardRepository repository;

  StudentDashboardNotifier(this.repository)
      : super(const StudentDashboardState.initial()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    state = const StudentDashboardState.loading();

    final result = await repository.getStudentDashboard();

    result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = StudentDashboardState.error(message);
        AppLogger.error('Student dashboard load failed: $message');
      },
      (data) {
        state = StudentDashboardState.loaded(data);
        AppLogger.info(
            'Student dashboard loaded: ${data.subjects.length} subjects');
      },
    );
  }

  Future<void> refresh() async {
    await loadDashboard();
  }
}
