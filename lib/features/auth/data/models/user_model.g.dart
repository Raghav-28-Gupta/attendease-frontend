// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      emailVerified: json['emailVerified'] as bool,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      employeeId: json['employeeId'] as String?,
      studentId: json['studentId'] as String?,
      department: json['department'] as String?,
      batchId: json['batchId'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'emailVerified': instance.emailVerified,
      'name': instance.name,
      'phone': instance.phone,
      'employeeId': instance.employeeId,
      'studentId': instance.studentId,
      'department': instance.department,
      'batchId': instance.batchId,
    };
