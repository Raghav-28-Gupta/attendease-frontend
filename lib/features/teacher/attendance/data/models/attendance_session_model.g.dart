// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceSessionModelImpl _$$AttendanceSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceSessionModelImpl(
      id: json['id'] as String,
      subjectEnrollmentId: json['subjectEnrollmentId'] as String,
      teacherId: json['teacherId'] as String,
      date: DateTime.parse(json['date'] as String),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AttendanceSessionModelImplToJson(
        _$AttendanceSessionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectEnrollmentId': instance.subjectEnrollmentId,
      'teacherId': instance.teacherId,
      'date': instance.date.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$CreateSessionRequestImpl _$$CreateSessionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateSessionRequestImpl(
      subjectEnrollmentId: json['subjectEnrollmentId'] as String,
      date: json['date'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$CreateSessionRequestImplToJson(
        _$CreateSessionRequestImpl instance) =>
    <String, dynamic>{
      'subjectEnrollmentId': instance.subjectEnrollmentId,
      'date': instance.date,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'type': instance.type,
    };

_$StudentAttendanceModelImpl _$$StudentAttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentAttendanceModelImpl(
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      studentId: json['studentId'] as String,
      status: json['status'] as String,
      markedAt: DateTime.parse(json['markedAt'] as String),
      student: StudentInfo.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StudentAttendanceModelImplToJson(
        _$StudentAttendanceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'studentId': instance.studentId,
      'status': instance.status,
      'markedAt': instance.markedAt.toIso8601String(),
      'student': instance.student,
    };

_$StudentInfoImpl _$$StudentInfoImplFromJson(Map<String, dynamic> json) =>
    _$StudentInfoImpl(
      id: json['id'] as String,
      studentId: json['studentId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$$StudentInfoImplToJson(_$StudentInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

_$MarkAttendanceRequestImpl _$$MarkAttendanceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$MarkAttendanceRequestImpl(
      sessionId: json['sessionId'] as String,
      records: (json['records'] as List<dynamic>)
          .map((e) => AttendanceRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MarkAttendanceRequestImplToJson(
        _$MarkAttendanceRequestImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'records': instance.records,
    };

_$AttendanceRecordImpl _$$AttendanceRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceRecordImpl(
      studentId: json['studentId'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$AttendanceRecordImplToJson(
        _$AttendanceRecordImpl instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'status': instance.status,
    };

_$SessionWithDetailsImpl _$$SessionWithDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionWithDetailsImpl(
      id: json['id'] as String,
      subjectEnrollmentId: json['subjectEnrollmentId'] as String,
      teacherId: json['teacherId'] as String,
      date: DateTime.parse(json['date'] as String),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      type: json['type'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      subjectEnrollment: SubjectEnrollmentDetailInfo.fromJson(
          json['subjectEnrollment'] as Map<String, dynamic>),
      count:
          SessionRecordsCount.fromJson(json['count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SessionWithDetailsImplToJson(
        _$SessionWithDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectEnrollmentId': instance.subjectEnrollmentId,
      'teacherId': instance.teacherId,
      'date': instance.date.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'subjectEnrollment': instance.subjectEnrollment,
      'count': instance.count,
    };

_$SubjectEnrollmentDetailInfoImpl _$$SubjectEnrollmentDetailInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectEnrollmentDetailInfoImpl(
      subject: SubjectInfo.fromJson(json['subject'] as Map<String, dynamic>),
      batch: BatchInfo.fromJson(json['batch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubjectEnrollmentDetailInfoImplToJson(
        _$SubjectEnrollmentDetailInfoImpl instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'batch': instance.batch,
    };

_$SessionRecordsCountImpl _$$SessionRecordsCountImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionRecordsCountImpl(
      records: (json['records'] as num).toInt(),
    );

Map<String, dynamic> _$$SessionRecordsCountImplToJson(
        _$SessionRecordsCountImpl instance) =>
    <String, dynamic>{
      'records': instance.records,
    };

_$AttendanceRecordDetailImpl _$$AttendanceRecordDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceRecordDetailImpl(
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      studentId: json['studentId'] as String,
      status: json['status'] as String,
      markedAt: DateTime.parse(json['markedAt'] as String),
      student: StudentInfo.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendanceRecordDetailImplToJson(
        _$AttendanceRecordDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'studentId': instance.studentId,
      'status': instance.status,
      'markedAt': instance.markedAt.toIso8601String(),
      'student': instance.student,
    };
