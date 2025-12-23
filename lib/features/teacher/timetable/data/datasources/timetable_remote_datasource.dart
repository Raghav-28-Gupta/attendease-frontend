import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/timetable_model.dart';

abstract class TimetableRemoteDatasource {
  Future<List<TimetableEntryModel>> getTeacherTimetable();
  Future<List<TimetableEntryModel>> getEnrollmentTimetable(String enrollmentId);
  Future<TimetableEntryModel> getTimetableEntry(String id);
  Future<TimetableEntryModel> createTimetableEntry(
    CreateTimetableEntryRequest request,
  );
  Future<TimetableEntryModel> updateTimetableEntry(
    String id,
    UpdateTimetableEntryRequest request,
  );
  Future<void> deleteTimetableEntry(String id);
}

class TimetableRemoteDatasourceImpl implements TimetableRemoteDatasource {
  final Dio dio;

  TimetableRemoteDatasourceImpl(this.dio);

  @override
  Future<List<TimetableEntryModel>> getTeacherTimetable() async {
    try {
      final response = await dio.get(ApiEndpoints.teacherTimetable);

      if (response.data['success'] == true) {
        final List data = response.data['data'] ?? [];
        return data.map((json) => TimetableEntryModel.fromJson(json)).toList();
      } else {
        throw const NetworkException.defaultError(
          'Failed to fetch timetable',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<List<TimetableEntryModel>> getEnrollmentTimetable(
    String enrollmentId,
  ) async {
    try {
      final response = await dio.get(
        ApiEndpoints.enrollmentTimetable(enrollmentId),
      );

      if (response.data['success'] == true) {
        final List data = response.data['data'] ?? [];
        return data.map((json) => TimetableEntryModel.fromJson(json)).toList();
      } else {
        throw const NetworkException.defaultError(
          'Failed to fetch enrollment timetable',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<TimetableEntryModel> getTimetableEntry(String id) async {
    try {
      final response = await dio.get(ApiEndpoints.timetableEntry(id));

      if (response.data['success'] == true) {
        return TimetableEntryModel.fromJson(response.data['data']);
      } else {
        throw const NetworkException.defaultError(
          'Failed to fetch timetable entry',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<TimetableEntryModel> createTimetableEntry(
    CreateTimetableEntryRequest request,
  ) async {
    try {
      final response = await dio.post(
        ApiEndpoints.timetable,
        data: request.toJson(),
      );

      if (response.data['success'] == true) {
        return TimetableEntryModel.fromJson(response.data['data']);
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to create timetable entry',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<TimetableEntryModel> updateTimetableEntry(
    String id,
    UpdateTimetableEntryRequest request,
  ) async {
    try {
      final response = await dio.put(
        ApiEndpoints.timetableEntry(id),
        data: request.toJson(),
      );

      if (response.data['success'] == true) {
        return TimetableEntryModel.fromJson(response.data['data']);
      } else {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to update timetable entry',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }

  @override
  Future<void> deleteTimetableEntry(String id) async {
    try {
      final response = await dio.delete(ApiEndpoints.timetableEntry(id));

      if (response.data['success'] != true) {
        throw NetworkException.defaultError(
          response.data['message'] ?? 'Failed to delete timetable entry',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
