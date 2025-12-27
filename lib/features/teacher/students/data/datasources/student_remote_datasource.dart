import 'dart:io';
import 'package:attendease_frontend/features/teacher/students/data/models/student_model.dart';
import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';

abstract class StudentRemoteDatasource {
  Future<Map<String, dynamic>> importStudentsToBatch(
    String batchId,
    File csvFile,
  );
  Future<List<dynamic>> getStudentsByBatch(String batchId);
  Future<dynamic> getStudentById(String id);
  Future<List<StudentModel>> getEnrollmentStudents(String enrollmentId);
}

class StudentRemoteDatasourceImpl implements StudentRemoteDatasource {
  final Dio dio;

  StudentRemoteDatasourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> importStudentsToBatch(
    String batchId,
    File csvFile,
  ) async {
    try {
      final formData = FormData.fromMap({
        'csv': await MultipartFile.fromFile(
          csvFile.path,
          filename: 'students.csv',
        ),
      });

      final response = await dio.post(
        ApiEndpoints.importStudents(batchId),
        data: formData,
      );

      if (response.data['success'] == true) {
        final data = response.data['data'] as Map<String, dynamic>;

        return {
          'imported': data['successful'] ?? 0,
          'skipped': data['failed'] ?? 0,
          'errors': data['errors'] ?? [],
          'students': data['students'] ?? [],
        };
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to import students',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<List<dynamic>> getStudentsByBatch(String batchId) async {
    try {
      final response = await dio.get(
        ApiEndpoints.batchStudents(batchId),
      );

      if (response.data['success'] == true) {
        return response.data['data'] as List<dynamic>;
      } else {
        throw const NetworkException.defaultError('Failed to fetch students');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<dynamic> getStudentById(String id) async {
    try {
      final response = await dio.get(ApiEndpoints.studentById(id));

      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw const NetworkException.defaultError('Failed to fetch student');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  // Add this method to StudentRemoteDatasourceImpl class

  Future<List<StudentModel>> getEnrollmentStudents(String enrollmentId) async {
    try {
      final response = await dio.get(
        '${ApiEndpoints.baseUrl}/enrollments/$enrollmentId/students',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        return data.map((json) => StudentModel.fromJson(json)).toList();
      } else {
        throw NetworkException.badRequest(
          response.data['message'] ?? 'Failed to fetch students',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
