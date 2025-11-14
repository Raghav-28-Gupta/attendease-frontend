import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_attendance_model.freezed.dart';
part 'subject_attendance_model.g.dart';

@freezed
class SubjectAttendanceDetail with _$SubjectAttendanceDetail {
  const factory SubjectAttendanceDetail({
    required String subjectCode,
    required String subjectName,
    required String semester,
    required AttendanceDetailStats stats,
    required List<AttendanceRecordInfo> records,
  }) = _SubjectAttendanceDetail;

  factory SubjectAttendanceDetail.fromJson(Map<String, dynamic> json) =>
      _$SubjectAttendanceDetailFromJson(json);
}

@freezed
class AttendanceDetailStats with _$AttendanceDetailStats {
  const factory AttendanceDetailStats({
    required int totalSessions,
    required int present,
    required int absent,
    required int late,
    required int excused,
    required double percentage,
    required String status,
    required int sessionsNeeded,
  }) = _AttendanceDetailStats;

  factory AttendanceDetailStats.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDetailStatsFromJson(json);
}

@freezed
class AttendanceRecordInfo with _$AttendanceRecordInfo {
  const factory AttendanceRecordInfo({
    required String id,
    required DateTime date,
    required String startTime,
    required String endTime,
    required String status,
    required DateTime markedAt,
  }) = _AttendanceRecordInfo;

  factory AttendanceRecordInfo.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordInfoFromJson(json);
}
