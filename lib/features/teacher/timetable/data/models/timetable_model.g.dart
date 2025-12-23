// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimetableEntryModelImpl _$$TimetableEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TimetableEntryModelImpl(
      id: json['id'] as String,
      enrollmentId: json['subjectEnrollmentId'] as String,
      dayOfWeek: json['dayOfWeek'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      room: json['classRoom'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      enrollment: EnrollmentInfo.fromJson(
          json['subjectEnrollment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TimetableEntryModelImplToJson(
        _$TimetableEntryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectEnrollmentId': instance.enrollmentId,
      'dayOfWeek': instance.dayOfWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'classRoom': instance.room,
      'createdAt': instance.createdAt.toIso8601String(),
      'subjectEnrollment': instance.enrollment,
    };

_$EnrollmentInfoImpl _$$EnrollmentInfoImplFromJson(Map<String, dynamic> json) =>
    _$EnrollmentInfoImpl(
      subject: SubjectInfo.fromJson(json['subject'] as Map<String, dynamic>),
      batch: BatchInfo.fromJson(json['batch'] as Map<String, dynamic>),
      teacher: TeacherInfo.fromJson(json['teacher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EnrollmentInfoImplToJson(
        _$EnrollmentInfoImpl instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'batch': instance.batch,
      'teacher': instance.teacher,
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
      department: json['department'] as String?,
      academicYear: json['year'] as String,
    );

Map<String, dynamic> _$$BatchInfoImplToJson(_$BatchInfoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'department': instance.department,
      'year': instance.academicYear,
    };

_$TeacherInfoImpl _$$TeacherInfoImplFromJson(Map<String, dynamic> json) =>
    _$TeacherInfoImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$$TeacherInfoImplToJson(_$TeacherInfoImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

_$CreateTimetableEntryRequestImpl _$$CreateTimetableEntryRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTimetableEntryRequestImpl(
      enrollmentId: json['subjectEnrollmentId'] as String,
      batchId: json['batchId'] as String,
      dayOfWeek: json['dayOfWeek'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      room: json['classRoom'] as String?,
    );

Map<String, dynamic> _$$CreateTimetableEntryRequestImplToJson(
        _$CreateTimetableEntryRequestImpl instance) =>
    <String, dynamic>{
      'subjectEnrollmentId': instance.enrollmentId,
      'batchId': instance.batchId,
      'dayOfWeek': instance.dayOfWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'classRoom': instance.room,
    };

_$UpdateTimetableEntryRequestImpl _$$UpdateTimetableEntryRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateTimetableEntryRequestImpl(
      dayOfWeek: json['dayOfWeek'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      room: json['classRoom'] as String?,
    );

Map<String, dynamic> _$$UpdateTimetableEntryRequestImplToJson(
        _$UpdateTimetableEntryRequestImpl instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'classRoom': instance.room,
    };
