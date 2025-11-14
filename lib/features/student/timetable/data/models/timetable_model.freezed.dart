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

TimetableModel _$TimetableModelFromJson(Map<String, dynamic> json) {
  return _TimetableModel.fromJson(json);
}

/// @nodoc
mixin _$TimetableModel {
  List<TimetableEntry> get timetable => throw _privateConstructorUsedError;

  /// Serializes this TimetableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimetableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimetableModelCopyWith<TimetableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableModelCopyWith<$Res> {
  factory $TimetableModelCopyWith(
          TimetableModel value, $Res Function(TimetableModel) then) =
      _$TimetableModelCopyWithImpl<$Res, TimetableModel>;
  @useResult
  $Res call({List<TimetableEntry> timetable});
}

/// @nodoc
class _$TimetableModelCopyWithImpl<$Res, $Val extends TimetableModel>
    implements $TimetableModelCopyWith<$Res> {
  _$TimetableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimetableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timetable = null,
  }) {
    return _then(_value.copyWith(
      timetable: null == timetable
          ? _value.timetable
          : timetable // ignore: cast_nullable_to_non_nullable
              as List<TimetableEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimetableModelImplCopyWith<$Res>
    implements $TimetableModelCopyWith<$Res> {
  factory _$$TimetableModelImplCopyWith(_$TimetableModelImpl value,
          $Res Function(_$TimetableModelImpl) then) =
      __$$TimetableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TimetableEntry> timetable});
}

/// @nodoc
class __$$TimetableModelImplCopyWithImpl<$Res>
    extends _$TimetableModelCopyWithImpl<$Res, _$TimetableModelImpl>
    implements _$$TimetableModelImplCopyWith<$Res> {
  __$$TimetableModelImplCopyWithImpl(
      _$TimetableModelImpl _value, $Res Function(_$TimetableModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimetableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timetable = null,
  }) {
    return _then(_$TimetableModelImpl(
      timetable: null == timetable
          ? _value._timetable
          : timetable // ignore: cast_nullable_to_non_nullable
              as List<TimetableEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimetableModelImpl implements _TimetableModel {
  const _$TimetableModelImpl({required final List<TimetableEntry> timetable})
      : _timetable = timetable;

  factory _$TimetableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableModelImplFromJson(json);

  final List<TimetableEntry> _timetable;
  @override
  List<TimetableEntry> get timetable {
    if (_timetable is EqualUnmodifiableListView) return _timetable;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timetable);
  }

  @override
  String toString() {
    return 'TimetableModel(timetable: $timetable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimetableModelImpl &&
            const DeepCollectionEquality()
                .equals(other._timetable, _timetable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_timetable));

  /// Create a copy of TimetableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimetableModelImplCopyWith<_$TimetableModelImpl> get copyWith =>
      __$$TimetableModelImplCopyWithImpl<_$TimetableModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimetableModelImplToJson(
      this,
    );
  }
}

abstract class _TimetableModel implements TimetableModel {
  const factory _TimetableModel(
      {required final List<TimetableEntry> timetable}) = _$TimetableModelImpl;

  factory _TimetableModel.fromJson(Map<String, dynamic> json) =
      _$TimetableModelImpl.fromJson;

  @override
  List<TimetableEntry> get timetable;

  /// Create a copy of TimetableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimetableModelImplCopyWith<_$TimetableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimetableEntry _$TimetableEntryFromJson(Map<String, dynamic> json) {
  return _TimetableEntry.fromJson(json);
}

/// @nodoc
mixin _$TimetableEntry {
  String get id => throw _privateConstructorUsedError;
  String get dayOfWeek => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String? get room => throw _privateConstructorUsedError;
  SubjectEnrollmentDetail get subjectEnrollment =>
      throw _privateConstructorUsedError;

  /// Serializes this TimetableEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimetableEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimetableEntryCopyWith<TimetableEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableEntryCopyWith<$Res> {
  factory $TimetableEntryCopyWith(
          TimetableEntry value, $Res Function(TimetableEntry) then) =
      _$TimetableEntryCopyWithImpl<$Res, TimetableEntry>;
  @useResult
  $Res call(
      {String id,
      String dayOfWeek,
      String startTime,
      String endTime,
      String? room,
      SubjectEnrollmentDetail subjectEnrollment});

  $SubjectEnrollmentDetailCopyWith<$Res> get subjectEnrollment;
}

/// @nodoc
class _$TimetableEntryCopyWithImpl<$Res, $Val extends TimetableEntry>
    implements $TimetableEntryCopyWith<$Res> {
  _$TimetableEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimetableEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dayOfWeek = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? room = freezed,
    Object? subjectEnrollment = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      subjectEnrollment: null == subjectEnrollment
          ? _value.subjectEnrollment
          : subjectEnrollment // ignore: cast_nullable_to_non_nullable
              as SubjectEnrollmentDetail,
    ) as $Val);
  }

  /// Create a copy of TimetableEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectEnrollmentDetailCopyWith<$Res> get subjectEnrollment {
    return $SubjectEnrollmentDetailCopyWith<$Res>(_value.subjectEnrollment,
        (value) {
      return _then(_value.copyWith(subjectEnrollment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimetableEntryImplCopyWith<$Res>
    implements $TimetableEntryCopyWith<$Res> {
  factory _$$TimetableEntryImplCopyWith(_$TimetableEntryImpl value,
          $Res Function(_$TimetableEntryImpl) then) =
      __$$TimetableEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String dayOfWeek,
      String startTime,
      String endTime,
      String? room,
      SubjectEnrollmentDetail subjectEnrollment});

  @override
  $SubjectEnrollmentDetailCopyWith<$Res> get subjectEnrollment;
}

/// @nodoc
class __$$TimetableEntryImplCopyWithImpl<$Res>
    extends _$TimetableEntryCopyWithImpl<$Res, _$TimetableEntryImpl>
    implements _$$TimetableEntryImplCopyWith<$Res> {
  __$$TimetableEntryImplCopyWithImpl(
      _$TimetableEntryImpl _value, $Res Function(_$TimetableEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimetableEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dayOfWeek = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? room = freezed,
    Object? subjectEnrollment = null,
  }) {
    return _then(_$TimetableEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      subjectEnrollment: null == subjectEnrollment
          ? _value.subjectEnrollment
          : subjectEnrollment // ignore: cast_nullable_to_non_nullable
              as SubjectEnrollmentDetail,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimetableEntryImpl implements _TimetableEntry {
  const _$TimetableEntryImpl(
      {required this.id,
      required this.dayOfWeek,
      required this.startTime,
      required this.endTime,
      this.room,
      required this.subjectEnrollment});

  factory _$TimetableEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String dayOfWeek;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String? room;
  @override
  final SubjectEnrollmentDetail subjectEnrollment;

  @override
  String toString() {
    return 'TimetableEntry(id: $id, dayOfWeek: $dayOfWeek, startTime: $startTime, endTime: $endTime, room: $room, subjectEnrollment: $subjectEnrollment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimetableEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.subjectEnrollment, subjectEnrollment) ||
                other.subjectEnrollment == subjectEnrollment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, dayOfWeek, startTime, endTime, room, subjectEnrollment);

  /// Create a copy of TimetableEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimetableEntryImplCopyWith<_$TimetableEntryImpl> get copyWith =>
      __$$TimetableEntryImplCopyWithImpl<_$TimetableEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimetableEntryImplToJson(
      this,
    );
  }
}

abstract class _TimetableEntry implements TimetableEntry {
  const factory _TimetableEntry(
          {required final String id,
          required final String dayOfWeek,
          required final String startTime,
          required final String endTime,
          final String? room,
          required final SubjectEnrollmentDetail subjectEnrollment}) =
      _$TimetableEntryImpl;

  factory _TimetableEntry.fromJson(Map<String, dynamic> json) =
      _$TimetableEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get dayOfWeek;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String? get room;
  @override
  SubjectEnrollmentDetail get subjectEnrollment;

  /// Create a copy of TimetableEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimetableEntryImplCopyWith<_$TimetableEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubjectEnrollmentDetail _$SubjectEnrollmentDetailFromJson(
    Map<String, dynamic> json) {
  return _SubjectEnrollmentDetail.fromJson(json);
}

/// @nodoc
mixin _$SubjectEnrollmentDetail {
  SubjectDetail get subject => throw _privateConstructorUsedError;
  TeacherDetail get teacher => throw _privateConstructorUsedError;

  /// Serializes this SubjectEnrollmentDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectEnrollmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectEnrollmentDetailCopyWith<SubjectEnrollmentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectEnrollmentDetailCopyWith<$Res> {
  factory $SubjectEnrollmentDetailCopyWith(SubjectEnrollmentDetail value,
          $Res Function(SubjectEnrollmentDetail) then) =
      _$SubjectEnrollmentDetailCopyWithImpl<$Res, SubjectEnrollmentDetail>;
  @useResult
  $Res call({SubjectDetail subject, TeacherDetail teacher});

  $SubjectDetailCopyWith<$Res> get subject;
  $TeacherDetailCopyWith<$Res> get teacher;
}

/// @nodoc
class _$SubjectEnrollmentDetailCopyWithImpl<$Res,
        $Val extends SubjectEnrollmentDetail>
    implements $SubjectEnrollmentDetailCopyWith<$Res> {
  _$SubjectEnrollmentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectEnrollmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? teacher = null,
  }) {
    return _then(_value.copyWith(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectDetail,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as TeacherDetail,
    ) as $Val);
  }

  /// Create a copy of SubjectEnrollmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectDetailCopyWith<$Res> get subject {
    return $SubjectDetailCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  /// Create a copy of SubjectEnrollmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherDetailCopyWith<$Res> get teacher {
    return $TeacherDetailCopyWith<$Res>(_value.teacher, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubjectEnrollmentDetailImplCopyWith<$Res>
    implements $SubjectEnrollmentDetailCopyWith<$Res> {
  factory _$$SubjectEnrollmentDetailImplCopyWith(
          _$SubjectEnrollmentDetailImpl value,
          $Res Function(_$SubjectEnrollmentDetailImpl) then) =
      __$$SubjectEnrollmentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SubjectDetail subject, TeacherDetail teacher});

  @override
  $SubjectDetailCopyWith<$Res> get subject;
  @override
  $TeacherDetailCopyWith<$Res> get teacher;
}

/// @nodoc
class __$$SubjectEnrollmentDetailImplCopyWithImpl<$Res>
    extends _$SubjectEnrollmentDetailCopyWithImpl<$Res,
        _$SubjectEnrollmentDetailImpl>
    implements _$$SubjectEnrollmentDetailImplCopyWith<$Res> {
  __$$SubjectEnrollmentDetailImplCopyWithImpl(
      _$SubjectEnrollmentDetailImpl _value,
      $Res Function(_$SubjectEnrollmentDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectEnrollmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? teacher = null,
  }) {
    return _then(_$SubjectEnrollmentDetailImpl(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectDetail,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as TeacherDetail,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectEnrollmentDetailImpl implements _SubjectEnrollmentDetail {
  const _$SubjectEnrollmentDetailImpl(
      {required this.subject, required this.teacher});

  factory _$SubjectEnrollmentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectEnrollmentDetailImplFromJson(json);

  @override
  final SubjectDetail subject;
  @override
  final TeacherDetail teacher;

  @override
  String toString() {
    return 'SubjectEnrollmentDetail(subject: $subject, teacher: $teacher)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectEnrollmentDetailImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.teacher, teacher) || other.teacher == teacher));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subject, teacher);

  /// Create a copy of SubjectEnrollmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectEnrollmentDetailImplCopyWith<_$SubjectEnrollmentDetailImpl>
      get copyWith => __$$SubjectEnrollmentDetailImplCopyWithImpl<
          _$SubjectEnrollmentDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectEnrollmentDetailImplToJson(
      this,
    );
  }
}

abstract class _SubjectEnrollmentDetail implements SubjectEnrollmentDetail {
  const factory _SubjectEnrollmentDetail(
      {required final SubjectDetail subject,
      required final TeacherDetail teacher}) = _$SubjectEnrollmentDetailImpl;

  factory _SubjectEnrollmentDetail.fromJson(Map<String, dynamic> json) =
      _$SubjectEnrollmentDetailImpl.fromJson;

  @override
  SubjectDetail get subject;
  @override
  TeacherDetail get teacher;

  /// Create a copy of SubjectEnrollmentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectEnrollmentDetailImplCopyWith<_$SubjectEnrollmentDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SubjectDetail _$SubjectDetailFromJson(Map<String, dynamic> json) {
  return _SubjectDetail.fromJson(json);
}

/// @nodoc
mixin _$SubjectDetail {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;

  /// Serializes this SubjectDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectDetailCopyWith<SubjectDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectDetailCopyWith<$Res> {
  factory $SubjectDetailCopyWith(
          SubjectDetail value, $Res Function(SubjectDetail) then) =
      _$SubjectDetailCopyWithImpl<$Res, SubjectDetail>;
  @useResult
  $Res call({String code, String name, String semester});
}

/// @nodoc
class _$SubjectDetailCopyWithImpl<$Res, $Val extends SubjectDetail>
    implements $SubjectDetailCopyWith<$Res> {
  _$SubjectDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectDetail
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
abstract class _$$SubjectDetailImplCopyWith<$Res>
    implements $SubjectDetailCopyWith<$Res> {
  factory _$$SubjectDetailImplCopyWith(
          _$SubjectDetailImpl value, $Res Function(_$SubjectDetailImpl) then) =
      __$$SubjectDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String semester});
}

/// @nodoc
class __$$SubjectDetailImplCopyWithImpl<$Res>
    extends _$SubjectDetailCopyWithImpl<$Res, _$SubjectDetailImpl>
    implements _$$SubjectDetailImplCopyWith<$Res> {
  __$$SubjectDetailImplCopyWithImpl(
      _$SubjectDetailImpl _value, $Res Function(_$SubjectDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? semester = null,
  }) {
    return _then(_$SubjectDetailImpl(
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
class _$SubjectDetailImpl implements _SubjectDetail {
  const _$SubjectDetailImpl(
      {required this.code, required this.name, required this.semester});

  factory _$SubjectDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectDetailImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String semester;

  @override
  String toString() {
    return 'SubjectDetail(code: $code, name: $name, semester: $semester)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectDetailImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.semester, semester) ||
                other.semester == semester));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, semester);

  /// Create a copy of SubjectDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectDetailImplCopyWith<_$SubjectDetailImpl> get copyWith =>
      __$$SubjectDetailImplCopyWithImpl<_$SubjectDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectDetailImplToJson(
      this,
    );
  }
}

abstract class _SubjectDetail implements SubjectDetail {
  const factory _SubjectDetail(
      {required final String code,
      required final String name,
      required final String semester}) = _$SubjectDetailImpl;

  factory _SubjectDetail.fromJson(Map<String, dynamic> json) =
      _$SubjectDetailImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get semester;

  /// Create a copy of SubjectDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectDetailImplCopyWith<_$SubjectDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeacherDetail _$TeacherDetailFromJson(Map<String, dynamic> json) {
  return _TeacherDetail.fromJson(json);
}

/// @nodoc
mixin _$TeacherDetail {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;

  /// Serializes this TeacherDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherDetailCopyWith<TeacherDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherDetailCopyWith<$Res> {
  factory $TeacherDetailCopyWith(
          TeacherDetail value, $Res Function(TeacherDetail) then) =
      _$TeacherDetailCopyWithImpl<$Res, TeacherDetail>;
  @useResult
  $Res call({String firstName, String lastName, String? department});
}

/// @nodoc
class _$TeacherDetailCopyWithImpl<$Res, $Val extends TeacherDetail>
    implements $TeacherDetailCopyWith<$Res> {
  _$TeacherDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? department = freezed,
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
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherDetailImplCopyWith<$Res>
    implements $TeacherDetailCopyWith<$Res> {
  factory _$$TeacherDetailImplCopyWith(
          _$TeacherDetailImpl value, $Res Function(_$TeacherDetailImpl) then) =
      __$$TeacherDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName, String? department});
}

/// @nodoc
class __$$TeacherDetailImplCopyWithImpl<$Res>
    extends _$TeacherDetailCopyWithImpl<$Res, _$TeacherDetailImpl>
    implements _$$TeacherDetailImplCopyWith<$Res> {
  __$$TeacherDetailImplCopyWithImpl(
      _$TeacherDetailImpl _value, $Res Function(_$TeacherDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? department = freezed,
  }) {
    return _then(_$TeacherDetailImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherDetailImpl extends _TeacherDetail {
  const _$TeacherDetailImpl(
      {required this.firstName, required this.lastName, this.department})
      : super._();

  factory _$TeacherDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherDetailImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? department;

  @override
  String toString() {
    return 'TeacherDetail(firstName: $firstName, lastName: $lastName, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherDetailImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, department);

  /// Create a copy of TeacherDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherDetailImplCopyWith<_$TeacherDetailImpl> get copyWith =>
      __$$TeacherDetailImplCopyWithImpl<_$TeacherDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherDetailImplToJson(
      this,
    );
  }
}

abstract class _TeacherDetail extends TeacherDetail {
  const factory _TeacherDetail(
      {required final String firstName,
      required final String lastName,
      final String? department}) = _$TeacherDetailImpl;
  const _TeacherDetail._() : super._();

  factory _TeacherDetail.fromJson(Map<String, dynamic> json) =
      _$TeacherDetailImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get department;

  /// Create a copy of TeacherDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherDetailImplCopyWith<_$TeacherDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
