import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_timetable_model.freezed.dart';
part 'create_timetable_model.g.dart';

@freezed
class CreateTimetableEntryRequest with _$CreateTimetableEntryRequest {
  const factory CreateTimetableEntryRequest({
    required String enrollmentId,
    required String dayOfWeek,   // MONDAY..SUNDAY
    required String startTime,   // HH:mm
    required String endTime,     // HH:mm
    String? room,
  }) = _CreateTimetableEntryRequest;

  factory CreateTimetableEntryRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTimetableEntryRequestFromJson(json);
}
