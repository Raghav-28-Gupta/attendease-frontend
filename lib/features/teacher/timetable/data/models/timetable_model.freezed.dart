// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimetableEntryModel _$TimetableEntryModelFromJson(Map<String, dynamic> json) {
  return _TimetableEntryModel.fromJson(json);
}

/// @nodoc
mixin _$TimetableEntryModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'subjectEnrollmentId')
  String get enrollmentId =>
      throw _privateConstructorUsedError; // ✅ Backend sends subjectEnrollmentId
  String get dayOfWeek => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'classRoom')
  String? get room =>
      throw _privateConstructorUsedError; // ✅ Backend sends classRoom
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'subjectEnrollment')
  EnrollmentInfo get enrollment => throw _privateConstructorUsedError;

  /// Serializes this TimetableEntryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimetableEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimetableEntryModelCopyWith<TimetableEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableEntryModelCopyWith<$Res> {
  factory $TimetableEntryModelCopyWith(
          TimetableEntryModel value, $Res Function(TimetableEntryModel) then) =
      _$TimetableEntryModelCopyWithImpl<$Res, TimetableEntryModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'subjectEnrollmentId') String enrollmentId,
      String dayOfWeek,
      String startTime,
      String endTime,
      @JsonKey(name: 'classRoom') String? room,
      DateTime createdAt,
      @JsonKey(name: 'subjectEnrollment') EnrollmentInfo enrollment});

  $EnrollmentInfoCopyWith<$Res> get enrollment;
}

/// @nodoc
class _$TimetableEntryModelCopyWithImpl<$Res, $Val extends TimetableEntryModel>
    implements $TimetableEntryModelCopyWith<$Res> {
  _$TimetableEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimetableEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? enrollmentId = null,
    Object? dayOfWeek = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? room = freezed,
    Object? createdAt = null,
    Object? enrollment = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      enrollment: null == enrollment
          ? _value.enrollment
          : enrollment // ignore: cast_nullable_to_non_nullable
              as EnrollmentInfo,
    ) as $Val);
  }

  /// Create a copy of TimetableEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EnrollmentInfoCopyWith<$Res> get enrollment {
    return $EnrollmentInfoCopyWith<$Res>(_value.enrollment, (value) {
      return _then(_value.copyWith(enrollment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimetableEntryModelImplCopyWith<$Res>
    implements $TimetableEntryModelCopyWith<$Res> {
  factory _$$TimetableEntryModelImplCopyWith(_$TimetableEntryModelImpl value,
          $Res Function(_$TimetableEntryModelImpl) then) =
      __$$TimetableEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'subjectEnrollmentId') String enrollmentId,
      String dayOfWeek,
      String startTime,
      String endTime,
      @JsonKey(name: 'classRoom') String? room,
      DateTime createdAt,
      @JsonKey(name: 'subjectEnrollment') EnrollmentInfo enrollment});

  @override
  $EnrollmentInfoCopyWith<$Res> get enrollment;
}

/// @nodoc
class __$$TimetableEntryModelImplCopyWithImpl<$Res>
    extends _$TimetableEntryModelCopyWithImpl<$Res, _$TimetableEntryModelImpl>
    implements _$$TimetableEntryModelImplCopyWith<$Res> {
  __$$TimetableEntryModelImplCopyWithImpl(_$TimetableEntryModelImpl _value,
      $Res Function(_$TimetableEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimetableEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? enrollmentId = null,
    Object? dayOfWeek = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? room = freezed,
    Object? createdAt = null,
    Object? enrollment = null,
  }) {
    return _then(_$TimetableEntryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      enrollment: null == enrollment
          ? _value.enrollment
          : enrollment // ignore: cast_nullable_to_non_nullable
              as EnrollmentInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimetableEntryModelImpl implements _TimetableEntryModel {
  const _$TimetableEntryModelImpl(
      {required this.id,
      @JsonKey(name: 'subjectEnrollmentId') required this.enrollmentId,
      required this.dayOfWeek,
      required this.startTime,
      required this.endTime,
      @JsonKey(name: 'classRoom') this.room,
      required this.createdAt,
      @JsonKey(name: 'subjectEnrollment') required this.enrollment});

  factory _$TimetableEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableEntryModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'subjectEnrollmentId')
  final String enrollmentId;
// ✅ Backend sends subjectEnrollmentId
  @override
  final String dayOfWeek;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  @JsonKey(name: 'classRoom')
  final String? room;
// ✅ Backend sends classRoom
  @override
  final DateTime createdAt;
  @override
  @JsonKey(name: 'subjectEnrollment')
  final EnrollmentInfo enrollment;

  @override
  String toString() {
    return 'TimetableEntryModel(id: $id, enrollmentId: $enrollmentId, dayOfWeek: $dayOfWeek, startTime: $startTime, endTime: $endTime, room: $room, createdAt: $createdAt, enrollment: $enrollment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimetableEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enrollmentId, enrollmentId) ||
                other.enrollmentId == enrollmentId) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.enrollment, enrollment) ||
                other.enrollment == enrollment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, enrollmentId, dayOfWeek,
      startTime, endTime, room, createdAt, enrollment);

  /// Create a copy of TimetableEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimetableEntryModelImplCopyWith<_$TimetableEntryModelImpl> get copyWith =>
      __$$TimetableEntryModelImplCopyWithImpl<_$TimetableEntryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimetableEntryModelImplToJson(
      this,
    );
  }
}

abstract class _TimetableEntryModel implements TimetableEntryModel {
  const factory _TimetableEntryModel(
      {required final String id,
      @JsonKey(name: 'subjectEnrollmentId') required final String enrollmentId,
      required final String dayOfWeek,
      required final String startTime,
      required final String endTime,
      @JsonKey(name: 'classRoom') final String? room,
      required final DateTime createdAt,
      @JsonKey(name: 'subjectEnrollment')
      required final EnrollmentInfo enrollment}) = _$TimetableEntryModelImpl;

  factory _TimetableEntryModel.fromJson(Map<String, dynamic> json) =
      _$TimetableEntryModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'subjectEnrollmentId')
  String get enrollmentId; // ✅ Backend sends subjectEnrollmentId
  @override
  String get dayOfWeek;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  @JsonKey(name: 'classRoom')
  String? get room; // ✅ Backend sends classRoom
  @override
  DateTime get createdAt;
  @override
  @JsonKey(name: 'subjectEnrollment')
  EnrollmentInfo get enrollment;

  /// Create a copy of TimetableEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimetableEntryModelImplCopyWith<_$TimetableEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnrollmentInfo _$EnrollmentInfoFromJson(Map<String, dynamic> json) {
  return _EnrollmentInfo.fromJson(json);
}

/// @nodoc
mixin _$EnrollmentInfo {
  SubjectInfo get subject => throw _privateConstructorUsedError;
  BatchInfo get batch => throw _privateConstructorUsedError;
  TeacherInfo get teacher => throw _privateConstructorUsedError;

  /// Serializes this EnrollmentInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrollmentInfoCopyWith<EnrollmentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollmentInfoCopyWith<$Res> {
  factory $EnrollmentInfoCopyWith(
          EnrollmentInfo value, $Res Function(EnrollmentInfo) then) =
      _$EnrollmentInfoCopyWithImpl<$Res, EnrollmentInfo>;
  @useResult
  $Res call({SubjectInfo subject, BatchInfo batch, TeacherInfo teacher});

  $SubjectInfoCopyWith<$Res> get subject;
  $BatchInfoCopyWith<$Res> get batch;
  $TeacherInfoCopyWith<$Res> get teacher;
}

/// @nodoc
class _$EnrollmentInfoCopyWithImpl<$Res, $Val extends EnrollmentInfo>
    implements $EnrollmentInfoCopyWith<$Res> {
  _$EnrollmentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? batch = null,
    Object? teacher = null,
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
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as TeacherInfo,
    ) as $Val);
  }

  /// Create a copy of EnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectInfoCopyWith<$Res> get subject {
    return $SubjectInfoCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  /// Create a copy of EnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BatchInfoCopyWith<$Res> get batch {
    return $BatchInfoCopyWith<$Res>(_value.batch, (value) {
      return _then(_value.copyWith(batch: value) as $Val);
    });
  }

  /// Create a copy of EnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherInfoCopyWith<$Res> get teacher {
    return $TeacherInfoCopyWith<$Res>(_value.teacher, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EnrollmentInfoImplCopyWith<$Res>
    implements $EnrollmentInfoCopyWith<$Res> {
  factory _$$EnrollmentInfoImplCopyWith(_$EnrollmentInfoImpl value,
          $Res Function(_$EnrollmentInfoImpl) then) =
      __$$EnrollmentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SubjectInfo subject, BatchInfo batch, TeacherInfo teacher});

  @override
  $SubjectInfoCopyWith<$Res> get subject;
  @override
  $BatchInfoCopyWith<$Res> get batch;
  @override
  $TeacherInfoCopyWith<$Res> get teacher;
}

/// @nodoc
class __$$EnrollmentInfoImplCopyWithImpl<$Res>
    extends _$EnrollmentInfoCopyWithImpl<$Res, _$EnrollmentInfoImpl>
    implements _$$EnrollmentInfoImplCopyWith<$Res> {
  __$$EnrollmentInfoImplCopyWithImpl(
      _$EnrollmentInfoImpl _value, $Res Function(_$EnrollmentInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? batch = null,
    Object? teacher = null,
  }) {
    return _then(_$EnrollmentInfoImpl(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectInfo,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as BatchInfo,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as TeacherInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnrollmentInfoImpl implements _EnrollmentInfo {
  const _$EnrollmentInfoImpl(
      {required this.subject, required this.batch, required this.teacher});

  factory _$EnrollmentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollmentInfoImplFromJson(json);

  @override
  final SubjectInfo subject;
  @override
  final BatchInfo batch;
  @override
  final TeacherInfo teacher;

  @override
  String toString() {
    return 'EnrollmentInfo(subject: $subject, batch: $batch, teacher: $teacher)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentInfoImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.teacher, teacher) || other.teacher == teacher));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subject, batch, teacher);

  /// Create a copy of EnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentInfoImplCopyWith<_$EnrollmentInfoImpl> get copyWith =>
      __$$EnrollmentInfoImplCopyWithImpl<_$EnrollmentInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrollmentInfoImplToJson(
      this,
    );
  }
}

abstract class _EnrollmentInfo implements EnrollmentInfo {
  const factory _EnrollmentInfo(
      {required final SubjectInfo subject,
      required final BatchInfo batch,
      required final TeacherInfo teacher}) = _$EnrollmentInfoImpl;

  factory _EnrollmentInfo.fromJson(Map<String, dynamic> json) =
      _$EnrollmentInfoImpl.fromJson;

  @override
  SubjectInfo get subject;
  @override
  BatchInfo get batch;
  @override
  TeacherInfo get teacher;

  /// Create a copy of EnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollmentInfoImplCopyWith<_$EnrollmentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubjectInfo _$SubjectInfoFromJson(Map<String, dynamic> json) {
  return _SubjectInfo.fromJson(json);
}

/// @nodoc
mixin _$SubjectInfo {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;

  /// Serializes this SubjectInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectInfoCopyWith<SubjectInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectInfoCopyWith<$Res> {
  factory $SubjectInfoCopyWith(
          SubjectInfo value, $Res Function(SubjectInfo) then) =
      _$SubjectInfoCopyWithImpl<$Res, SubjectInfo>;
  @useResult
  $Res call({String code, String name, String semester});
}

/// @nodoc
class _$SubjectInfoCopyWithImpl<$Res, $Val extends SubjectInfo>
    implements $SubjectInfoCopyWith<$Res> {
  _$SubjectInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? semester = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectInfoImplCopyWith<$Res>
    implements $SubjectInfoCopyWith<$Res> {
  factory _$$SubjectInfoImplCopyWith(
          _$SubjectInfoImpl value, $Res Function(_$SubjectInfoImpl) then) =
      __$$SubjectInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String semester});
}

/// @nodoc
class __$$SubjectInfoImplCopyWithImpl<$Res>
    extends _$SubjectInfoCopyWithImpl<$Res, _$SubjectInfoImpl>
    implements _$$SubjectInfoImplCopyWith<$Res> {
  __$$SubjectInfoImplCopyWithImpl(
      _$SubjectInfoImpl _value, $Res Function(_$SubjectInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? semester = null,
  }) {
    return _then(_$SubjectInfoImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectInfoImpl implements _SubjectInfo {
  const _$SubjectInfoImpl(
      {required this.code, required this.name, required this.semester});

  factory _$SubjectInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectInfoImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String semester;

  @override
  String toString() {
    return 'SubjectInfo(code: $code, name: $name, semester: $semester)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectInfoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.semester, semester) ||
                other.semester == semester));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, semester);

  /// Create a copy of SubjectInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectInfoImplCopyWith<_$SubjectInfoImpl> get copyWith =>
      __$$SubjectInfoImplCopyWithImpl<_$SubjectInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectInfoImplToJson(
      this,
    );
  }
}

abstract class _SubjectInfo implements SubjectInfo {
  const factory _SubjectInfo(
      {required final String code,
      required final String name,
      required final String semester}) = _$SubjectInfoImpl;

  factory _SubjectInfo.fromJson(Map<String, dynamic> json) =
      _$SubjectInfoImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get semester;

  /// Create a copy of SubjectInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectInfoImplCopyWith<_$SubjectInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BatchInfo _$BatchInfoFromJson(Map<String, dynamic> json) {
  return _BatchInfo.fromJson(json);
}

/// @nodoc
mixin _$BatchInfo {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get academicYear => throw _privateConstructorUsedError;

  /// Serializes this BatchInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BatchInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatchInfoCopyWith<BatchInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchInfoCopyWith<$Res> {
  factory $BatchInfoCopyWith(BatchInfo value, $Res Function(BatchInfo) then) =
      _$BatchInfoCopyWithImpl<$Res, BatchInfo>;
  @useResult
  $Res call({String code, String name, String academicYear});
}

/// @nodoc
class _$BatchInfoCopyWithImpl<$Res, $Val extends BatchInfo>
    implements $BatchInfoCopyWith<$Res> {
  _$BatchInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BatchInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? academicYear = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      academicYear: null == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchInfoImplCopyWith<$Res>
    implements $BatchInfoCopyWith<$Res> {
  factory _$$BatchInfoImplCopyWith(
          _$BatchInfoImpl value, $Res Function(_$BatchInfoImpl) then) =
      __$$BatchInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String academicYear});
}

/// @nodoc
class __$$BatchInfoImplCopyWithImpl<$Res>
    extends _$BatchInfoCopyWithImpl<$Res, _$BatchInfoImpl>
    implements _$$BatchInfoImplCopyWith<$Res> {
  __$$BatchInfoImplCopyWithImpl(
      _$BatchInfoImpl _value, $Res Function(_$BatchInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BatchInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? academicYear = null,
  }) {
    return _then(_$BatchInfoImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      academicYear: null == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchInfoImpl implements _BatchInfo {
  const _$BatchInfoImpl(
      {required this.code, required this.name, required this.academicYear});

  factory _$BatchInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchInfoImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String academicYear;

  @override
  String toString() {
    return 'BatchInfo(code: $code, name: $name, academicYear: $academicYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchInfoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.academicYear, academicYear) ||
                other.academicYear == academicYear));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, academicYear);

  /// Create a copy of BatchInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchInfoImplCopyWith<_$BatchInfoImpl> get copyWith =>
      __$$BatchInfoImplCopyWithImpl<_$BatchInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchInfoImplToJson(
      this,
    );
  }
}

abstract class _BatchInfo implements BatchInfo {
  const factory _BatchInfo(
      {required final String code,
      required final String name,
      required final String academicYear}) = _$BatchInfoImpl;

  factory _BatchInfo.fromJson(Map<String, dynamic> json) =
      _$BatchInfoImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get academicYear;

  /// Create a copy of BatchInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchInfoImplCopyWith<_$BatchInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeacherInfo _$TeacherInfoFromJson(Map<String, dynamic> json) {
  return _TeacherInfo.fromJson(json);
}

/// @nodoc
mixin _$TeacherInfo {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;

  /// Serializes this TeacherInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherInfoCopyWith<TeacherInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherInfoCopyWith<$Res> {
  factory $TeacherInfoCopyWith(
          TeacherInfo value, $Res Function(TeacherInfo) then) =
      _$TeacherInfoCopyWithImpl<$Res, TeacherInfo>;
  @useResult
  $Res call({String firstName, String lastName});
}

/// @nodoc
class _$TeacherInfoCopyWithImpl<$Res, $Val extends TeacherInfo>
    implements $TeacherInfoCopyWith<$Res> {
  _$TeacherInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$TeacherInfoImplCopyWith<$Res>
    implements $TeacherInfoCopyWith<$Res> {
  factory _$$TeacherInfoImplCopyWith(
          _$TeacherInfoImpl value, $Res Function(_$TeacherInfoImpl) then) =
      __$$TeacherInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName});
}

/// @nodoc
class __$$TeacherInfoImplCopyWithImpl<$Res>
    extends _$TeacherInfoCopyWithImpl<$Res, _$TeacherInfoImpl>
    implements _$$TeacherInfoImplCopyWith<$Res> {
  __$$TeacherInfoImplCopyWithImpl(
      _$TeacherInfoImpl _value, $Res Function(_$TeacherInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$TeacherInfoImpl(
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
class _$TeacherInfoImpl extends _TeacherInfo {
  const _$TeacherInfoImpl({required this.firstName, required this.lastName})
      : super._();

  factory _$TeacherInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherInfoImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'TeacherInfo(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherInfoImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  /// Create a copy of TeacherInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherInfoImplCopyWith<_$TeacherInfoImpl> get copyWith =>
      __$$TeacherInfoImplCopyWithImpl<_$TeacherInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherInfoImplToJson(
      this,
    );
  }
}

abstract class _TeacherInfo extends TeacherInfo {
  const factory _TeacherInfo(
      {required final String firstName,
      required final String lastName}) = _$TeacherInfoImpl;
  const _TeacherInfo._() : super._();

  factory _TeacherInfo.fromJson(Map<String, dynamic> json) =
      _$TeacherInfoImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;

  /// Create a copy of TeacherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherInfoImplCopyWith<_$TeacherInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTimetableEntryRequest _$CreateTimetableEntryRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateTimetableEntryRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateTimetableEntryRequest {
  @JsonKey(name: 'subjectEnrollmentId')
  String get enrollmentId =>
      throw _privateConstructorUsedError; // ✅ Rename for backend
  String get dayOfWeek => throw _privateConstructorUsedError;
  String get startTime =>
      throw _privateConstructorUsedError; // Format as "HH:MM:SS"
  String get endTime =>
      throw _privateConstructorUsedError; // Format as "HH:MM:SS"
  @JsonKey(name: 'classRoom')
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
      {@JsonKey(name: 'subjectEnrollmentId') String enrollmentId,
      String dayOfWeek,
      String startTime,
      String endTime,
      @JsonKey(name: 'classRoom') String? room});
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
      {@JsonKey(name: 'subjectEnrollmentId') String enrollmentId,
      String dayOfWeek,
      String startTime,
      String endTime,
      @JsonKey(name: 'classRoom') String? room});
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
      {@JsonKey(name: 'subjectEnrollmentId') required this.enrollmentId,
      required this.dayOfWeek,
      required this.startTime,
      required this.endTime,
      @JsonKey(name: 'classRoom') this.room});

  factory _$CreateTimetableEntryRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateTimetableEntryRequestImplFromJson(json);

  @override
  @JsonKey(name: 'subjectEnrollmentId')
  final String enrollmentId;
// ✅ Rename for backend
  @override
  final String dayOfWeek;
  @override
  final String startTime;
// Format as "HH:MM:SS"
  @override
  final String endTime;
// Format as "HH:MM:SS"
  @override
  @JsonKey(name: 'classRoom')
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
      {@JsonKey(name: 'subjectEnrollmentId') required final String enrollmentId,
      required final String dayOfWeek,
      required final String startTime,
      required final String endTime,
      @JsonKey(name: 'classRoom')
      final String? room}) = _$CreateTimetableEntryRequestImpl;

  factory _CreateTimetableEntryRequest.fromJson(Map<String, dynamic> json) =
      _$CreateTimetableEntryRequestImpl.fromJson;

  @override
  @JsonKey(name: 'subjectEnrollmentId')
  String get enrollmentId; // ✅ Rename for backend
  @override
  String get dayOfWeek;
  @override
  String get startTime; // Format as "HH:MM:SS"
  @override
  String get endTime; // Format as "HH:MM:SS"
  @override
  @JsonKey(name: 'classRoom')
  String? get room;

  /// Create a copy of CreateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTimetableEntryRequestImplCopyWith<_$CreateTimetableEntryRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateTimetableEntryRequest _$UpdateTimetableEntryRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateTimetableEntryRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateTimetableEntryRequest {
  String? get dayOfWeek => throw _privateConstructorUsedError;
  String? get startTime =>
      throw _privateConstructorUsedError; // Format as "HH:MM:SS"
  String? get endTime =>
      throw _privateConstructorUsedError; // Format as "HH:MM:SS"
  @JsonKey(name: 'classRoom')
  String? get room => throw _privateConstructorUsedError;

  /// Serializes this UpdateTimetableEntryRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateTimetableEntryRequestCopyWith<UpdateTimetableEntryRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTimetableEntryRequestCopyWith<$Res> {
  factory $UpdateTimetableEntryRequestCopyWith(
          UpdateTimetableEntryRequest value,
          $Res Function(UpdateTimetableEntryRequest) then) =
      _$UpdateTimetableEntryRequestCopyWithImpl<$Res,
          UpdateTimetableEntryRequest>;
  @useResult
  $Res call(
      {String? dayOfWeek,
      String? startTime,
      String? endTime,
      @JsonKey(name: 'classRoom') String? room});
}

/// @nodoc
class _$UpdateTimetableEntryRequestCopyWithImpl<$Res,
        $Val extends UpdateTimetableEntryRequest>
    implements $UpdateTimetableEntryRequestCopyWith<$Res> {
  _$UpdateTimetableEntryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? room = freezed,
  }) {
    return _then(_value.copyWith(
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTimetableEntryRequestImplCopyWith<$Res>
    implements $UpdateTimetableEntryRequestCopyWith<$Res> {
  factory _$$UpdateTimetableEntryRequestImplCopyWith(
          _$UpdateTimetableEntryRequestImpl value,
          $Res Function(_$UpdateTimetableEntryRequestImpl) then) =
      __$$UpdateTimetableEntryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? dayOfWeek,
      String? startTime,
      String? endTime,
      @JsonKey(name: 'classRoom') String? room});
}

/// @nodoc
class __$$UpdateTimetableEntryRequestImplCopyWithImpl<$Res>
    extends _$UpdateTimetableEntryRequestCopyWithImpl<$Res,
        _$UpdateTimetableEntryRequestImpl>
    implements _$$UpdateTimetableEntryRequestImplCopyWith<$Res> {
  __$$UpdateTimetableEntryRequestImplCopyWithImpl(
      _$UpdateTimetableEntryRequestImpl _value,
      $Res Function(_$UpdateTimetableEntryRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? room = freezed,
  }) {
    return _then(_$UpdateTimetableEntryRequestImpl(
      dayOfWeek: freezed == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateTimetableEntryRequestImpl
    implements _UpdateTimetableEntryRequest {
  const _$UpdateTimetableEntryRequestImpl(
      {this.dayOfWeek,
      this.startTime,
      this.endTime,
      @JsonKey(name: 'classRoom') this.room});

  factory _$UpdateTimetableEntryRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateTimetableEntryRequestImplFromJson(json);

  @override
  final String? dayOfWeek;
  @override
  final String? startTime;
// Format as "HH:MM:SS"
  @override
  final String? endTime;
// Format as "HH:MM:SS"
  @override
  @JsonKey(name: 'classRoom')
  final String? room;

  @override
  String toString() {
    return 'UpdateTimetableEntryRequest(dayOfWeek: $dayOfWeek, startTime: $startTime, endTime: $endTime, room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTimetableEntryRequestImpl &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.room, room) || other.room == room));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dayOfWeek, startTime, endTime, room);

  /// Create a copy of UpdateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTimetableEntryRequestImplCopyWith<_$UpdateTimetableEntryRequestImpl>
      get copyWith => __$$UpdateTimetableEntryRequestImplCopyWithImpl<
          _$UpdateTimetableEntryRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTimetableEntryRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateTimetableEntryRequest
    implements UpdateTimetableEntryRequest {
  const factory _UpdateTimetableEntryRequest(
          {final String? dayOfWeek,
          final String? startTime,
          final String? endTime,
          @JsonKey(name: 'classRoom') final String? room}) =
      _$UpdateTimetableEntryRequestImpl;

  factory _UpdateTimetableEntryRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateTimetableEntryRequestImpl.fromJson;

  @override
  String? get dayOfWeek;
  @override
  String? get startTime; // Format as "HH:MM:SS"
  @override
  String? get endTime; // Format as "HH:MM:SS"
  @override
  @JsonKey(name: 'classRoom')
  String? get room;

  /// Create a copy of UpdateTimetableEntryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTimetableEntryRequestImplCopyWith<_$UpdateTimetableEntryRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
