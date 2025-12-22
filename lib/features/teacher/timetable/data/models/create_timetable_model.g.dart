// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_timetable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateTimetableEntryRequestImpl _$$CreateTimetableEntryRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTimetableEntryRequestImpl(
      enrollmentId: json['enrollmentId'] as String,
      dayOfWeek: json['dayOfWeek'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      room: json['room'] as String?,
    );

Map<String, dynamic> _$$CreateTimetableEntryRequestImplToJson(
        _$CreateTimetableEntryRequestImpl instance) =>
    <String, dynamic>{
      'enrollmentId': instance.enrollmentId,
      'dayOfWeek': instance.dayOfWeek,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'room': instance.room,
    };
