import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/models/timetable_model.dart';

abstract class TimetableRepository {
  Future<Either<NetworkException, List<TimetableEntryModel>>>
      getTeacherTimetable();
      
  Future<Either<NetworkException, List<TimetableEntryModel>>>
      getEnrollmentTimetable(String enrollmentId);
      
  Future<Either<NetworkException, TimetableEntryModel>> getTimetableEntry(
    String id,
  );
  
  Future<Either<NetworkException, TimetableEntryModel>> createTimetableEntry(
    CreateTimetableEntryRequest request,
  );
  
  Future<Either<NetworkException, TimetableEntryModel>> updateTimetableEntry(
    String id,
    UpdateTimetableEntryRequest request,
  );
  
  Future<Either<NetworkException, void>> deleteTimetableEntry(String id);
}
