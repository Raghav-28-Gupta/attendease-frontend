import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../data/datasources/dashboard_remote_datasource.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/repositories/dashboard_repository.dart';
import 'dashboard_state.dart';

// Dashboard Remote Datasource Provider
final dashboardRemoteDatasourceProvider =
    Provider<DashboardRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return DashboardRemoteDatasourceImpl(dio);
});

// Dashboard Repository Provider
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  final remoteDatasource = ref.watch(dashboardRemoteDatasourceProvider);
  return DashboardRepositoryImpl(remoteDatasource);
});

// Dashboard State Provider
final teacherDashboardProvider = StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return DashboardNotifier(repository);
});

class DashboardNotifier extends StateNotifier<DashboardState> {
  final DashboardRepository _repository;

  DashboardNotifier(this._repository) : super(const DashboardState.initial()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    state = const DashboardState.loading();

    final result = await _repository.getTeacherDashboard();

    result.fold(
      (error) {
        final message = NetworkException.getErrorMessage(error);
        state = DashboardState.error(message);
        AppLogger.error('Dashboard load failed: $message');
      },
      (data) {
        state = DashboardState.loaded(data);
        AppLogger.info('Dashboard loaded: ${data.enrollments.length} enrollments');
      },
    );
  }

  Future<void> refresh() async {
    await loadDashboard();
  }
}
