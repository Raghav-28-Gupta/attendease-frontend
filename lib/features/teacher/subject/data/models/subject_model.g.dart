// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectModelImpl _$$SubjectModelImplFromJson(Map<String, dynamic> json) =>
    _$SubjectModelImpl(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      credits: (json['credits'] as num).toDouble(),
      department: json['department'] as String,
      semester: json['semester'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SubjectModelImplToJson(_$SubjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'credits': instance.credits,
      'department': instance.department,
      'semester': instance.semester,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$CreateSubjectRequestImpl _$$CreateSubjectRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateSubjectRequestImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      credits: (json['credits'] as num).toDouble(),
      department: json['department'] as String,
      semester: json['semester'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CreateSubjectRequestImplToJson(
        _$CreateSubjectRequestImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'credits': instance.credits,
      'department': instance.department,
      'semester': instance.semester,
      'description': instance.description,
    };

_$UpdateSubjectRequestImpl _$$UpdateSubjectRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateSubjectRequestImpl(
      code: json['code'] as String?,
      name: json['name'] as String?,
      credits: (json['credits'] as num?)?.toDouble(),
      department: json['department'] as String?,
      semester: json['semester'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$UpdateSubjectRequestImplToJson(
        _$UpdateSubjectRequestImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'credits': instance.credits,
      'department': instance.department,
      'semester': instance.semester,
      'description': instance.description,
    };
