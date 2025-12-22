// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BatchModelImpl _$$BatchModelImplFromJson(Map<String, dynamic> json) =>
    _$BatchModelImpl(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      academicYear: json['year'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      studentCount: (json['studentCount'] as num).toInt(),
    );

Map<String, dynamic> _$$BatchModelImplToJson(_$BatchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'year': instance.academicYear,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'studentCount': instance.studentCount,
    };

_$CreateBatchRequestImpl _$$CreateBatchRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateBatchRequestImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      academicYear: json['year'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CreateBatchRequestImplToJson(
        _$CreateBatchRequestImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'year': instance.academicYear,
      'description': instance.description,
    };

_$UpdateBatchRequestImpl _$$UpdateBatchRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateBatchRequestImpl(
      code: json['code'] as String?,
      name: json['name'] as String?,
      academicYear: json['academicYear'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$UpdateBatchRequestImplToJson(
        _$UpdateBatchRequestImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'academicYear': instance.academicYear,
      'description': instance.description,
    };
