import 'dart:io';
import 'package:attendease_frontend/features/teacher/students/data/models/student_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/repositories/student_repository.dart';
import '../datasources/student_remote_datasource.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentRemoteDatasource remoteDatasource;

  StudentRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<NetworkException, Map<String, dynamic>>> importStudentsToBatch(
    String batchId,
    File csvFile,
  ) async {
    try {
      final result = await remoteDatasource.importStudentsToBatch(
        batchId,
        csvFile,
      );
      AppLogger.info('✅ Students imported to batch $batchId successfully');
      return Right(result);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to import students to batch', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, List<dynamic>>> getStudentsByBatch(
    String batchId,
  ) async {
    try {
      final students = await remoteDatasource.getStudentsByBatch(batchId);
      AppLogger.info('✅ Fetched ${students.length} students from batch');
      return Right(students);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch students', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, dynamic>> getStudentById(String id) async {
    try {
      final student = await remoteDatasource.getStudentById(id);
      AppLogger.info('✅ Fetched student');
      return Right(student);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch student', e);
      return Left(e);
    }
  }

  @override
  Future<Either<NetworkException, List<StudentModel>>> getEnrollmentStudents(
    String enrollmentId,
  ) async {
    try {
      final students =
          await remoteDatasource.getEnrollmentStudents(enrollmentId);
      AppLogger.info('✅ Fetched ${students.length} students from enrollment');
      return Right(students);
    } on NetworkException catch (e) {
      AppLogger.error('❌ Failed to fetch enrollment students', e);
      return Left(e);
    }
  }
}
