import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_dashboard_model.freezed.dart';
part 'student_dashboard_model.g.dart';

@freezed
class StudentDashboardModel with _$StudentDashboardModel {
  const factory StudentDashboardModel({
    required StudentInfo student,
    required List<SubjectAttendanceInfo> subjects,
    required DashboardOverview overview,
    required List<TodayClassInfo> todayClasses,
  }) = _StudentDashboardModel;

  factory StudentDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$StudentDashboardModelFromJson(json);
}

@freezed
class StudentInfo with _$StudentInfo {
  const factory StudentInfo({
    required String id,
    required String studentId,
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
    required BatchDetailInfo batch,
  }) = _StudentInfo;

  const StudentInfo._();

  String get fullName => '$firstName $lastName';

  factory StudentInfo.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoFromJson(json);
}

@freezed
class BatchDetailInfo with _$BatchDetailInfo {
  const factory BatchDetailInfo({
    required String code,
    required String name,
    required String academicYear,
  }) = _BatchDetailInfo;

  factory BatchDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$BatchDetailInfoFromJson(json);
}

@freezed
class SubjectAttendanceInfo with _$SubjectAttendanceInfo {
  const factory SubjectAttendanceInfo({
    required String subjectCode,
    required String subjectName,
    required String semester,
    required AttendanceStats stats,
  }) = _SubjectAttendanceInfo;

  factory SubjectAttendanceInfo.fromJson(Map<String, dynamic> json) =>
      _$SubjectAttendanceInfoFromJson(json);
}

@freezed
class AttendanceStats with _$AttendanceStats {
  const factory AttendanceStats({
    required int totalSessions,
    required int present,
    required int absent,
    required int late,
    required int excused,
    required double percentage,
    required String status,
  }) = _AttendanceStats;

  const AttendanceStats._();

  int get attended => present + late + excused;

  factory AttendanceStats.fromJson(Map<String, dynamic> json) =>
      _$AttendanceStatsFromJson(json);
}

@freezed
class DashboardOverview with _$DashboardOverview {
  const factory DashboardOverview({
    required int totalSubjects,
    required double overallAttendance,
    required int totalSessions,
    required int classesAttended,
    required int lowAttendanceCount,
  }) = _DashboardOverview;

  factory DashboardOverview.fromJson(Map<String, dynamic> json) =>
      _$DashboardOverviewFromJson(json);
}

@freezed
class TodayClassInfo with _$TodayClassInfo {
  const factory TodayClassInfo({
    required String subjectCode,
    required String subjectName,
    required String startTime,
    required String endTime,
    String? room,
    required String teacherName,
  }) = _TodayClassInfo;

  factory TodayClassInfo.fromJson(Map<String, dynamic> json) =>
      _$TodayClassInfoFromJson(json);
}
