import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../dashboard/data/models/teacher_dashboard_model.dart';

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

@freezed
class SessionWithDetails with _$SessionWithDetails {
  const factory SessionWithDetails({
    required String id,
    required String subjectEnrollmentId,
    required String teacherId,
    required DateTime date,
    required String startTime,
    required String endTime,
    String? type, 
    required DateTime createdAt,
    required DateTime updatedAt,
    required SubjectEnrollmentDetailInfo subjectEnrollment,
    @JsonKey(name: '_count') required SessionRecordsCount count,
  }) = _SessionWithDetails;

  const SessionWithDetails._();

  String get sessionType => type ?? 'REGULAR';

  factory SessionWithDetails.fromJson(Map<String, dynamic> json) =>
      _$SessionWithDetailsFromJson(json);
}

@freezed
class SubjectEnrollmentDetailInfo with _$SubjectEnrollmentDetailInfo {
  const factory SubjectEnrollmentDetailInfo({
    required String id, 
    required AttendanceSubjectInfo subject,
    required AttendanceBatchInfo batch,
    required AttendanceTeacherInfo teacher,
  }) = _SubjectEnrollmentDetailInfo;

  factory SubjectEnrollmentDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$SubjectEnrollmentDetailInfoFromJson(json);
}

@freezed
class AttendanceSubjectInfo with _$AttendanceSubjectInfo {
  const factory AttendanceSubjectInfo({
    required String id,
    required String code,
    required String name,
  }) = _AttendanceSubjectInfo;

  factory AttendanceSubjectInfo.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSubjectInfoFromJson(json);
}

@freezed
class AttendanceBatchInfo with _$AttendanceBatchInfo {
  const factory AttendanceBatchInfo({
    required String id,
    required String code,
    required String name,
  }) = _AttendanceBatchInfo;

  factory AttendanceBatchInfo.fromJson(Map<String, dynamic> json) =>
      _$AttendanceBatchInfoFromJson(json);
}

@freezed
class AttendanceTeacherInfo with _$AttendanceTeacherInfo {
  const factory AttendanceTeacherInfo({
    required String id,
    required String firstName,
    required String lastName,
    required String employeeId,
  }) = _AttendanceTeacherInfo;

  const AttendanceTeacherInfo._();

  String get fullName => '$firstName $lastName';

  factory AttendanceTeacherInfo.fromJson(Map<String, dynamic> json) =>
      _$AttendanceTeacherInfoFromJson(json);
}

@freezed
class SessionRecordsCount with _$SessionRecordsCount {
  const factory SessionRecordsCount({
    @JsonKey(name: 'records') required int records,
  }) = _SessionRecordsCount;

  factory SessionRecordsCount.fromJson(Map<String, dynamic> json) =>
      _$SessionRecordsCountFromJson(json);
}

@freezed
class AttendanceRecordDetail with _$AttendanceRecordDetail {
  const factory AttendanceRecordDetail({
    required String id,
    required String sessionId,
    required String studentId,
    required String status,
    required DateTime markedAt,
    required StudentInfo student,
  }) = _AttendanceRecordDetail;

  factory AttendanceRecordDetail.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordDetailFromJson(json);
}

@freezed
class TeacherInfo with _$TeacherInfo {
  const factory TeacherInfo({
    required String id,
    required String firstName,
    required String lastName,
    required String employeeId,
  }) = _TeacherInfo;

  const TeacherInfo._();

  String get fullName => '$firstName $lastName';

  factory TeacherInfo.fromJson(Map<String, dynamic> json) =>
      _$TeacherInfoFromJson(json);
}