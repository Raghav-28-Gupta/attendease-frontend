// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectAttendanceDetailImpl _$$SubjectAttendanceDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectAttendanceDetailImpl(
      subjectCode: json['subjectCode'] as String,
      subjectName: json['subjectName'] as String,
      semester: json['semester'] as String,
      stats:
          AttendanceDetailStats.fromJson(json['stats'] as Map<String, dynamic>),
      records: (json['records'] as List<dynamic>)
          .map((e) => AttendanceRecordInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SubjectAttendanceDetailImplToJson(
        _$SubjectAttendanceDetailImpl instance) =>
    <String, dynamic>{
      'subjectCode': instance.subjectCode,
      'subjectName': instance.subjectName,
      'semester': instance.semester,
      'stats': instance.stats,
      'records': instance.records,
    };

_$AttendanceDetailStatsImpl _$$AttendanceDetailStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceDetailStatsImpl(
      totalSessions: (json['totalSessions'] as num).toInt(),
      present: (json['present'] as num).toInt(),
      absent: (json['absent'] as num).toInt(),
      late: (json['late'] as num).toInt(),
      excused: (json['excused'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
      status: json['status'] as String,
      sessionsNeeded: (json['sessionsNeeded'] as num).toInt(),
    );

Map<String, dynamic> _$$AttendanceDetailStatsImplToJson(
        _$AttendanceDetailStatsImpl instance) =>
    <String, dynamic>{
      'totalSessions': instance.totalSessions,
      'present': instance.present,
      'absent': instance.absent,
      'late': instance.late,
      'excused': instance.excused,
      'percentage': instance.percentage,
      'status': instance.status,
      'sessionsNeeded': instance.sessionsNeeded,
    };

_$AttendanceRecordInfoImpl _$$AttendanceRecordInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceRecordInfoImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      status: json['status'] as String,
      markedAt: DateTime.parse(json['markedAt'] as String),
    );

Map<String, dynamic> _$$AttendanceRecordInfoImplToJson(
        _$AttendanceRecordInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'status': instance.status,
      'markedAt': instance.markedAt.toIso8601String(),
    };
