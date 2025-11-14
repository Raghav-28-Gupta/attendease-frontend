import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/models/timetable_model.dart';

abstract class TimetableRepository {
  Future<Either<NetworkException, TimetableModel>> getMyTimetable();
}
