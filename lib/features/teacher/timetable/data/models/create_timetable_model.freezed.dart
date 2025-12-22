// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_timetable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateTimetableEntryRequest _$CreateTimetableEntryRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateTimetableEntryRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateTimetableEntryRequest {
  String get enrollmentId => throw _privateConstructorUsedError;
  String get dayOfWeek => throw _privateConstructorUsedError; // MONDAY..SUNDAY
  String get startTime => throw _privateConstructorUsedError; // HH:mm
  String get endTime => throw _privateConstructorUsedError; // HH:mm
  String? get room => throw _privateConstructorUsedError;

  /// Serializes this CreateTimetableEntryRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTimetableEntryRequestCopyWith<CreateTimetableEntryRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTimetableEntryRequestCopyWith<$Res> {
  factory $CreateTimetableEntryRequestCopyWith(
          CreateTimetableEntryRequest value,
          $Res Function(CreateTimetableEntryRequest) then) =
      _$CreateTimetableEntryRequestCopyWithImpl<$Res,
          CreateTimetableEntryRequest>;
  @useResult
  $Res call(
      {String enrollmentId,
      String dayOfWeek,
      String startTime,
      String endTime,
      String? room});
}

/// @nodoc
class _$CreateTimetableEntryRequestCopyWithImpl<$Res,
        $Val extends CreateTimetableEntryRequest>
    implements $CreateTimetableEntryRequestCopyWith<$Res> {
  _$CreateTimetableEntryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrollmentId = null,
    Object? dayOfWeek = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? room = freezed,
  }) {
    return _then(_value.copyWith(
      enrollmentId: null == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as String,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTimetableEntryRequestImplCopyWith<$Res>
    implements $CreateTimetableEntryRequestCopyWith<$Res> {
  factory _$$CreateTimetableEntryRequestImplCopyWith(
          _$CreateTimetableEntryRequestImpl value,
          $Res Function(_$CreateTimetableEntryRequestImpl) then) =
      __$$CreateTimetableEntryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String enrollmentId,
      String dayOfWeek,
      String startTime,
      String endTime,
      String? room});
}

/// @nodoc
class __$$CreateTimetableEntryRequestImplCopyWithImpl<$Res>
    extends _$CreateTimetableEntryRequestCopyWithImpl<$Res,
        _$CreateTimetableEntryRequestImpl>
    implements _$$CreateTimetableEntryRequestImplCopyWith<$Res> {
  __$$CreateTimetableEntryRequestImplCopyWithImpl(
      _$CreateTimetableEntryRequestImpl _value,
      $Res Function(_$CreateTimetableEntryRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrollmentId = null,
    Object? dayOfWeek = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? room = freezed,
  }) {
    return _then(_$CreateTimetableEntryRequestImpl(
      enrollmentId: null == enrollmentId
          ? _value.enrollmentId
          : enrollmentId // ignore: cast_nullable_to_non_nullable
              as String,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTimetableEntryRequestImpl
    implements _CreateTimetableEntryRequest {
  const _$CreateTimetableEntryRequestImpl(
      {required this.enrollmentId,
      required this.dayOfWeek,
      required this.startTime,
      required this.endTime,
      this.room});

  factory _$CreateTimetableEntryRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateTimetableEntryRequestImplFromJson(json);

  @override
  final String enrollmentId;
  @override
  final String dayOfWeek;
// MONDAY..SUNDAY
  @override
  final String startTime;
// HH:mm
  @override
  final String endTime;
// HH:mm
  @override
  final String? room;

  @override
  String toString() {
    return 'CreateTimetableEntryRequest(enrollmentId: $enrollmentId, dayOfWeek: $dayOfWeek, startTime: $startTime, endTime: $endTime, room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTimetableEntryRequestImpl &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.room, room) || other.room == room));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, enrollmentId, dayOfWeek, startTime, endTime, room);

  /// Create a copy of CreateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTimetableEntryRequestImplCopyWith<_$CreateTimetableEntryRequestImpl>
      get copyWith => __$$CreateTimetableEntryRequestImplCopyWithImpl<
          _$CreateTimetableEntryRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTimetableEntryRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateTimetableEntryRequest
    implements CreateTimetableEntryRequest {
  const factory _CreateTimetableEntryRequest(
      {required final String enrollmentId,
      required final String dayOfWeek,
      required final String startTime,
      required final String endTime,
      final String? room}) = _$CreateTimetableEntryRequestImpl;

  factory _CreateTimetableEntryRequest.fromJson(Map<String, dynamic> json) =
      _$CreateTimetableEntryRequestImpl.fromJson;

  @override
  String get enrollmentId;
  @override
  String get dayOfWeek; // MONDAY..SUNDAY
  @override
  String get startTime; // HH:mm
  @override
  String get endTime; // HH:mm
  @override
  String? get room;

  /// Create a copy of CreateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTimetableEntryRequestImplCopyWith<_$CreateTimetableEntryRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
