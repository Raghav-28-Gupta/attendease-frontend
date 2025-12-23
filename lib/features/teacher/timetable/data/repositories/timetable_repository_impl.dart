import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/repositories/timetable_repository.dart';
import '../datasources/timetable_remote_datasource.dart';
import '../models/timetable_model.dart';

class TimetableRepositoryImpl implements TimetableRepository {
  final TimetableRemoteDatasource remoteDatasource;

  TimetableRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<NetworkException, List<TimetableEntryModel>>>
      getTeacherTimetable() async {
    try {
      final entries = await remoteDatasource.getTeacherTimetable();
      AppLogger.info('✅ Fetched ${entries.length} timetable entries');
      return Right(entries);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch timetable', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, List<TimetableEntryModel>>>
      getEnrollmentTimetable(String enrollmentId) async {
    try {
      final entries = await remoteDatasource.getEnrollmentTimetable(enrollmentId);
      AppLogger.info('✅ Fetched enrollment timetable');
      return Right(entries);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch enrollment timetable', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, TimetableEntryModel>> getTimetableEntry(
    String id,
  ) async {
    try {
      final entry = await remoteDatasource.getTimetableEntry(id);
      AppLogger.info('✅ Fetched timetable entry');
      return Right(entry);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch timetable entry', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, TimetableEntryModel>> createTimetableEntry(
    CreateTimetableEntryRequest request,
  ) async {
    try {
      final entry = await remoteDatasource.createTimetableEntry(request);
      AppLogger.info('✅ Created timetable entry');
      return Right(entry);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to create timetable entry', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, TimetableEntryModel>> updateTimetableEntry(
    String id,
    UpdateTimetableEntryRequest request,
  ) async {
    try {
      final entry = await remoteDatasource.updateTimetableEntry(id, request);
      AppLogger.info('✅ Updated timetable entry');
      return Right(entry);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to update timetable entry', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, void>> deleteTimetableEntry(String id) async {
    try {
      await remoteDatasource.deleteTimetableEntry(id);
      AppLogger.info('✅ Deleted timetable entry');
      return const Right(null);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to delete timetable entry', e);
      return Left(e);
    }
  }
}
