import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/models/subject_model.dart';

abstract class SubjectRepository {
  Future<Either<NetworkException, List<SubjectModel>>> getSubjects();
  Future<Either<NetworkException, SubjectModel>> getSubjectById(String id);
  Future<Either<NetworkException, SubjectModel>> createSubject(
    CreateSubjectRequest request,
  );
  Future<Either<NetworkException, SubjectModel>> updateSubject(
    String id,
    UpdateSubjectRequest request,
  );
  Future<Either<NetworkException, void>> deleteSubject(String id);
}
