// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentDashboardModelImpl _$$StudentDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentDashboardModelImpl(
      student: StudentInfo.fromJson(json['student'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectAttendanceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      overview:
          DashboardOverview.fromJson(json['overview'] as Map<String, dynamic>),
      todayClasses: (json['todayClasses'] as List<dynamic>)
          .map((e) => TodayClassInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StudentDashboardModelImplToJson(
        _$StudentDashboardModelImpl instance) =>
    <String, dynamic>{
      'student': instance.student,
      'subjects': instance.subjects,
      'overview': instance.overview,
      'todayClasses': instance.todayClasses,
    };

_$StudentInfoImpl _$$StudentInfoImplFromJson(Map<String, dynamic> json) =>
    _$StudentInfoImpl(
      id: json['id'] as String,
      studentId: json['studentId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      batch: BatchDetailInfo.fromJson(json['batch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StudentInfoImplToJson(_$StudentInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'batch': instance.batch,
    };

_$BatchDetailInfoImpl _$$BatchDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$BatchDetailInfoImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      academicYear: json['academicYear'] as String,
    );

Map<String, dynamic> _$$BatchDetailInfoImplToJson(
        _$BatchDetailInfoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'academicYear': instance.academicYear,
    };

_$SubjectAttendanceInfoImpl _$$SubjectAttendanceInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectAttendanceInfoImpl(
      subjectCode: json['subjectCode'] as String,
      subjectName: json['subjectName'] as String,
      semester: json['semester'] as String,
      teacherName: json['teacherName'] as String,
      stats: AttendanceStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubjectAttendanceInfoImplToJson(
        _$SubjectAttendanceInfoImpl instance) =>
    <String, dynamic>{
      'subjectCode': instance.subjectCode,
      'subjectName': instance.subjectName,
      'semester': instance.semester,
      'teacherName': instance.teacherName,
      'stats': instance.stats,
    };

_$AttendanceStatsImpl _$$AttendanceStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceStatsImpl(
      totalSessions: (json['totalSessions'] as num).toInt(),
      present: (json['present'] as num).toInt(),
      absent: (json['absent'] as num).toInt(),
      late: (json['late'] as num).toInt(),
      excused: (json['excused'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$AttendanceStatsImplToJson(
        _$AttendanceStatsImpl instance) =>
    <String, dynamic>{
      'totalSessions': instance.totalSessions,
      'present': instance.present,
      'absent': instance.absent,
      'late': instance.late,
      'excused': instance.excused,
      'percentage': instance.percentage,
      'status': instance.status,
    };

_$DashboardOverviewImpl _$$DashboardOverviewImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardOverviewImpl(
      totalSubjects: (json['totalSubjects'] as num).toInt(),
      overallAttendance: (json['overallAttendance'] as num).toDouble(),
      totalSessions: (json['totalSessions'] as num).toInt(),
      classesAttended: (json['classesAttended'] as num).toInt(),
      lowAttendanceCount: (json['lowAttendanceCount'] as num).toInt(),
    );

Map<String, dynamic> _$$DashboardOverviewImplToJson(
        _$DashboardOverviewImpl instance) =>
    <String, dynamic>{
      'totalSubjects': instance.totalSubjects,
      'overallAttendance': instance.overallAttendance,
      'totalSessions': instance.totalSessions,
      'classesAttended': instance.classesAttended,
      'lowAttendanceCount': instance.lowAttendanceCount,
    };

_$TodayClassInfoImpl _$$TodayClassInfoImplFromJson(Map<String, dynamic> json) =>
    _$TodayClassInfoImpl(
      subjectCode: json['subjectCode'] as String,
      subjectName: json['subjectName'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      room: json['room'] as String?,
      teacherName: json['teacherName'] as String,
    );

Map<String, dynamic> _$$TodayClassInfoImplToJson(
        _$TodayClassInfoImpl instance) =>
    <String, dynamic>{
      'subjectCode': instance.subjectCode,
      'subjectName': instance.subjectName,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'room': instance.room,
      'teacherName': instance.teacherName,
    };
