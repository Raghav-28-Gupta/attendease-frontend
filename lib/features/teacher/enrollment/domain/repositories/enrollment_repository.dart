import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/models/enrollment_model.dart';

abstract class EnrollmentRepository {
  Future<Either<NetworkException, List<EnrollmentModel>>> getMyEnrollments();
  Future<Either<NetworkException, List<EnrollmentModel>>> getSubjectEnrollments(String subjectId);
  Future<Either<NetworkException, List<EnrollmentModel>>> getBatchSubjects(String batchId);
  Future<Either<NetworkException, EnrollmentModel>> getEnrollmentById(String id);
  Future<Either<NetworkException, EnrollBatchesResponse>> enrollBatches(EnrollBatchesRequest request,);
  Future<Either<NetworkException, void>> deleteEnrollment(String id);
}
