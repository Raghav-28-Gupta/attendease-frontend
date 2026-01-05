import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_dashboard_model.freezed.dart';
part 'student_dashboard_model.g.dart';

@freezed
class StudentDashboardModel with _$StudentDashboardModel {
  const factory StudentDashboardModel({
    required StudentInfo student,
    @Default([]) List<SubjectAttendanceInfo> subjects,
    required DashboardOverview overview,
    @Default([]) List<TodayClassInfo> todayClasses,
  }) = _StudentDashboardModel;

  factory StudentDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$StudentDashboardModelFromJson(json);
}

@freezed
class StudentInfo with _$StudentInfo {
  const factory StudentInfo({
    @Default('') String id,
    @Default('') String studentId,
    @Default('Student') String firstName,
    @Default('') String lastName,
    @Default('') String email,
    String? phone,
    required BatchDetailInfo batch,
  }) = _StudentInfo;

  const StudentInfo._();

  String get fullName => '$firstName $lastName'.trim();

  factory StudentInfo.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoFromJson(json);
}

@freezed
class BatchDetailInfo with _$BatchDetailInfo {
  const factory BatchDetailInfo({
    @Default('') String code,
    @Default('Unknown Batch') String name,
    @Default('') String academicYear,
  }) = _BatchDetailInfo;

  factory BatchDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$BatchDetailInfoFromJson(json);
}

@freezed
class SubjectAttendanceInfo with _$SubjectAttendanceInfo {
  const factory SubjectAttendanceInfo({
    @Default('') String subjectCode,
    @Default('Unknown Subject') String subjectName,
    @Default('') String semester,
    @Default('Unknown Teacher') String teacherName,
    required AttendanceStats stats,
  }) = _SubjectAttendanceInfo;

  factory SubjectAttendanceInfo.fromJson(Map<String, dynamic> json) =>
      _$SubjectAttendanceInfoFromJson(json);
}

@freezed
class AttendanceStats with _$AttendanceStats {
  const factory AttendanceStats({
    @Default(0) int totalSessions,
    @Default(0) int present,
    @Default(0) int absent,
    @Default(0) int late,
    @Default(0) int excused,
    @Default(0.0) double percentage,
    @Default('GOOD') String status,
  }) = _AttendanceStats;

  const AttendanceStats._();

  int get attended => present + late + excused;

  factory AttendanceStats.fromJson(Map<String, dynamic> json) =>
      _$AttendanceStatsFromJson(json);
}

@freezed
class DashboardOverview with _$DashboardOverview {
  const factory DashboardOverview({
    @Default(0) int totalSubjects,
    @Default(0.0) double overallAttendance,
    @Default(0) int totalSessions,
    @Default(0) int classesAttended,
    @Default(0) int lowAttendanceCount,
  }) = _DashboardOverview;

  factory DashboardOverview.fromJson(Map<String, dynamic> json) =>
      _$DashboardOverviewFromJson(json);
}

/// Today's class info - uses nested subjectEnrollment structure from API
@freezed
class TodayClassInfo with _$TodayClassInfo {
  const factory TodayClassInfo({
    @Default('') String id,
    @Default('') String startTime,
    @Default('') String endTime,
    String? room,
    required TodayClassSubjectEnrollment subjectEnrollment,
  }) = _TodayClassInfo;

  const TodayClassInfo._();

  // Convenience getters for easier access
  String get subjectCode => subjectEnrollment.subject.code;
  String get subjectName => subjectEnrollment.subject.name;
  String get teacherName => subjectEnrollment.teacher.fullName;

  factory TodayClassInfo.fromJson(Map<String, dynamic> json) =>
      _$TodayClassInfoFromJson(json);
}

@freezed
class TodayClassSubjectEnrollment with _$TodayClassSubjectEnrollment {
  const factory TodayClassSubjectEnrollment({
    required TodayClassSubject subject,
    required TodayClassTeacher teacher,
  }) = _TodayClassSubjectEnrollment;

  factory TodayClassSubjectEnrollment.fromJson(Map<String, dynamic> json) =>
      _$TodayClassSubjectEnrollmentFromJson(json);
}

@freezed
class TodayClassSubject with _$TodayClassSubject {
  const factory TodayClassSubject({
    @Default('') String code,
    @Default('Unknown Subject') String name,
    @Default('') String semester,
  }) = _TodayClassSubject;

  factory TodayClassSubject.fromJson(Map<String, dynamic> json) =>
      _$TodayClassSubjectFromJson(json);
}

@freezed
class TodayClassTeacher with _$TodayClassTeacher {
  const factory TodayClassTeacher({
    @Default('Unknown') String firstName,
    @Default('Teacher') String lastName,
  }) = _TodayClassTeacher;

  const TodayClassTeacher._();

  String get fullName => '$firstName $lastName'.trim();

  factory TodayClassTeacher.fromJson(Map<String, dynamic> json) =>
      _$TodayClassTeacherFromJson(json);
}
