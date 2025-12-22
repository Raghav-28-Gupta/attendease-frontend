import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/repositories/subject_repository.dart';
import '../datasources/subject_remote_datasource.dart';
import '../models/subject_model.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectRemoteDatasource remoteDatasource;

  SubjectRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<NetworkException, List<SubjectModel>>> getSubjects() async {
    try {
      final subjects = await remoteDatasource.getSubjects();
      AppLogger.info('✅ Fetched ${subjects.length} subjects');
      return Right(subjects);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch subjects', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, SubjectModel>> getSubjectById(String id) async {
    try {
      final subject = await remoteDatasource.getSubjectById(id);
      AppLogger.info('✅ Fetched subject: ${subject.name}');
      return Right(subject);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch subject', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, SubjectModel>> createSubject(
    CreateSubjectRequest request,
  ) async {
    try {
      final subject = await remoteDatasource.createSubject(request);
      AppLogger.info('✅ Created subject: ${subject.name}');
      return Right(subject);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to create subject', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, SubjectModel>> updateSubject(
    String id,
    UpdateSubjectRequest request,
  ) async {
    try {
      final subject = await remoteDatasource.updateSubject(id, request);
      AppLogger.info('✅ Updated subject: ${subject.name}');
      return Right(subject);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to update subject', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, void>> deleteSubject(String id) async {
    try {
      await remoteDatasource.deleteSubject(id);
      AppLogger.info('✅ Deleted subject');
      return const Right(null);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to delete subject', e);
      return Left(e);
    }
  }
}
