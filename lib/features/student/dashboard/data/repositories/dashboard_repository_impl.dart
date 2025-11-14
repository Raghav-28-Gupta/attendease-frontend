import 'package:attendease_frontend/core/utils/logger.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../models/student_dashboard_model.dart';

class StudentDashboardRepositoryImpl implements StudentDashboardRepository {
  final StudentDashboardRemoteDatasource remoteDatasource;

  StudentDashboardRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<NetworkException, StudentDashboardModel>>
      getStudentDashboard() async {
    try {
      final result = await remoteDatasource.getStudentDashboard();
      AppLogger.info('✅ Dashboard repository: Data loaded successfully');
      return Right(result);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Dashboard repository: Network error', e);
      return Left(e);
    } catch (e) {
      AppLogger.error('❌ Dashboard repository: Unexpected error', e);
      return const Left(NetworkException.defaultError('Failed to load dashboard'));
    }
  }
}
