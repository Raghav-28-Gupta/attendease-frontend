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
  Future<Either<NetworkException, TimetableModel>> getMyTimetable() async {
    try {
      final timetable = await remoteDatasource.getMyTimetable();
      AppLogger.info('✅ Timetable loaded successfully');
      return Right(timetable);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to load timetable: ${NetworkException.getErrorMessage(e)}');
      return Left(e);
    }
  }
}
