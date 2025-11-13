// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceSessionModel _$AttendanceSessionModelFromJson(
    Map<String, dynamic> json) {
  return _AttendanceSessionModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceSessionModel {
  String get id => throw _privateConstructorUsedError;
  String get subjectEnrollmentId => throw _privateConstructorUsedError;
  String get teacherId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AttendanceSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceSessionModelCopyWith<AttendanceSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceSessionModelCopyWith<$Res> {
  factory $AttendanceSessionModelCopyWith(AttendanceSessionModel value,
          $Res Function(AttendanceSessionModel) then) =
      _$AttendanceSessionModelCopyWithImpl<$Res, AttendanceSessionModel>;
  @useResult
  $Res call(
      {String id,
      String subjectEnrollmentId,
      String teacherId,
      DateTime date,
      String startTime,
      String endTime,
      String type,
      DateTime createdAt});
}

/// @nodoc
class _$AttendanceSessionModelCopyWithImpl<$Res,
        $Val extends AttendanceSessionModel>
    implements $AttendanceSessionModelCopyWith<$Res> {
  _$AttendanceSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectEnrollmentId = null,
    Object? teacherId = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectEnrollmentId: null == subjectEnrollmentId
          ? _value.subjectEnrollmentId
          : subjectEnrollmentId // ignore: cast_nullable_to_non_nullable
              as String,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceSessionModelImplCopyWith<$Res>
    implements $AttendanceSessionModelCopyWith<$Res> {
  factory _$$AttendanceSessionModelImplCopyWith(
          _$AttendanceSessionModelImpl value,
          $Res Function(_$AttendanceSessionModelImpl) then) =
      __$$AttendanceSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String subjectEnrollmentId,
      String teacherId,
      DateTime date,
      String startTime,
      String endTime,
      String type,
      DateTime createdAt});
}

/// @nodoc
class __$$AttendanceSessionModelImplCopyWithImpl<$Res>
    extends _$AttendanceSessionModelCopyWithImpl<$Res,
        _$AttendanceSessionModelImpl>
    implements _$$AttendanceSessionModelImplCopyWith<$Res> {
  __$$AttendanceSessionModelImplCopyWithImpl(
      _$AttendanceSessionModelImpl _value,
      $Res Function(_$AttendanceSessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectEnrollmentId = null,
    Object? teacherId = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_$AttendanceSessionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectEnrollmentId: null == subjectEnrollmentId
          ? _value.subjectEnrollmentId
          : subjectEnrollmentId // ignore: cast_nullable_to_non_nullable
              as String,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceSessionModelImpl implements _AttendanceSessionModel {
  const _$AttendanceSessionModelImpl(
      {required this.id,
      required this.subjectEnrollmentId,
      required this.teacherId,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.type,
      required this.createdAt});

  factory _$AttendanceSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceSessionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String subjectEnrollmentId;
  @override
  final String teacherId;
  @override
  final DateTime date;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String type;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'AttendanceSessionModel(id: $id, subjectEnrollmentId: $subjectEnrollmentId, teacherId: $teacherId, date: $date, startTime: $startTime, endTime: $endTime, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceSessionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subjectEnrollmentId, subjectEnrollmentId) ||
                other.subjectEnrollmentId == subjectEnrollmentId) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, subjectEnrollmentId,
      teacherId, date, startTime, endTime, type, createdAt);

  /// Create a copy of AttendanceSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceSessionModelImplCopyWith<_$AttendanceSessionModelImpl>
      get copyWith => __$$AttendanceSessionModelImplCopyWithImpl<
          _$AttendanceSessionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceSessionModelImplToJson(
      this,
    );
  }
}

abstract class _AttendanceSessionModel implements AttendanceSessionModel {
  const factory _AttendanceSessionModel(
      {required final String id,
      required final String subjectEnrollmentId,
      required final String teacherId,
      required final DateTime date,
      required final String startTime,
      required final String endTime,
      required final String type,
      required final DateTime createdAt}) = _$AttendanceSessionModelImpl;

  factory _AttendanceSessionModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceSessionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get subjectEnrollmentId;
  @override
  String get teacherId;
  @override
  DateTime get date;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String get type;
  @override
  DateTime get createdAt;

  /// Create a copy of AttendanceSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceSessionModelImplCopyWith<_$AttendanceSessionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateSessionRequest _$CreateSessionRequestFromJson(Map<String, dynamic> json) {
  return _CreateSessionRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateSessionRequest {
  String get subjectEnrollmentId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError; // "YYYY-MM-DD"
  String get startTime => throw _privateConstructorUsedError; // "HH:MM:SS"
  String get endTime => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this CreateSessionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSessionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSessionRequestCopyWith<CreateSessionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSessionRequestCopyWith<$Res> {
  factory $CreateSessionRequestCopyWith(CreateSessionRequest value,
          $Res Function(CreateSessionRequest) then) =
      _$CreateSessionRequestCopyWithImpl<$Res, CreateSessionRequest>;
  @useResult
  $Res call(
      {String subjectEnrollmentId,
      String date,
      String startTime,
      String endTime,
      String? type});
}

/// @nodoc
class _$CreateSessionRequestCopyWithImpl<$Res,
        $Val extends CreateSessionRequest>
    implements $CreateSessionRequestCopyWith<$Res> {
  _$CreateSessionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSessionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectEnrollmentId = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      subjectEnrollmentId: null == subjectEnrollmentId
          ? _value.subjectEnrollmentId
          : subjectEnrollmentId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateSessionRequestImplCopyWith<$Res>
    implements $CreateSessionRequestCopyWith<$Res> {
  factory _$$CreateSessionRequestImplCopyWith(_$CreateSessionRequestImpl value,
          $Res Function(_$CreateSessionRequestImpl) then) =
      __$$CreateSessionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String subjectEnrollmentId,
      String date,
      String startTime,
      String endTime,
      String? type});
}

/// @nodoc
class __$$CreateSessionRequestImplCopyWithImpl<$Res>
    extends _$CreateSessionRequestCopyWithImpl<$Res, _$CreateSessionRequestImpl>
    implements _$$CreateSessionRequestImplCopyWith<$Res> {
  __$$CreateSessionRequestImplCopyWithImpl(_$CreateSessionRequestImpl _value,
      $Res Function(_$CreateSessionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateSessionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectEnrollmentId = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = freezed,
  }) {
    return _then(_$CreateSessionRequestImpl(
      subjectEnrollmentId: null == subjectEnrollmentId
          ? _value.subjectEnrollmentId
          : subjectEnrollmentId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSessionRequestImpl implements _CreateSessionRequest {
  const _$CreateSessionRequestImpl(
      {required this.subjectEnrollmentId,
      required this.date,
      required this.startTime,
      required this.endTime,
      this.type});

  factory _$CreateSessionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSessionRequestImplFromJson(json);

  @override
  final String subjectEnrollmentId;
  @override
  final String date;
// "YYYY-MM-DD"
  @override
  final String startTime;
// "HH:MM:SS"
  @override
  final String endTime;
  @override
  final String? type;

  @override
  String toString() {
    return 'CreateSessionRequest(subjectEnrollmentId: $subjectEnrollmentId, date: $date, startTime: $startTime, endTime: $endTime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSessionRequestImpl &&
            (identical(other.subjectEnrollmentId, subjectEnrollmentId) ||
                other.subjectEnrollmentId == subjectEnrollmentId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, subjectEnrollmentId, date, startTime, endTime, type);

  /// Create a copy of CreateSessionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSessionRequestImplCopyWith<_$CreateSessionRequestImpl>
      get copyWith =>
          __$$CreateSessionRequestImplCopyWithImpl<_$CreateSessionRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSessionRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateSessionRequest implements CreateSessionRequest {
  const factory _CreateSessionRequest(
      {required final String subjectEnrollmentId,
      required final String date,
      required final String startTime,
      required final String endTime,
      final String? type}) = _$CreateSessionRequestImpl;

  factory _CreateSessionRequest.fromJson(Map<String, dynamic> json) =
      _$CreateSessionRequestImpl.fromJson;

  @override
  String get subjectEnrollmentId;
  @override
  String get date; // "YYYY-MM-DD"
  @override
  String get startTime; // "HH:MM:SS"
  @override
  String get endTime;
  @override
  String? get type;

  /// Create a copy of CreateSessionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSessionRequestImplCopyWith<_$CreateSessionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentAttendanceModel _$StudentAttendanceModelFromJson(
    Map<String, dynamic> json) {
  return _StudentAttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$StudentAttendanceModel {
  String get id => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get markedAt => throw _privateConstructorUsedError;
  StudentInfo get student => throw _privateConstructorUsedError;

  /// Serializes this StudentAttendanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentAttendanceModelCopyWith<StudentAttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentAttendanceModelCopyWith<$Res> {
  factory $StudentAttendanceModelCopyWith(StudentAttendanceModel value,
          $Res Function(StudentAttendanceModel) then) =
      _$StudentAttendanceModelCopyWithImpl<$Res, StudentAttendanceModel>;
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String studentId,
      String status,
      DateTime markedAt,
      StudentInfo student});

  $StudentInfoCopyWith<$Res> get student;
}

/// @nodoc
class _$StudentAttendanceModelCopyWithImpl<$Res,
        $Val extends StudentAttendanceModel>
    implements $StudentAttendanceModelCopyWith<$Res> {
  _$StudentAttendanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? studentId = null,
    Object? status = null,
    Object? markedAt = null,
    Object? student = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      markedAt: null == markedAt
          ? _value.markedAt
          : markedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as StudentInfo,
    ) as $Val);
  }

  /// Create a copy of StudentAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudentInfoCopyWith<$Res> get student {
    return $StudentInfoCopyWith<$Res>(_value.student, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentAttendanceModelImplCopyWith<$Res>
    implements $StudentAttendanceModelCopyWith<$Res> {
  factory _$$StudentAttendanceModelImplCopyWith(
          _$StudentAttendanceModelImpl value,
          $Res Function(_$StudentAttendanceModelImpl) then) =
      __$$StudentAttendanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String studentId,
      String status,
      DateTime markedAt,
      StudentInfo student});

  @override
  $StudentInfoCopyWith<$Res> get student;
}

/// @nodoc
class __$$StudentAttendanceModelImplCopyWithImpl<$Res>
    extends _$StudentAttendanceModelCopyWithImpl<$Res,
        _$StudentAttendanceModelImpl>
    implements _$$StudentAttendanceModelImplCopyWith<$Res> {
  __$$StudentAttendanceModelImplCopyWithImpl(
      _$StudentAttendanceModelImpl _value,
      $Res Function(_$StudentAttendanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? studentId = null,
    Object? status = null,
    Object? markedAt = null,
    Object? student = null,
  }) {
    return _then(_$StudentAttendanceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      markedAt: null == markedAt
          ? _value.markedAt
          : markedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as StudentInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentAttendanceModelImpl implements _StudentAttendanceModel {
  const _$StudentAttendanceModelImpl(
      {required this.id,
      required this.sessionId,
      required this.studentId,
      required this.status,
      required this.markedAt,
      required this.student});

  factory _$StudentAttendanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentAttendanceModelImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionId;
  @override
  final String studentId;
  @override
  final String status;
  @override
  final DateTime markedAt;
  @override
  final StudentInfo student;

  @override
  String toString() {
    return 'StudentAttendanceModel(id: $id, sessionId: $sessionId, studentId: $studentId, status: $status, markedAt: $markedAt, student: $student)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentAttendanceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.markedAt, markedAt) ||
                other.markedAt == markedAt) &&
            (identical(other.student, student) || other.student == student));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sessionId, studentId, status, markedAt, student);

  /// Create a copy of StudentAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentAttendanceModelImplCopyWith<_$StudentAttendanceModelImpl>
      get copyWith => __$$StudentAttendanceModelImplCopyWithImpl<
          _$StudentAttendanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentAttendanceModelImplToJson(
      this,
    );
  }
}

abstract class _StudentAttendanceModel implements StudentAttendanceModel {
  const factory _StudentAttendanceModel(
      {required final String id,
      required final String sessionId,
      required final String studentId,
      required final String status,
      required final DateTime markedAt,
      required final StudentInfo student}) = _$StudentAttendanceModelImpl;

  factory _StudentAttendanceModel.fromJson(Map<String, dynamic> json) =
      _$StudentAttendanceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionId;
  @override
  String get studentId;
  @override
  String get status;
  @override
  DateTime get markedAt;
  @override
  StudentInfo get student;

  /// Create a copy of StudentAttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentAttendanceModelImplCopyWith<_$StudentAttendanceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StudentInfo _$StudentInfoFromJson(Map<String, dynamic> json) {
  return _StudentInfo.fromJson(json);
}

/// @nodoc
mixin _$StudentInfo {
  String get id => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;

  /// Serializes this StudentInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentInfoCopyWith<StudentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentInfoCopyWith<$Res> {
  factory $StudentInfoCopyWith(
          StudentInfo value, $Res Function(StudentInfo) then) =
      _$StudentInfoCopyWithImpl<$Res, StudentInfo>;
  @useResult
  $Res call({String id, String studentId, String firstName, String lastName});
}

/// @nodoc
class _$StudentInfoCopyWithImpl<$Res, $Val extends StudentInfo>
    implements $StudentInfoCopyWith<$Res> {
  _$StudentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentId = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentInfoImplCopyWith<$Res>
    implements $StudentInfoCopyWith<$Res> {
  factory _$$StudentInfoImplCopyWith(
          _$StudentInfoImpl value, $Res Function(_$StudentInfoImpl) then) =
      __$$StudentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String studentId, String firstName, String lastName});
}

/// @nodoc
class __$$StudentInfoImplCopyWithImpl<$Res>
    extends _$StudentInfoCopyWithImpl<$Res, _$StudentInfoImpl>
    implements _$$StudentInfoImplCopyWith<$Res> {
  __$$StudentInfoImplCopyWithImpl(
      _$StudentInfoImpl _value, $Res Function(_$StudentInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentId = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$StudentInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentInfoImpl extends _StudentInfo {
  const _$StudentInfoImpl(
      {required this.id,
      required this.studentId,
      required this.firstName,
      required this.lastName})
      : super._();

  factory _$StudentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String studentId;
  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'StudentInfo(id: $id, studentId: $studentId, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, studentId, firstName, lastName);

  /// Create a copy of StudentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentInfoImplCopyWith<_$StudentInfoImpl> get copyWith =>
      __$$StudentInfoImplCopyWithImpl<_$StudentInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentInfoImplToJson(
      this,
    );
  }
}

abstract class _StudentInfo extends StudentInfo {
  const factory _StudentInfo(
      {required final String id,
      required final String studentId,
      required final String firstName,
      required final String lastName}) = _$StudentInfoImpl;
  const _StudentInfo._() : super._();

  factory _StudentInfo.fromJson(Map<String, dynamic> json) =
      _$StudentInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get studentId;
  @override
  String get firstName;
  @override
  String get lastName;

  /// Create a copy of StudentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentInfoImplCopyWith<_$StudentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarkAttendanceRequest _$MarkAttendanceRequestFromJson(
    Map<String, dynamic> json) {
  return _MarkAttendanceRequest.fromJson(json);
}

/// @nodoc
mixin _$MarkAttendanceRequest {
  String get sessionId => throw _privateConstructorUsedError;
  List<AttendanceRecord> get records => throw _privateConstructorUsedError;

  /// Serializes this MarkAttendanceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MarkAttendanceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarkAttendanceRequestCopyWith<MarkAttendanceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkAttendanceRequestCopyWith<$Res> {
  factory $MarkAttendanceRequestCopyWith(MarkAttendanceRequest value,
          $Res Function(MarkAttendanceRequest) then) =
      _$MarkAttendanceRequestCopyWithImpl<$Res, MarkAttendanceRequest>;
  @useResult
  $Res call({String sessionId, List<AttendanceRecord> records});
}

/// @nodoc
class _$MarkAttendanceRequestCopyWithImpl<$Res,
        $Val extends MarkAttendanceRequest>
    implements $MarkAttendanceRequestCopyWith<$Res> {
  _$MarkAttendanceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarkAttendanceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? records = null,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRecord>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkAttendanceRequestImplCopyWith<$Res>
    implements $MarkAttendanceRequestCopyWith<$Res> {
  factory _$$MarkAttendanceRequestImplCopyWith(
          _$MarkAttendanceRequestImpl value,
          $Res Function(_$MarkAttendanceRequestImpl) then) =
      __$$MarkAttendanceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sessionId, List<AttendanceRecord> records});
}

/// @nodoc
class __$$MarkAttendanceRequestImplCopyWithImpl<$Res>
    extends _$MarkAttendanceRequestCopyWithImpl<$Res,
        _$MarkAttendanceRequestImpl>
    implements _$$MarkAttendanceRequestImplCopyWith<$Res> {
  __$$MarkAttendanceRequestImplCopyWithImpl(_$MarkAttendanceRequestImpl _value,
      $Res Function(_$MarkAttendanceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarkAttendanceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? records = null,
  }) {
    return _then(_$MarkAttendanceRequestImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRecord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarkAttendanceRequestImpl implements _MarkAttendanceRequest {
  const _$MarkAttendanceRequestImpl(
      {required this.sessionId, required final List<AttendanceRecord> records})
      : _records = records;

  factory _$MarkAttendanceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkAttendanceRequestImplFromJson(json);

  @override
  final String sessionId;
  final List<AttendanceRecord> _records;
  @override
  List<AttendanceRecord> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  String toString() {
    return 'MarkAttendanceRequest(sessionId: $sessionId, records: $records)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAttendanceRequestImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sessionId, const DeepCollectionEquality().hash(_records));

  /// Create a copy of MarkAttendanceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAttendanceRequestImplCopyWith<_$MarkAttendanceRequestImpl>
      get copyWith => __$$MarkAttendanceRequestImplCopyWithImpl<
          _$MarkAttendanceRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkAttendanceRequestImplToJson(
      this,
    );
  }
}

abstract class _MarkAttendanceRequest implements MarkAttendanceRequest {
  const factory _MarkAttendanceRequest(
          {required final String sessionId,
          required final List<AttendanceRecord> records}) =
      _$MarkAttendanceRequestImpl;

  factory _MarkAttendanceRequest.fromJson(Map<String, dynamic> json) =
      _$MarkAttendanceRequestImpl.fromJson;

  @override
  String get sessionId;
  @override
  List<AttendanceRecord> get records;

  /// Create a copy of MarkAttendanceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkAttendanceRequestImplCopyWith<_$MarkAttendanceRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AttendanceRecord _$AttendanceRecordFromJson(Map<String, dynamic> json) {
  return _AttendanceRecord.fromJson(json);
}

/// @nodoc
mixin _$AttendanceRecord {
  String get studentId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this AttendanceRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceRecordCopyWith<AttendanceRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceRecordCopyWith<$Res> {
  factory $AttendanceRecordCopyWith(
          AttendanceRecord value, $Res Function(AttendanceRecord) then) =
      _$AttendanceRecordCopyWithImpl<$Res, AttendanceRecord>;
  @useResult
  $Res call({String studentId, String status});
}

/// @nodoc
class _$AttendanceRecordCopyWithImpl<$Res, $Val extends AttendanceRecord>
    implements $AttendanceRecordCopyWith<$Res> {
  _$AttendanceRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceRecordImplCopyWith<$Res>
    implements $AttendanceRecordCopyWith<$Res> {
  factory _$$AttendanceRecordImplCopyWith(_$AttendanceRecordImpl value,
          $Res Function(_$AttendanceRecordImpl) then) =
      __$$AttendanceRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String studentId, String status});
}

/// @nodoc
class __$$AttendanceRecordImplCopyWithImpl<$Res>
    extends _$AttendanceRecordCopyWithImpl<$Res, _$AttendanceRecordImpl>
    implements _$$AttendanceRecordImplCopyWith<$Res> {
  __$$AttendanceRecordImplCopyWithImpl(_$AttendanceRecordImpl _value,
      $Res Function(_$AttendanceRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? status = null,
  }) {
    return _then(_$AttendanceRecordImpl(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceRecordImpl implements _AttendanceRecord {
  const _$AttendanceRecordImpl({required this.studentId, required this.status});

  factory _$AttendanceRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceRecordImplFromJson(json);

  @override
  final String studentId;
  @override
  final String status;

  @override
  String toString() {
    return 'AttendanceRecord(studentId: $studentId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceRecordImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, studentId, status);

  /// Create a copy of AttendanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceRecordImplCopyWith<_$AttendanceRecordImpl> get copyWith =>
      __$$AttendanceRecordImplCopyWithImpl<_$AttendanceRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceRecordImplToJson(
      this,
    );
  }
}

abstract class _AttendanceRecord implements AttendanceRecord {
  const factory _AttendanceRecord(
      {required final String studentId,
      required final String status}) = _$AttendanceRecordImpl;

  factory _AttendanceRecord.fromJson(Map<String, dynamic> json) =
      _$AttendanceRecordImpl.fromJson;

  @override
  String get studentId;
  @override
  String get status;

  /// Create a copy of AttendanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceRecordImplCopyWith<_$AttendanceRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionWithDetails _$SessionWithDetailsFromJson(Map<String, dynamic> json) {
  return _SessionWithDetails.fromJson(json);
}

/// @nodoc
mixin _$SessionWithDetails {
  String get id => throw _privateConstructorUsedError;
  String get subjectEnrollmentId => throw _privateConstructorUsedError;
  String get teacherId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  SubjectEnrollmentDetailInfo get subjectEnrollment =>
      throw _privateConstructorUsedError;
  SessionRecordsCount get count => throw _privateConstructorUsedError;

  /// Serializes this SessionWithDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionWithDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionWithDetailsCopyWith<SessionWithDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionWithDetailsCopyWith<$Res> {
  factory $SessionWithDetailsCopyWith(
          SessionWithDetails value, $Res Function(SessionWithDetails) then) =
      _$SessionWithDetailsCopyWithImpl<$Res, SessionWithDetails>;
  @useResult
  $Res call(
      {String id,
      String subjectEnrollmentId,
      String teacherId,
      DateTime date,
      String startTime,
      String endTime,
      String type,
      DateTime createdAt,
      SubjectEnrollmentDetailInfo subjectEnrollment,
      SessionRecordsCount count});

  $SubjectEnrollmentDetailInfoCopyWith<$Res> get subjectEnrollment;
  $SessionRecordsCountCopyWith<$Res> get count;
}

/// @nodoc
class _$SessionWithDetailsCopyWithImpl<$Res, $Val extends SessionWithDetails>
    implements $SessionWithDetailsCopyWith<$Res> {
  _$SessionWithDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionWithDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectEnrollmentId = null,
    Object? teacherId = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? createdAt = null,
    Object? subjectEnrollment = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectEnrollmentId: null == subjectEnrollmentId
          ? _value.subjectEnrollmentId
          : subjectEnrollmentId // ignore: cast_nullable_to_non_nullable
              as String,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subjectEnrollment: null == subjectEnrollment
          ? _value.subjectEnrollment
          : subjectEnrollment // ignore: cast_nullable_to_non_nullable
              as SubjectEnrollmentDetailInfo,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as SessionRecordsCount,
    ) as $Val);
  }

  /// Create a copy of SessionWithDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectEnrollmentDetailInfoCopyWith<$Res> get subjectEnrollment {
    return $SubjectEnrollmentDetailInfoCopyWith<$Res>(_value.subjectEnrollment,
        (value) {
      return _then(_value.copyWith(subjectEnrollment: value) as $Val);
    });
  }

  /// Create a copy of SessionWithDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionRecordsCountCopyWith<$Res> get count {
    return $SessionRecordsCountCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionWithDetailsImplCopyWith<$Res>
    implements $SessionWithDetailsCopyWith<$Res> {
  factory _$$SessionWithDetailsImplCopyWith(_$SessionWithDetailsImpl value,
          $Res Function(_$SessionWithDetailsImpl) then) =
      __$$SessionWithDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String subjectEnrollmentId,
      String teacherId,
      DateTime date,
      String startTime,
      String endTime,
      String type,
      DateTime createdAt,
      SubjectEnrollmentDetailInfo subjectEnrollment,
      SessionRecordsCount count});

  @override
  $SubjectEnrollmentDetailInfoCopyWith<$Res> get subjectEnrollment;
  @override
  $SessionRecordsCountCopyWith<$Res> get count;
}

/// @nodoc
class __$$SessionWithDetailsImplCopyWithImpl<$Res>
    extends _$SessionWithDetailsCopyWithImpl<$Res, _$SessionWithDetailsImpl>
    implements _$$SessionWithDetailsImplCopyWith<$Res> {
  __$$SessionWithDetailsImplCopyWithImpl(_$SessionWithDetailsImpl _value,
      $Res Function(_$SessionWithDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionWithDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectEnrollmentId = null,
    Object? teacherId = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? createdAt = null,
    Object? subjectEnrollment = null,
    Object? count = null,
  }) {
    return _then(_$SessionWithDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectEnrollmentId: null == subjectEnrollmentId
          ? _value.subjectEnrollmentId
          : subjectEnrollmentId // ignore: cast_nullable_to_non_nullable
              as String,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subjectEnrollment: null == subjectEnrollment
          ? _value.subjectEnrollment
          : subjectEnrollment // ignore: cast_nullable_to_non_nullable
              as SubjectEnrollmentDetailInfo,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as SessionRecordsCount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionWithDetailsImpl implements _SessionWithDetails {
  const _$SessionWithDetailsImpl(
      {required this.id,
      required this.subjectEnrollmentId,
      required this.teacherId,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.type,
      required this.createdAt,
      required this.subjectEnrollment,
      required this.count});

  factory _$SessionWithDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionWithDetailsImplFromJson(json);

  @override
  final String id;
  @override
  final String subjectEnrollmentId;
  @override
  final String teacherId;
  @override
  final DateTime date;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String type;
  @override
  final DateTime createdAt;
  @override
  final SubjectEnrollmentDetailInfo subjectEnrollment;
  @override
  final SessionRecordsCount count;

  @override
  String toString() {
    return 'SessionWithDetails(id: $id, subjectEnrollmentId: $subjectEnrollmentId, teacherId: $teacherId, date: $date, startTime: $startTime, endTime: $endTime, type: $type, createdAt: $createdAt, subjectEnrollment: $subjectEnrollment, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionWithDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subjectEnrollmentId, subjectEnrollmentId) ||
                other.subjectEnrollmentId == subjectEnrollmentId) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.subjectEnrollment, subjectEnrollment) ||
                other.subjectEnrollment == subjectEnrollment) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      subjectEnrollmentId,
      teacherId,
      date,
      startTime,
      endTime,
      type,
      createdAt,
      subjectEnrollment,
      count);

  /// Create a copy of SessionWithDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionWithDetailsImplCopyWith<_$SessionWithDetailsImpl> get copyWith =>
      __$$SessionWithDetailsImplCopyWithImpl<_$SessionWithDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionWithDetailsImplToJson(
      this,
    );
  }
}

abstract class _SessionWithDetails implements SessionWithDetails {
  const factory _SessionWithDetails(
      {required final String id,
      required final String subjectEnrollmentId,
      required final String teacherId,
      required final DateTime date,
      required final String startTime,
      required final String endTime,
      required final String type,
      required final DateTime createdAt,
      required final SubjectEnrollmentDetailInfo subjectEnrollment,
      required final SessionRecordsCount count}) = _$SessionWithDetailsImpl;

  factory _SessionWithDetails.fromJson(Map<String, dynamic> json) =
      _$SessionWithDetailsImpl.fromJson;

  @override
  String get id;
  @override
  String get subjectEnrollmentId;
  @override
  String get teacherId;
  @override
  DateTime get date;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String get type;
  @override
  DateTime get createdAt;
  @override
  SubjectEnrollmentDetailInfo get subjectEnrollment;
  @override
  SessionRecordsCount get count;

  /// Create a copy of SessionWithDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionWithDetailsImplCopyWith<_$SessionWithDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubjectEnrollmentDetailInfo _$SubjectEnrollmentDetailInfoFromJson(
    Map<String, dynamic> json) {
  return _SubjectEnrollmentDetailInfo.fromJson(json);
}

/// @nodoc
mixin _$SubjectEnrollmentDetailInfo {
  SubjectInfo get subject => throw _privateConstructorUsedError;
  BatchInfo get batch => throw _privateConstructorUsedError;

  /// Serializes this SubjectEnrollmentDetailInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectEnrollmentDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectEnrollmentDetailInfoCopyWith<SubjectEnrollmentDetailInfo>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectEnrollmentDetailInfoCopyWith<$Res> {
  factory $SubjectEnrollmentDetailInfoCopyWith(
          SubjectEnrollmentDetailInfo value,
          $Res Function(SubjectEnrollmentDetailInfo) then) =
      _$SubjectEnrollmentDetailInfoCopyWithImpl<$Res,
          SubjectEnrollmentDetailInfo>;
  @useResult
  $Res call({SubjectInfo subject, BatchInfo batch});

  $SubjectInfoCopyWith<$Res> get subject;
  $BatchInfoCopyWith<$Res> get batch;
}

/// @nodoc
class _$SubjectEnrollmentDetailInfoCopyWithImpl<$Res,
        $Val extends SubjectEnrollmentDetailInfo>
    implements $SubjectEnrollmentDetailInfoCopyWith<$Res> {
  _$SubjectEnrollmentDetailInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectEnrollmentDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? batch = null,
  }) {
    return _then(_value.copyWith(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectInfo,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as BatchInfo,
    ) as $Val);
  }

  /// Create a copy of SubjectEnrollmentDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectInfoCopyWith<$Res> get subject {
    return $SubjectInfoCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  /// Create a copy of SubjectEnrollmentDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BatchInfoCopyWith<$Res> get batch {
    return $BatchInfoCopyWith<$Res>(_value.batch, (value) {
      return _then(_value.copyWith(batch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubjectEnrollmentDetailInfoImplCopyWith<$Res>
    implements $SubjectEnrollmentDetailInfoCopyWith<$Res> {
  factory _$$SubjectEnrollmentDetailInfoImplCopyWith(
          _$SubjectEnrollmentDetailInfoImpl value,
          $Res Function(_$SubjectEnrollmentDetailInfoImpl) then) =
      __$$SubjectEnrollmentDetailInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SubjectInfo subject, BatchInfo batch});

  @override
  $SubjectInfoCopyWith<$Res> get subject;
  @override
  $BatchInfoCopyWith<$Res> get batch;
}

/// @nodoc
class __$$SubjectEnrollmentDetailInfoImplCopyWithImpl<$Res>
    extends _$SubjectEnrollmentDetailInfoCopyWithImpl<$Res,
        _$SubjectEnrollmentDetailInfoImpl>
    implements _$$SubjectEnrollmentDetailInfoImplCopyWith<$Res> {
  __$$SubjectEnrollmentDetailInfoImplCopyWithImpl(
      _$SubjectEnrollmentDetailInfoImpl _value,
      $Res Function(_$SubjectEnrollmentDetailInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectEnrollmentDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? batch = null,
  }) {
    return _then(_$SubjectEnrollmentDetailInfoImpl(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectInfo,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as BatchInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectEnrollmentDetailInfoImpl
    implements _SubjectEnrollmentDetailInfo {
  const _$SubjectEnrollmentDetailInfoImpl(
      {required this.subject, required this.batch});

  factory _$SubjectEnrollmentDetailInfoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SubjectEnrollmentDetailInfoImplFromJson(json);

  @override
  final SubjectInfo subject;
  @override
  final BatchInfo batch;

  @override
  String toString() {
    return 'SubjectEnrollmentDetailInfo(subject: $subject, batch: $batch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectEnrollmentDetailInfoImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.batch, batch) || other.batch == batch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subject, batch);

  /// Create a copy of SubjectEnrollmentDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectEnrollmentDetailInfoImplCopyWith<_$SubjectEnrollmentDetailInfoImpl>
      get copyWith => __$$SubjectEnrollmentDetailInfoImplCopyWithImpl<
          _$SubjectEnrollmentDetailInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectEnrollmentDetailInfoImplToJson(
      this,
    );
  }
}

abstract class _SubjectEnrollmentDetailInfo
    implements SubjectEnrollmentDetailInfo {
  const factory _SubjectEnrollmentDetailInfo(
      {required final SubjectInfo subject,
      required final BatchInfo batch}) = _$SubjectEnrollmentDetailInfoImpl;

  factory _SubjectEnrollmentDetailInfo.fromJson(Map<String, dynamic> json) =
      _$SubjectEnrollmentDetailInfoImpl.fromJson;

  @override
  SubjectInfo get subject;
  @override
  BatchInfo get batch;

  /// Create a copy of SubjectEnrollmentDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectEnrollmentDetailInfoImplCopyWith<_$SubjectEnrollmentDetailInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SessionRecordsCount _$SessionRecordsCountFromJson(Map<String, dynamic> json) {
  return _SessionRecordsCount.fromJson(json);
}

/// @nodoc
mixin _$SessionRecordsCount {
  int get records => throw _privateConstructorUsedError;

  /// Serializes this SessionRecordsCount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionRecordsCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionRecordsCountCopyWith<SessionRecordsCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionRecordsCountCopyWith<$Res> {
  factory $SessionRecordsCountCopyWith(
          SessionRecordsCount value, $Res Function(SessionRecordsCount) then) =
      _$SessionRecordsCountCopyWithImpl<$Res, SessionRecordsCount>;
  @useResult
  $Res call({int records});
}

/// @nodoc
class _$SessionRecordsCountCopyWithImpl<$Res, $Val extends SessionRecordsCount>
    implements $SessionRecordsCountCopyWith<$Res> {
  _$SessionRecordsCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionRecordsCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
  }) {
    return _then(_value.copyWith(
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionRecordsCountImplCopyWith<$Res>
    implements $SessionRecordsCountCopyWith<$Res> {
  factory _$$SessionRecordsCountImplCopyWith(_$SessionRecordsCountImpl value,
          $Res Function(_$SessionRecordsCountImpl) then) =
      __$$SessionRecordsCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int records});
}

/// @nodoc
class __$$SessionRecordsCountImplCopyWithImpl<$Res>
    extends _$SessionRecordsCountCopyWithImpl<$Res, _$SessionRecordsCountImpl>
    implements _$$SessionRecordsCountImplCopyWith<$Res> {
  __$$SessionRecordsCountImplCopyWithImpl(_$SessionRecordsCountImpl _value,
      $Res Function(_$SessionRecordsCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionRecordsCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
  }) {
    return _then(_$SessionRecordsCountImpl(
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionRecordsCountImpl implements _SessionRecordsCount {
  const _$SessionRecordsCountImpl({required this.records});

  factory _$SessionRecordsCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionRecordsCountImplFromJson(json);

  @override
  final int records;

  @override
  String toString() {
    return 'SessionRecordsCount(records: $records)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionRecordsCountImpl &&
            (identical(other.records, records) || other.records == records));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, records);

  /// Create a copy of SessionRecordsCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionRecordsCountImplCopyWith<_$SessionRecordsCountImpl> get copyWith =>
      __$$SessionRecordsCountImplCopyWithImpl<_$SessionRecordsCountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionRecordsCountImplToJson(
      this,
    );
  }
}

abstract class _SessionRecordsCount implements SessionRecordsCount {
  const factory _SessionRecordsCount({required final int records}) =
      _$SessionRecordsCountImpl;

  factory _SessionRecordsCount.fromJson(Map<String, dynamic> json) =
      _$SessionRecordsCountImpl.fromJson;

  @override
  int get records;

  /// Create a copy of SessionRecordsCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionRecordsCountImplCopyWith<_$SessionRecordsCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttendanceRecordDetail _$AttendanceRecordDetailFromJson(
    Map<String, dynamic> json) {
  return _AttendanceRecordDetail.fromJson(json);
}

/// @nodoc
mixin _$AttendanceRecordDetail {
  String get id => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get markedAt => throw _privateConstructorUsedError;
  StudentInfo get student => throw _privateConstructorUsedError;

  /// Serializes this AttendanceRecordDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceRecordDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceRecordDetailCopyWith<AttendanceRecordDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceRecordDetailCopyWith<$Res> {
  factory $AttendanceRecordDetailCopyWith(AttendanceRecordDetail value,
          $Res Function(AttendanceRecordDetail) then) =
      _$AttendanceRecordDetailCopyWithImpl<$Res, AttendanceRecordDetail>;
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String studentId,
      String status,
      DateTime markedAt,
      StudentInfo student});

  $StudentInfoCopyWith<$Res> get student;
}

/// @nodoc
class _$AttendanceRecordDetailCopyWithImpl<$Res,
        $Val extends AttendanceRecordDetail>
    implements $AttendanceRecordDetailCopyWith<$Res> {
  _$AttendanceRecordDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceRecordDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? studentId = null,
    Object? status = null,
    Object? markedAt = null,
    Object? student = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      markedAt: null == markedAt
          ? _value.markedAt
          : markedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as StudentInfo,
    ) as $Val);
  }

  /// Create a copy of AttendanceRecordDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudentInfoCopyWith<$Res> get student {
    return $StudentInfoCopyWith<$Res>(_value.student, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceRecordDetailImplCopyWith<$Res>
    implements $AttendanceRecordDetailCopyWith<$Res> {
  factory _$$AttendanceRecordDetailImplCopyWith(
          _$AttendanceRecordDetailImpl value,
          $Res Function(_$AttendanceRecordDetailImpl) then) =
      __$$AttendanceRecordDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sessionId,
      String studentId,
      String status,
      DateTime markedAt,
      StudentInfo student});

  @override
  $StudentInfoCopyWith<$Res> get student;
}

/// @nodoc
class __$$AttendanceRecordDetailImplCopyWithImpl<$Res>
    extends _$AttendanceRecordDetailCopyWithImpl<$Res,
        _$AttendanceRecordDetailImpl>
    implements _$$AttendanceRecordDetailImplCopyWith<$Res> {
  __$$AttendanceRecordDetailImplCopyWithImpl(
      _$AttendanceRecordDetailImpl _value,
      $Res Function(_$AttendanceRecordDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceRecordDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? studentId = null,
    Object? status = null,
    Object? markedAt = null,
    Object? student = null,
  }) {
    return _then(_$AttendanceRecordDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      markedAt: null == markedAt
          ? _value.markedAt
          : markedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as StudentInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceRecordDetailImpl implements _AttendanceRecordDetail {
  const _$AttendanceRecordDetailImpl(
      {required this.id,
      required this.sessionId,
      required this.studentId,
      required this.status,
      required this.markedAt,
      required this.student});

  factory _$AttendanceRecordDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceRecordDetailImplFromJson(json);

  @override
  final String id;
  @override
  final String sessionId;
  @override
  final String studentId;
  @override
  final String status;
  @override
  final DateTime markedAt;
  @override
  final StudentInfo student;

  @override
  String toString() {
    return 'AttendanceRecordDetail(id: $id, sessionId: $sessionId, studentId: $studentId, status: $status, markedAt: $markedAt, student: $student)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceRecordDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.markedAt, markedAt) ||
                other.markedAt == markedAt) &&
            (identical(other.student, student) || other.student == student));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sessionId, studentId, status, markedAt, student);

  /// Create a copy of AttendanceRecordDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceRecordDetailImplCopyWith<_$AttendanceRecordDetailImpl>
      get copyWith => __$$AttendanceRecordDetailImplCopyWithImpl<
          _$AttendanceRecordDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceRecordDetailImplToJson(
      this,
    );
  }
}

abstract class _AttendanceRecordDetail implements AttendanceRecordDetail {
  const factory _AttendanceRecordDetail(
      {required final String id,
      required final String sessionId,
      required final String studentId,
      required final String status,
      required final DateTime markedAt,
      required final StudentInfo student}) = _$AttendanceRecordDetailImpl;

  factory _AttendanceRecordDetail.fromJson(Map<String, dynamic> json) =
      _$AttendanceRecordDetailImpl.fromJson;

  @override
  String get id;
  @override
  String get sessionId;
  @override
  String get studentId;
  @override
  String get status;
  @override
  DateTime get markedAt;
  @override
  StudentInfo get student;

  /// Create a copy of AttendanceRecordDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceRecordDetailImplCopyWith<_$AttendanceRecordDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
