import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/enrollment_model.dart';

abstract class EnrollmentRemoteDatasource {
  /// Get ALL enrollments for authenticated teacher
  Future<List<EnrollmentModel>> getMyEnrollments();

  /// Get enrollments for a specific subject
  Future<List<EnrollmentModel>> getSubjectEnrollments(String subjectId);
  
  /// Get subjects a batch is enrolled in
  Future<List<EnrollmentModel>> getBatchSubjects(String batchId);
  
  /// Get specific enrollment by ID
  Future<EnrollmentModel> getEnrollmentById(String id);
  
  /// Enroll multiple batches to a subject
  Future<EnrollBatchesResponse> enrollBatches(EnrollBatchesRequest request);
  
  /// Delete enrollment
  Future<void> deleteEnrollment(String id);
}

class EnrollmentRemoteDatasourceImpl implements EnrollmentRemoteDatasource {
  final Dio dio;

  EnrollmentRemoteDatasourceImpl(this.dio);

  @override
  Future<List<EnrollmentModel>> getMyEnrollments() async {  // ✅ ADD THIS METHOD
    try {
      final response = await dio.get(ApiEndpoints.myEnrollments);

      if (response.data['success'] == true) {
        final List data = response.data['data'] ?? [];
        return data.map((json) => EnrollmentModel.fromJson(json)).toList();
      } else {
        throw const NetworkException.defaultError('Failed to fetch enrollments');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<List<EnrollmentModel>> getSubjectEnrollments(String subjectId) async {
    try {
      final response = await dio.get(ApiEndpoints.subjectEnrollments(subjectId));

      if (response.data['success'] == true) {
        final List data = response.data['data'] ?? [];
        return data.map((json) => EnrollmentModel.fromJson(json)).toList();
      } else {
        throw const NetworkException.defaultError('Failed to fetch enrollments');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<List<EnrollmentModel>> getBatchSubjects(String batchId) async {
    try {
      // ✅ Use your existing endpoint helper
      final response = await dio.get(ApiEndpoints.batchSubjects(batchId));

      if (response.data['success'] == true) {
        final List data = response.data['data'] ?? [];
        return data.map((json) => EnrollmentModel.fromJson(json)).toList();
      } else {
        throw const NetworkException.defaultError('Failed to fetch batch subjects');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<EnrollmentModel> getEnrollmentById(String id) async {
    try {
      final response = await dio.get(ApiEndpoints.enrollmentById(id));

      if (response.data['success'] == true) {
        return EnrollmentModel.fromJson(response.data['data']);
      } else {
        throw const NetworkException.defaultError('Failed to fetch enrollment');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<EnrollBatchesResponse> enrollBatches(EnrollBatchesRequest request) async {
    try {
      // ✅ POST to /enrollments with batchIds array
      final response = await dio.post(
        ApiEndpoints.enrollments,
        data: request.toJson(),
      );

      if (response.data['success'] == true) {
        // Backend returns: { success, message, enrollments: [...] }
        return EnrollBatchesResponse(
          message: response.data['message'] ?? 'Batches enrolled successfully',
          enrollments: (response.data['enrollments'] as List)
              .map((e) => EnrollmentModel.fromJson(e))
              .toList(),
        );
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to enroll batches',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<void> deleteEnrollment(String id) async {
    try {
      final response = await dio.delete('${ApiEndpoints.enrollments}/$id');

      if (response.data['success'] != true) {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to delete enrollment',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
