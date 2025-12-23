import 'package:freezed_annotation/freezed_annotation.dart';

part 'timetable_model.freezed.dart';
part 'timetable_model.g.dart';

@freezed
class TimetableEntryModel with _$TimetableEntryModel {
  const factory TimetableEntryModel({
    required String id,
    @JsonKey(name: 'subjectEnrollmentId') required String enrollmentId, // ✅ Backend sends subjectEnrollmentId
    required String dayOfWeek,
    required String startTime,
    required String endTime,
    @JsonKey(name: 'classRoom') String? room, // ✅ Backend sends classRoom
    required DateTime createdAt,
    @JsonKey(name: 'subjectEnrollment') required EnrollmentInfo enrollment, // ✅ Backend sends subjectEnrollment
  }) = _TimetableEntryModel;

  factory TimetableEntryModel.fromJson(Map<String, dynamic> json) =>
      _$TimetableEntryModelFromJson(json);
}

@freezed
class EnrollmentInfo with _$EnrollmentInfo {
  const factory EnrollmentInfo({
    required SubjectInfo subject,
    required BatchInfo batch,
    required TeacherInfo teacher,
  }) = _EnrollmentInfo;

  factory EnrollmentInfo.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentInfoFromJson(json);
}

@freezed
class SubjectInfo with _$SubjectInfo {
  const factory SubjectInfo({
    required String code,
    required String name,
    required String semester,
  }) = _SubjectInfo;

  factory SubjectInfo.fromJson(Map<String, dynamic> json) =>
      _$SubjectInfoFromJson(json);
}

@freezed
class BatchInfo with _$BatchInfo {
  const factory BatchInfo({
    required String code,
    required String name,
    required String academicYear,
  }) = _BatchInfo;

  factory BatchInfo.fromJson(Map<String, dynamic> json) =>
      _$BatchInfoFromJson(json);
}

@freezed
class TeacherInfo with _$TeacherInfo {
  const factory TeacherInfo({
    required String firstName,
    required String lastName,
  }) = _TeacherInfo;

  const TeacherInfo._();

  String get fullName => '$firstName $lastName';

  factory TeacherInfo.fromJson(Map<String, dynamic> json) =>
      _$TeacherInfoFromJson(json);
}

@freezed
class CreateTimetableEntryRequest with _$CreateTimetableEntryRequest {
  const factory CreateTimetableEntryRequest({
    @JsonKey(name: 'subjectEnrollmentId') required String enrollmentId, // ✅ Rename for backend
    required String dayOfWeek,
    required String startTime, // Format as "HH:MM:SS"
    required String endTime,   // Format as "HH:MM:SS"
    @JsonKey(name: 'classRoom') String? room, // ✅ Rename for backend
  }) = _CreateTimetableEntryRequest;

  factory CreateTimetableEntryRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTimetableEntryRequestFromJson(json);
}

@freezed
class UpdateTimetableEntryRequest with _$UpdateTimetableEntryRequest {
  const factory UpdateTimetableEntryRequest({
    String? dayOfWeek,
    String? startTime, // Format as "HH:MM:SS"
    String? endTime,   // Format as "HH:MM:SS"
    @JsonKey(name: 'classRoom') String? room, // ✅ Rename for backend
  }) = _UpdateTimetableEntryRequest;

  factory UpdateTimetableEntryRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTimetableEntryRequestFromJson(json);
}
