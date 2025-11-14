import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/models/student_dashboard_model.dart';

abstract class StudentDashboardRepository {
  Future<Either<NetworkException, StudentDashboardModel>>
      getStudentDashboard();
}
