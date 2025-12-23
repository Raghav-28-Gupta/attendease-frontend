import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_dashboard_model.freezed.dart';
part 'teacher_dashboard_model.g.dart';

@freezed
class TeacherDashboardModel with _$TeacherDashboardModel {
  const factory TeacherDashboardModel({
    required List<EnrollmentInfo> enrollments,
    required DashboardStats stats,
    required List<RecentSession> recentSessions,
    required List<LowAttendanceStudent> lowAttendanceStudents,
  }) = _TeacherDashboardModel;

  factory TeacherDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherDashboardModelFromJson(json);
}

@freezed
class EnrollmentInfo with _$EnrollmentInfo {
  const factory EnrollmentInfo({
    required String id,
    required SubjectInfo subject,
    required BatchInfo batch,
    required EnrollmentStats stats,
  }) = _EnrollmentInfo;

  factory EnrollmentInfo.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentInfoFromJson(json);
}

@freezed
class SubjectInfo with _$SubjectInfo {
  const factory SubjectInfo({
    required String code,
    required String name,
    required String semester,
  }) = _SubjectInfo;

  factory SubjectInfo.fromJson(Map<String, dynamic> json) =>
      _$SubjectInfoFromJson(json);
}

@freezed
class BatchInfo with _$BatchInfo {
  const factory BatchInfo({
    required String code,
    required String name,
    required int studentCount,
  }) = _BatchInfo;

  factory BatchInfo.fromJson(Map<String, dynamic> json) =>
      _$BatchInfoFromJson(json);
}

@freezed
class EnrollmentStats with _$EnrollmentStats {
  const factory EnrollmentStats({
    required int sessionsHeld,
    required double averageAttendance,
    DateTime? lastSession,
  }) = _EnrollmentStats;

  factory EnrollmentStats.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentStatsFromJson(json);
}

@freezed
class RecentSession with _$RecentSession {
  const factory RecentSession({
    required String id,
    required DateTime date,
    required String startTime,
    required String endTime,
    required SubjectEnrollmentInfo subjectEnrollment,
    required RecordsCount count,
  }) = _RecentSession;

  factory RecentSession.fromJson(Map<String, dynamic> json) =>
      _$RecentSessionFromJson(json);
}

@freezed
class SubjectEnrollmentInfo with _$SubjectEnrollmentInfo {
  const factory SubjectEnrollmentInfo({
    required SubjectInfo subject,
    required BatchInfo batch,
  }) = _SubjectEnrollmentInfo;

  factory SubjectEnrollmentInfo.fromJson(Map<String, dynamic> json) =>
      _$SubjectEnrollmentInfoFromJson(json);
}

@freezed
class RecordsCount with _$RecordsCount {
  const factory RecordsCount({
    required int records,
  }) = _RecordsCount;

  factory RecordsCount.fromJson(Map<String, dynamic> json) =>
      _$RecordsCountFromJson(json);
}

@freezed
class LowAttendanceStudent with _$LowAttendanceStudent {
  const factory LowAttendanceStudent({
    required String studentId,
    required String name,
    required String batchCode,
    required String subjectCode,
    required double percentage,
  }) = _LowAttendanceStudent;

  factory LowAttendanceStudent.fromJson(Map<String, dynamic> json) =>
      _$LowAttendanceStudentFromJson(json);
}

@freezed
class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    required int totalEnrollments,
    @Default(0) required int totalBatchesTeaching,
    @Default(0) required int totalSubjects,        
    @Default(0) required int totalStudents,
    required int totalSessions,
    required double averageAttendance,
  }) = _DashboardStats;

  factory DashboardStats.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsFromJson(json);
}