import 'package:freezed_annotation/freezed_annotation.dart';

part 'enrollment_model.freezed.dart';
part 'enrollment_model.g.dart';

@freezed
class EnrollmentModel with _$EnrollmentModel {
  const factory EnrollmentModel({
    required String id,
    required String subjectId,
    required String batchId,
    required String teacherId,
    required SubjectInfo subject,
    required BatchInfo batch,
    TeacherInfo? teacher,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EnrollmentModel;

  factory EnrollmentModel.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentModelFromJson(json);
}

@freezed
class SubjectInfo with _$SubjectInfo {
  const factory SubjectInfo({
    required String code,
    required String name,
    required String semester,
    required String department,
  }) = _SubjectInfo;

  factory SubjectInfo.fromJson(Map<String, dynamic> json) =>
      _$SubjectInfoFromJson(json);
}

@freezed
class BatchInfo with _$BatchInfo {
  const factory BatchInfo({
    required String id,
    required String code,
    required String name,
    @JsonKey(name: 'year') required String academicYear,
  }) = _BatchInfo;

  factory BatchInfo.fromJson(Map<String, dynamic> json) =>
      _$BatchInfoFromJson(json);
}

@freezed
class TeacherInfo with _$TeacherInfo {
  const factory TeacherInfo({
    required String firstName,
    required String lastName,
    required String employeeId,
    String? department,
  }) = _TeacherInfo;

  const TeacherInfo._();

  String get fullName => '$firstName $lastName';

  factory TeacherInfo.fromJson(Map<String, dynamic> json) =>
      _$TeacherInfoFromJson(json);
}

@freezed
class EnrollBatchesRequest with _$EnrollBatchesRequest {
  @JsonSerializable(includeIfNull: false)
  const factory EnrollBatchesRequest({
    required String subjectId,
    required List<String> batchIds,  
    String? semester,
  }) = _EnrollBatchesRequest;

  factory EnrollBatchesRequest.fromJson(Map<String, dynamic> json) =>
      _$EnrollBatchesRequestFromJson(json);
}

@freezed
class EnrollBatchesResponse with _$EnrollBatchesResponse {
  const factory EnrollBatchesResponse({
    required String message,
    required List<EnrollmentModel> enrollments,
  }) = _EnrollBatchesResponse;

  factory EnrollBatchesResponse.fromJson(Map<String, dynamic> json) =>
      _$EnrollBatchesResponseFromJson(json);
}

@freezed
class CreateEnrollmentRequest with _$CreateEnrollmentRequest {
  const factory CreateEnrollmentRequest({
    required String subjectId,
    required String batchId,
    required String teacherId,
  }) = _CreateEnrollmentRequest;

  factory CreateEnrollmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEnrollmentRequestFromJson(json);
}
