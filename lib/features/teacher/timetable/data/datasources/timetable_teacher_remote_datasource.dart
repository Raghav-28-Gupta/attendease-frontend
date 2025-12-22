import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/create_timetable_model.dart';

abstract class TeacherTimetableRemoteDatasource {
  Future<void> createEntry(CreateTimetableEntryRequest request);
}

class TeacherTimetableRemoteDatasourceImpl
    implements TeacherTimetableRemoteDatasource {
  final Dio dio;
  TeacherTimetableRemoteDatasourceImpl(this.dio);

  @override
  Future<void> createEntry(CreateTimetableEntryRequest request) async {
    try {
      final resp = await dio.post(
        ApiEndpoints.timetable,
        data: request.toJson(),
      );
      if (resp.data['success'] != true) {
        throw NetworkException.defaultError(
          resp.data['message'] ?? 'Failed to create timetable entry',
        );
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
