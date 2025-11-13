import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/models/teacher_dashboard_model.dart';

abstract class DashboardRepository {
  Future<Either<NetworkException, TeacherDashboardModel>> getTeacherDashboard();
}
