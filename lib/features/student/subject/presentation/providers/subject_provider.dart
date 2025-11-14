import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/datasources/subject_datasource.dart';
import '../../data/models/subject_attendance_model.dart';

// Datasource Provider
final subjectRemoteDatasourceProvider = Provider<SubjectRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return SubjectRemoteDatasourceImpl(dio);
});

// Subject Attendance Provider
final subjectAttendanceProvider = FutureProvider.family<
    SubjectAttendanceDetail,
    String>((ref, subjectCode) async {
  final datasource = ref.watch(subjectRemoteDatasourceProvider);
  
  try {
    return await datasource.getSubjectAttendance(subjectCode);
  } catch (e) {
    if (e is NetworkException) {
      throw NetworkException.getErrorMessage(e);
    }
    throw e.toString();
  }
});
