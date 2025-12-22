import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/repositories/enrollment_repository.dart';
import '../datasources/enrollment_remote_datasource.dart';
import '../models/enrollment_model.dart';

class EnrollmentRepositoryImpl implements EnrollmentRepository {
  final EnrollmentRemoteDatasource remoteDatasource;

  EnrollmentRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<NetworkException, List<EnrollmentModel>>> getSubjectEnrollments(String subjectId,) async {
    try {
      final enrollments = await remoteDatasource.getSubjectEnrollments(subjectId);
      AppLogger.info('✅ Fetched ${enrollments.length} enrollments for subject');
      return Right(enrollments);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch enrollments', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, List<EnrollmentModel>>> getBatchSubjects (String batchId,) async {
    try {
      final enrollments = await remoteDatasource.getBatchSubjects(batchId);
      AppLogger.info('✅ Fetched ${enrollments.length} subjects for batch');
      return Right(enrollments);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch batch subjects', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, EnrollmentModel>> getEnrollmentById(String id,) async {
    try {
      final enrollment = await remoteDatasource.getEnrollmentById(id);
      AppLogger.info('✅ Fetched enrollment ${enrollment.id}');
      return Right(enrollment);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch enrollment', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, EnrollBatchesResponse>> enrollBatches(
    EnrollBatchesRequest request,
  ) async {
    try {
      final response = await remoteDatasource.enrollBatches(request);
      AppLogger.info('✅ Enrolled ${response.enrollments.length} batches');
      return Right(response);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to enroll batches', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, void>> deleteEnrollment(String id) async {
    try {
      await remoteDatasource.deleteEnrollment(id);
      AppLogger.info('✅ Deleted enrollment $id');
      return const Right(null);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to delete enrollment', e);
      return Left(e);
    }
  }
}
