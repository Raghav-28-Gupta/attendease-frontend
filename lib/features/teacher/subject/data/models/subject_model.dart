import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_model.freezed.dart';
part 'subject_model.g.dart';

@freezed
class SubjectModel with _$SubjectModel {
  const factory SubjectModel({
    required String id,
    required String code,
    required String name,
    @JsonKey(name: 'credits') required double credits,
    required String department,
    required String semester,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SubjectModel;

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
}

@freezed
class CreateSubjectRequest with _$CreateSubjectRequest {
  const factory CreateSubjectRequest({
    required String code,
    required String name,
    @JsonKey(name: 'credits') required double credits,  // ✅ ADD THIS
    required String department,
    required String semester,
    String? description,
  }) = _CreateSubjectRequest;

  factory CreateSubjectRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSubjectRequestFromJson(json);
}

@freezed
class UpdateSubjectRequest with _$UpdateSubjectRequest {
  const factory UpdateSubjectRequest({
    String? code,
    String? name,
    @JsonKey(name: 'credits') double? credits,  // ✅ ADD THIS
    String? department,
    String? semester,
    String? description,
  }) = _UpdateSubjectRequest;

  factory UpdateSubjectRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubjectRequestFromJson(json);
}
