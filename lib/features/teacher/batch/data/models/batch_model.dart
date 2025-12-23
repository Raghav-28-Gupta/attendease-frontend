import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch_model.freezed.dart';
part 'batch_model.g.dart';

@freezed
class BatchModel with _$BatchModel {
  const factory BatchModel({
    required String id,
    required String code,
    required String name,
    @JsonKey(name: 'year') required String academicYear,
    String? department,
    String? description,
    required DateTime createdAt,
    required int studentCount,
  }) = _BatchModel;

  factory BatchModel.fromJson(Map<String, dynamic> json) =>
      _$BatchModelFromJson(json);
}

@freezed
class CreateBatchRequest with _$CreateBatchRequest {
  @JsonSerializable(includeIfNull: false)
  const factory CreateBatchRequest({
    required String code,
    required String name,
    @JsonKey(name: 'year') required String academicYear,
    String? description,
    String? department,
  }) = _CreateBatchRequest;

  factory CreateBatchRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBatchRequestFromJson(json);
}

@freezed
class UpdateBatchRequest with _$UpdateBatchRequest {
  @JsonSerializable(includeIfNull: false)
  const factory UpdateBatchRequest({
    String? code,
    String? name,
    String? academicYear,
    String? description,
    String? department,
  }) = _UpdateBatchRequest;

  factory UpdateBatchRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBatchRequestFromJson(json);
}
