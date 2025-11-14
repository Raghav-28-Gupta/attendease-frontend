import 'package:freezed_annotation/freezed_annotation.dart';

part 'timetable_model.freezed.dart';
part 'timetable_model.g.dart';

@freezed
class TimetableModel with _$TimetableModel {
  const factory TimetableModel({
    required List<TimetableEntry> timetable,
  }) = _TimetableModel;

  factory TimetableModel.fromJson(Map<String, dynamic> json) =>
      _$TimetableModelFromJson(json);
}

@freezed
class TimetableEntry with _$TimetableEntry {
  const factory TimetableEntry({
    required String id,
    required String dayOfWeek,
    required String startTime,
    required String endTime,
    String? room,
    required SubjectEnrollmentDetail subjectEnrollment,
  }) = _TimetableEntry;

  factory TimetableEntry.fromJson(Map<String, dynamic> json) =>
      _$TimetableEntryFromJson(json);
}

@freezed
class SubjectEnrollmentDetail with _$SubjectEnrollmentDetail {
  const factory SubjectEnrollmentDetail({
    required SubjectDetail subject,
    required TeacherDetail teacher,
  }) = _SubjectEnrollmentDetail;

  factory SubjectEnrollmentDetail.fromJson(Map<String, dynamic> json) =>
      _$SubjectEnrollmentDetailFromJson(json);
}

@freezed
class SubjectDetail with _$SubjectDetail {
  const factory SubjectDetail({
    required String code,
    required String name,
    required String semester,
  }) = _SubjectDetail;

  factory SubjectDetail.fromJson(Map<String, dynamic> json) =>
      _$SubjectDetailFromJson(json);
}

@freezed
class TeacherDetail with _$TeacherDetail {
  const factory TeacherDetail({
    required String firstName,
    required String lastName,
    String? department,
  }) = _TeacherDetail;

  const TeacherDetail._();

  String get fullName => '$firstName $lastName';

  factory TeacherDetail.fromJson(Map<String, dynamic> json) =>
      _$TeacherDetailFromJson(json);
}
