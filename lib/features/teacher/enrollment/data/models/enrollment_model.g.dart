// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnrollmentModelImpl _$$EnrollmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EnrollmentModelImpl(
      id: json['id'] as String,
      subjectId: json['subjectId'] as String,
      batchId: json['batchId'] as String,
      teacherId: json['teacherId'] as String,
      subject: SubjectInfo.fromJson(json['subject'] as Map<String, dynamic>),
      batch: BatchInfo.fromJson(json['batch'] as Map<String, dynamic>),
      teacher: json['teacher'] == null
          ? null
          : TeacherInfo.fromJson(json['teacher'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EnrollmentModelImplToJson(
        _$EnrollmentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectId': instance.subjectId,
      'batchId': instance.batchId,
      'teacherId': instance.teacherId,
      'subject': instance.subject,
      'batch': instance.batch,
      'teacher': instance.teacher,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$SubjectInfoImpl _$$SubjectInfoImplFromJson(Map<String, dynamic> json) =>
    _$SubjectInfoImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      semester: json['semester'] as String,
      department: json['department'] as String,
    );

Map<String, dynamic> _$$SubjectInfoImplToJson(_$SubjectInfoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'semester': instance.semester,
      'department': instance.department,
    };

_$BatchInfoImpl _$$BatchInfoImplFromJson(Map<String, dynamic> json) =>
    _$BatchInfoImpl(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      academicYear: json['year'] as String,
    );

Map<String, dynamic> _$$BatchInfoImplToJson(_$BatchInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'year': instance.academicYear,
    };

_$TeacherInfoImpl _$$TeacherInfoImplFromJson(Map<String, dynamic> json) =>
    _$TeacherInfoImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      employeeId: json['employeeId'] as String,
      department: json['department'] as String?,
    );

Map<String, dynamic> _$$TeacherInfoImplToJson(_$TeacherInfoImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'employeeId': instance.employeeId,
      'department': instance.department,
    };

_$EnrollBatchesRequestImpl _$$EnrollBatchesRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EnrollBatchesRequestImpl(
      subjectId: json['subjectId'] as String,
      batchIds:
          (json['batchIds'] as List<dynamic>).map((e) => e as String).toList(),
      semester: json['semester'] as String?,
    );

Map<String, dynamic> _$$EnrollBatchesRequestImplToJson(
        _$EnrollBatchesRequestImpl instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'batchIds': instance.batchIds,
      if (instance.semester case final value?) 'semester': value,
    };

_$EnrollBatchesResponseImpl _$$EnrollBatchesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EnrollBatchesResponseImpl(
      message: json['message'] as String,
      enrollments: (json['enrollments'] as List<dynamic>)
          .map((e) => EnrollmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EnrollBatchesResponseImplToJson(
        _$EnrollBatchesResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'enrollments': instance.enrollments,
    };

_$CreateEnrollmentRequestImpl _$$CreateEnrollmentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateEnrollmentRequestImpl(
      subjectId: json['subjectId'] as String,
      batchId: json['batchId'] as String,
      teacherId: json['teacherId'] as String,
    );

Map<String, dynamic> _$$CreateEnrollmentRequestImplToJson(
        _$CreateEnrollmentRequestImpl instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'batchId': instance.batchId,
      'teacherId': instance.teacherId,
    };
