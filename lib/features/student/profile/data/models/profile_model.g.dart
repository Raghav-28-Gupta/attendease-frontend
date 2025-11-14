// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentProfileModelImpl _$$StudentProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentProfileModelImpl(
      id: json['id'] as String,
      studentId: json['studentId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      batchId: json['batchId'] as String,
      batch: BatchInfo.fromJson(json['batch'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$StudentProfileModelImplToJson(
        _$StudentProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'batchId': instance.batchId,
      'batch': instance.batch,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$BatchInfoImpl _$$BatchInfoImplFromJson(Map<String, dynamic> json) =>
    _$BatchInfoImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      academicYear: json['academicYear'] as String,
    );

Map<String, dynamic> _$$BatchInfoImplToJson(_$BatchInfoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'academicYear': instance.academicYear,
    };

_$UpdateProfileRequestImpl _$$UpdateProfileRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateProfileRequestImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$UpdateProfileRequestImplToJson(
        _$UpdateProfileRequestImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
    };
