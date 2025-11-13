import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../models/teacher_dashboard_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDatasource remoteDatasource;

  DashboardRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<NetworkException, TeacherDashboardModel>>
      getTeacherDashboard() async {
    try {
      final dashboard = await remoteDatasource.getTeacherDashboard();
      AppLogger.info('✅ Dashboard loaded successfully');
      return Right(dashboard);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to load dashboard', e);
      return Left(e);
    }
  }
}
