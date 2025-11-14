import 'package:dio/dio.dart';
import '../../../../../core/network/api_endpoints.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../models/timetable_model.dart';

abstract class TimetableRemoteDatasource {
  Future<TimetableModel> getMyTimetable();
}

class TimetableRemoteDatasourceImpl implements TimetableRemoteDatasource {
  final Dio dio;

  TimetableRemoteDatasourceImpl(this.dio);

  @override
  Future<TimetableModel> getMyTimetable() async {
    try {
      final response = await dio.get(ApiEndpoints.myTimetable);
      
      if (response.data['success'] == true) {
        return TimetableModel.fromJson(response.data['data']);
      } else {
        throw const NetworkException.defaultError('Failed to load timetable');
      }
    } on DioException catch (e) {
      throw NetworkException.getDioException(e);
    }
  }
}
