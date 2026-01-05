// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentDashboardModelImpl _$$StudentDashboardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentDashboardModelImpl(
      student: StudentInfo.fromJson(json['student'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>?)
              ?.map((e) =>
                  SubjectAttendanceInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      overview:
          DashboardOverview.fromJson(json['overview'] as Map<String, dynamic>),
      todayClasses: (json['todayClasses'] as List<dynamic>?)
              ?.map((e) => TodayClassInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
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
      id: json['id'] as String? ?? '',
      studentId: json['studentId'] as String? ?? '',
      firstName: json['firstName'] as String? ?? 'Student',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
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
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown Batch',
      academicYear: json['academicYear'] as String? ?? '',
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
      subjectCode: json['subjectCode'] as String? ?? '',
      subjectName: json['subjectName'] as String? ?? 'Unknown Subject',
      semester: json['semester'] as String? ?? '',
      teacherName: json['teacherName'] as String? ?? 'Unknown Teacher',
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
      totalSessions: (json['totalSessions'] as num?)?.toInt() ?? 0,
      present: (json['present'] as num?)?.toInt() ?? 0,
      absent: (json['absent'] as num?)?.toInt() ?? 0,
      late: (json['late'] as num?)?.toInt() ?? 0,
      excused: (json['excused'] as num?)?.toInt() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? 'GOOD',
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
      totalSubjects: (json['totalSubjects'] as num?)?.toInt() ?? 0,
      overallAttendance: (json['overallAttendance'] as num?)?.toDouble() ?? 0.0,
      totalSessions: (json['totalSessions'] as num?)?.toInt() ?? 0,
      classesAttended: (json['classesAttended'] as num?)?.toInt() ?? 0,
      lowAttendanceCount: (json['lowAttendanceCount'] as num?)?.toInt() ?? 0,
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
      id: json['id'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      room: json['room'] as String?,
      subjectEnrollment: TodayClassSubjectEnrollment.fromJson(
          json['subjectEnrollment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TodayClassInfoImplToJson(
        _$TodayClassInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'room': instance.room,
      'subjectEnrollment': instance.subjectEnrollment,
    };

_$TodayClassSubjectEnrollmentImpl _$$TodayClassSubjectEnrollmentImplFromJson(
        Map<String, dynamic> json) =>
    _$TodayClassSubjectEnrollmentImpl(
      subject:
          TodayClassSubject.fromJson(json['subject'] as Map<String, dynamic>),
      teacher:
          TodayClassTeacher.fromJson(json['teacher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TodayClassSubjectEnrollmentImplToJson(
        _$TodayClassSubjectEnrollmentImpl instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'teacher': instance.teacher,
    };

_$TodayClassSubjectImpl _$$TodayClassSubjectImplFromJson(
        Map<String, dynamic> json) =>
    _$TodayClassSubjectImpl(
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown Subject',
      semester: json['semester'] as String? ?? '',
    );

Map<String, dynamic> _$$TodayClassSubjectImplToJson(
        _$TodayClassSubjectImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'semester': instance.semester,
    };

_$TodayClassTeacherImpl _$$TodayClassTeacherImplFromJson(
        Map<String, dynamic> json) =>
    _$TodayClassTeacherImpl(
      firstName: json['firstName'] as String? ?? 'Unknown',
      lastName: json['lastName'] as String? ?? 'Teacher',
    );

Map<String, dynamic> _$$TodayClassTeacherImplToJson(
        _$TodayClassTeacherImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
