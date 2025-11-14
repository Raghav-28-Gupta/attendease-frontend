// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimetableModelImpl _$$TimetableModelImplFromJson(Map<String, dynamic> json) =>
    _$TimetableModelImpl(
      timetable: (json['timetable'] as List<dynamic>)
          .map((e) => TimetableEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TimetableModelImplToJson(
        _$TimetableModelImpl instance) =>
    <String, dynamic>{
      'timetable': instance.timetable,
    };

_$TimetableEntryImpl _$$TimetableEntryImplFromJson(Map<String, dynamic> json) =>
    _$TimetableEntryImpl(
      id: json['id'] as String,
      dayOfWeek: json['dayOfWeek'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      room: json['room'] as String?,
      subjectEnrollment: SubjectEnrollmentDetail.fromJson(
          json['subjectEnrollment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TimetableEntryImplToJson(
        _$TimetableEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayOfWeek': instance.dayOfWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'room': instance.room,
      'subjectEnrollment': instance.subjectEnrollment,
    };

_$SubjectEnrollmentDetailImpl _$$SubjectEnrollmentDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectEnrollmentDetailImpl(
      subject: SubjectDetail.fromJson(json['subject'] as Map<String, dynamic>),
      teacher: TeacherDetail.fromJson(json['teacher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubjectEnrollmentDetailImplToJson(
        _$SubjectEnrollmentDetailImpl instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'teacher': instance.teacher,
    };

_$SubjectDetailImpl _$$SubjectDetailImplFromJson(Map<String, dynamic> json) =>
    _$SubjectDetailImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      semester: json['semester'] as String,
    );

Map<String, dynamic> _$$SubjectDetailImplToJson(_$SubjectDetailImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'semester': instance.semester,
    };

_$TeacherDetailImpl _$$TeacherDetailImplFromJson(Map<String, dynamic> json) =>
    _$TeacherDetailImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      department: json['department'] as String?,
    );

Map<String, dynamic> _$$TeacherDetailImplToJson(_$TeacherDetailImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'department': instance.department,
    };
