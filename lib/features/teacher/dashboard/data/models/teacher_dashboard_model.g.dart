// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherDashboardModelImpl _$$TeacherDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherDashboardModelImpl(
      enrollments: (json['enrollments'] as List<dynamic>)
          .map((e) => EnrollmentInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: DashboardStats.fromJson(json['stats'] as Map<String, dynamic>),
      recentSessions: (json['recentSessions'] as List<dynamic>)
          .map((e) => RecentSession.fromJson(e as Map<String, dynamic>))
          .toList(),
      lowAttendanceStudents: (json['lowAttendanceStudents'] as List<dynamic>)
          .map((e) => LowAttendanceStudent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TeacherDashboardModelImplToJson(
        _$TeacherDashboardModelImpl instance) =>
    <String, dynamic>{
      'enrollments': instance.enrollments,
      'stats': instance.stats,
      'recentSessions': instance.recentSessions,
      'lowAttendanceStudents': instance.lowAttendanceStudents,
    };

_$EnrollmentInfoImpl _$$EnrollmentInfoImplFromJson(Map<String, dynamic> json) =>
    _$EnrollmentInfoImpl(
      id: json['id'] as String,
      subject: SubjectInfo.fromJson(json['subject'] as Map<String, dynamic>),
      batch: BatchInfo.fromJson(json['batch'] as Map<String, dynamic>),
      stats: EnrollmentStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EnrollmentInfoImplToJson(
        _$EnrollmentInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'batch': instance.batch,
      'stats': instance.stats,
    };

_$SubjectInfoImpl _$$SubjectInfoImplFromJson(Map<String, dynamic> json) =>
    _$SubjectInfoImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      semester: json['semester'] as String,
    );

Map<String, dynamic> _$$SubjectInfoImplToJson(_$SubjectInfoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'semester': instance.semester,
    };

_$BatchInfoImpl _$$BatchInfoImplFromJson(Map<String, dynamic> json) =>
    _$BatchInfoImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      studentCount: (json['studentCount'] as num).toInt(),
    );

Map<String, dynamic> _$$BatchInfoImplToJson(_$BatchInfoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'studentCount': instance.studentCount,
    };

_$EnrollmentStatsImpl _$$EnrollmentStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$EnrollmentStatsImpl(
      sessionsHeld: (json['sessionsHeld'] as num).toInt(),
      averageAttendance: (json['averageAttendance'] as num).toDouble(),
      lastSession: json['lastSession'] == null
          ? null
          : DateTime.parse(json['lastSession'] as String),
    );

Map<String, dynamic> _$$EnrollmentStatsImplToJson(
        _$EnrollmentStatsImpl instance) =>
    <String, dynamic>{
      'sessionsHeld': instance.sessionsHeld,
      'averageAttendance': instance.averageAttendance,
      'lastSession': instance.lastSession?.toIso8601String(),
    };

_$DashboardStatsImpl _$$DashboardStatsImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStatsImpl(
      totalEnrollments: (json['totalEnrollments'] as num).toInt(),
      totalBatchesTeaching: (json['totalBatchesTeaching'] as num).toInt(),
      totalStudents: (json['totalStudents'] as num).toInt(),
      totalSessions: (json['totalSessions'] as num).toInt(),
      averageAttendance: (json['averageAttendance'] as num).toDouble(),
    );

Map<String, dynamic> _$$DashboardStatsImplToJson(
        _$DashboardStatsImpl instance) =>
    <String, dynamic>{
      'totalEnrollments': instance.totalEnrollments,
      'totalBatchesTeaching': instance.totalBatchesTeaching,
      'totalStudents': instance.totalStudents,
      'totalSessions': instance.totalSessions,
      'averageAttendance': instance.averageAttendance,
    };

_$RecentSessionImpl _$$RecentSessionImplFromJson(Map<String, dynamic> json) =>
    _$RecentSessionImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      subjectEnrollment: SubjectEnrollmentInfo.fromJson(
          json['subjectEnrollment'] as Map<String, dynamic>),
      count: RecordsCount.fromJson(json['count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecentSessionImplToJson(_$RecentSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'subjectEnrollment': instance.subjectEnrollment,
      'count': instance.count,
    };

_$SubjectEnrollmentInfoImpl _$$SubjectEnrollmentInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectEnrollmentInfoImpl(
      subject: SubjectInfo.fromJson(json['subject'] as Map<String, dynamic>),
      batch: BatchInfo.fromJson(json['batch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubjectEnrollmentInfoImplToJson(
        _$SubjectEnrollmentInfoImpl instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'batch': instance.batch,
    };

_$RecordsCountImpl _$$RecordsCountImplFromJson(Map<String, dynamic> json) =>
    _$RecordsCountImpl(
      records: (json['records'] as num).toInt(),
    );

Map<String, dynamic> _$$RecordsCountImplToJson(_$RecordsCountImpl instance) =>
    <String, dynamic>{
      'records': instance.records,
    };

_$LowAttendanceStudentImpl _$$LowAttendanceStudentImplFromJson(
        Map<String, dynamic> json) =>
    _$LowAttendanceStudentImpl(
      studentId: json['studentId'] as String,
      name: json['name'] as String,
      batchCode: json['batchCode'] as String,
      subjectCode: json['subjectCode'] as String,
      percentage: (json['percentage'] as num).toDouble(),
    );

Map<String, dynamic> _$$LowAttendanceStudentImplToJson(
        _$LowAttendanceStudentImpl instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'name': instance.name,
      'batchCode': instance.batchCode,
      'subjectCode': instance.subjectCode,
      'percentage': instance.percentage,
    };
