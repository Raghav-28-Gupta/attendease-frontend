import 'package:attendease_frontend/features/teacher/students/data/models/student_model.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';
import '../../../../../core/network/network_exceptions.dart';

abstract class StudentRepository {
  Future<Either<NetworkException, Map<String, dynamic>>> importStudentsToBatch(
    String batchId,
    File csvFile,
  );
  
  Future<Either<NetworkException, List<dynamic>>> getStudentsByBatch(
    String batchId,
  );
  
  Future<Either<NetworkException, dynamic>> getStudentById(String id);

  Future<Either<NetworkException, List<StudentModel>>> getEnrollmentStudents(
    String enrollmentId,
  );
}
