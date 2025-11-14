import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class StudentProfileModel with _$StudentProfileModel {
  const factory StudentProfileModel({
    required String id,
    required String studentId,
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
    required String batchId,
    required BatchInfo batch,
    required DateTime createdAt,
  }) = _StudentProfileModel;

  const StudentProfileModel._();

  String get fullName => '$firstName $lastName';

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) =>
      _$StudentProfileModelFromJson(json);
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
class UpdateProfileRequest with _$UpdateProfileRequest {
  const factory UpdateProfileRequest({
    String? firstName,
    String? lastName,
    String? phone,
  }) = _UpdateProfileRequest;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);
}
