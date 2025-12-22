import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/subject_model.dart';

abstract class SubjectRemoteDatasource {
  Future<List<SubjectModel>> getSubjects();
  Future<SubjectModel> getSubjectById(String id);
  Future<SubjectModel> createSubject(CreateSubjectRequest request);
  Future<SubjectModel> updateSubject(String id, UpdateSubjectRequest request);
  Future<void> deleteSubject(String id);
}

class SubjectRemoteDatasourceImpl implements SubjectRemoteDatasource {
  final Dio dio;

  SubjectRemoteDatasourceImpl(this.dio);

  @override
  Future<List<SubjectModel>> getSubjects() async {
    try {
      final response = await dio.get(ApiEndpoints.subjects);

      if (response.data['success'] == true) {
        final List data = response.data['data'] ?? [];
        return data.map((json) => SubjectModel.fromJson(json)).toList();
      } else {
        throw const NetworkException.defaultError('Failed to fetch subjects');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<SubjectModel> getSubjectById(String id) async {
    try {
      final response = await dio.get('${ApiEndpoints.subjects}/$id');

      if (response.data['success'] == true) {
        return SubjectModel.fromJson(response.data['data']);
      } else {
        throw const NetworkException.defaultError('Failed to fetch subject');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<SubjectModel> createSubject(CreateSubjectRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoints.subjects,
        data: request.toJson(),
      );

      if (response.data['success'] == true) {
        return SubjectModel.fromJson(response.data['data']);
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to create subject',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<SubjectModel> updateSubject(String id, UpdateSubjectRequest request) async {
    try {
      final response = await dio.put(
        '${ApiEndpoints.subjects}/$id',
        data: request.toJson(),
      );

      if (response.data['success'] == true) {
        return SubjectModel.fromJson(response.data['data']);
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to update subject',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<void> deleteSubject(String id) async {
    try {
      final response = await dio.delete('${ApiEndpoints.subjects}/$id');

      if (response.data['success'] != true) {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to delete subject',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
