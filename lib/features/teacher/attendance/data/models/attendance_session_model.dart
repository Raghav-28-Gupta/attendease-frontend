import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_session_model.freezed.dart';
part 'attendance_session_model.g.dart';

@freezed
class AttendanceSessionModel with _$AttendanceSessionModel {
  const factory AttendanceSessionModel({
    required String id,
    required String subjectEnrollmentId,
    required String teacherId,
    required DateTime date,
    required String startTime,
    required String endTime,
    required String type,
    required DateTime createdAt,
  }) = _AttendanceSessionModel;

  factory AttendanceSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSessionModelFromJson(json);
}

@freezed
class CreateSessionRequest with _$CreateSessionRequest {
  const factory CreateSessionRequest({
    required String subjectEnrollmentId,
    required String date, // "YYYY-MM-DD"
    required String startTime, // "HH:MM:SS"
    required String endTime,
    String? type,
  }) = _CreateSessionRequest;

  factory CreateSessionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSessionRequestFromJson(json);
}

@freezed
class StudentAttendanceModel with _$StudentAttendanceModel {
  const factory StudentAttendanceModel({
    required String id,
    required String sessionId,
    required String studentId,
    required String status,
    required DateTime markedAt,
    required StudentInfo student,
  }) = _StudentAttendanceModel;

  factory StudentAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendanceModelFromJson(json);
}

@freezed
class StudentInfo with _$StudentInfo {
  const factory StudentInfo({
    required String id,
    required String studentId,
    required String firstName,
    required String lastName,
  }) = _StudentInfo;

  const StudentInfo._();

  String get fullName => '$firstName $lastName';

  factory StudentInfo.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoFromJson(json);
}

@freezed
class MarkAttendanceRequest with _$MarkAttendanceRequest {
  const factory MarkAttendanceRequest({
    required String sessionId,
    required List<AttendanceRecord> records,
  }) = _MarkAttendanceRequest;

  factory MarkAttendanceRequest.fromJson(Map<String, dynamic> json) =>
      _$MarkAttendanceRequestFromJson(json);
}

@freezed
class AttendanceRecord with _$AttendanceRecord {
  const factory AttendanceRecord({
    required String studentId,
    required String status,
  }) = _AttendanceRecord;

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordFromJson(json);
}
