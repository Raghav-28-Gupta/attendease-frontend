// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherDashboardModel _$TeacherDashboardModelFromJson(
    Map<String, dynamic> json) {
  return _TeacherDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$TeacherDashboardModel {
  List<EnrollmentInfo> get enrollments => throw _privateConstructorUsedError;
  DashboardStats get stats => throw _privateConstructorUsedError;
  List<RecentSession> get recentSessions => throw _privateConstructorUsedError;
  List<LowAttendanceStudent> get lowAttendanceStudents =>
      throw _privateConstructorUsedError;

  /// Serializes this TeacherDashboardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherDashboardModelCopyWith<TeacherDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherDashboardModelCopyWith<$Res> {
  factory $TeacherDashboardModelCopyWith(TeacherDashboardModel value,
          $Res Function(TeacherDashboardModel) then) =
      _$TeacherDashboardModelCopyWithImpl<$Res, TeacherDashboardModel>;
  @useResult
  $Res call(
      {List<EnrollmentInfo> enrollments,
      DashboardStats stats,
      List<RecentSession> recentSessions,
      List<LowAttendanceStudent> lowAttendanceStudents});

  $DashboardStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$TeacherDashboardModelCopyWithImpl<$Res,
        $Val extends TeacherDashboardModel>
    implements $TeacherDashboardModelCopyWith<$Res> {
  _$TeacherDashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrollments = null,
    Object? stats = null,
    Object? recentSessions = null,
    Object? lowAttendanceStudents = null,
  }) {
    return _then(_value.copyWith(
      enrollments: null == enrollments
          ? _value.enrollments
          : enrollments // ignore: cast_nullable_to_non_nullable
              as List<EnrollmentInfo>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DashboardStats,
      recentSessions: null == recentSessions
          ? _value.recentSessions
          : recentSessions // ignore: cast_nullable_to_non_nullable
              as List<RecentSession>,
      lowAttendanceStudents: null == lowAttendanceStudents
          ? _value.lowAttendanceStudents
          : lowAttendanceStudents // ignore: cast_nullable_to_non_nullable
              as List<LowAttendanceStudent>,
    ) as $Val);
  }

  /// Create a copy of TeacherDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardStatsCopyWith<$Res> get stats {
    return $DashboardStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeacherDashboardModelImplCopyWith<$Res>
    implements $TeacherDashboardModelCopyWith<$Res> {
  factory _$$TeacherDashboardModelImplCopyWith(
          _$TeacherDashboardModelImpl value,
          $Res Function(_$TeacherDashboardModelImpl) then) =
      __$$TeacherDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EnrollmentInfo> enrollments,
      DashboardStats stats,
      List<RecentSession> recentSessions,
      List<LowAttendanceStudent> lowAttendanceStudents});

  @override
  $DashboardStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$TeacherDashboardModelImplCopyWithImpl<$Res>
    extends _$TeacherDashboardModelCopyWithImpl<$Res,
        _$TeacherDashboardModelImpl>
    implements _$$TeacherDashboardModelImplCopyWith<$Res> {
  __$$TeacherDashboardModelImplCopyWithImpl(_$TeacherDashboardModelImpl _value,
      $Res Function(_$TeacherDashboardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enrollments = null,
    Object? stats = null,
    Object? recentSessions = null,
    Object? lowAttendanceStudents = null,
  }) {
    return _then(_$TeacherDashboardModelImpl(
      enrollments: null == enrollments
          ? _value._enrollments
          : enrollments // ignore: cast_nullable_to_non_nullable
              as List<EnrollmentInfo>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DashboardStats,
      recentSessions: null == recentSessions
          ? _value._recentSessions
          : recentSessions // ignore: cast_nullable_to_non_nullable
              as List<RecentSession>,
      lowAttendanceStudents: null == lowAttendanceStudents
          ? _value._lowAttendanceStudents
          : lowAttendanceStudents // ignore: cast_nullable_to_non_nullable
              as List<LowAttendanceStudent>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherDashboardModelImpl implements _TeacherDashboardModel {
  const _$TeacherDashboardModelImpl(
      {required final List<EnrollmentInfo> enrollments,
      required this.stats,
      required final List<RecentSession> recentSessions,
      required final List<LowAttendanceStudent> lowAttendanceStudents})
      : _enrollments = enrollments,
        _recentSessions = recentSessions,
        _lowAttendanceStudents = lowAttendanceStudents;

  factory _$TeacherDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherDashboardModelImplFromJson(json);

  final List<EnrollmentInfo> _enrollments;
  @override
  List<EnrollmentInfo> get enrollments {
    if (_enrollments is EqualUnmodifiableListView) return _enrollments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enrollments);
  }

  @override
  final DashboardStats stats;
  final List<RecentSession> _recentSessions;
  @override
  List<RecentSession> get recentSessions {
    if (_recentSessions is EqualUnmodifiableListView) return _recentSessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentSessions);
  }

  final List<LowAttendanceStudent> _lowAttendanceStudents;
  @override
  List<LowAttendanceStudent> get lowAttendanceStudents {
    if (_lowAttendanceStudents is EqualUnmodifiableListView)
      return _lowAttendanceStudents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lowAttendanceStudents);
  }

  @override
  String toString() {
    return 'TeacherDashboardModel(enrollments: $enrollments, stats: $stats, recentSessions: $recentSessions, lowAttendanceStudents: $lowAttendanceStudents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherDashboardModelImpl &&
            const DeepCollectionEquality()
                .equals(other._enrollments, _enrollments) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality()
                .equals(other._recentSessions, _recentSessions) &&
            const DeepCollectionEquality()
                .equals(other._lowAttendanceStudents, _lowAttendanceStudents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_enrollments),
      stats,
      const DeepCollectionEquality().hash(_recentSessions),
      const DeepCollectionEquality().hash(_lowAttendanceStudents));

  /// Create a copy of TeacherDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherDashboardModelImplCopyWith<_$TeacherDashboardModelImpl>
      get copyWith => __$$TeacherDashboardModelImplCopyWithImpl<
          _$TeacherDashboardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _TeacherDashboardModel implements TeacherDashboardModel {
  const factory _TeacherDashboardModel(
          {required final List<EnrollmentInfo> enrollments,
          required final DashboardStats stats,
          required final List<RecentSession> recentSessions,
          required final List<LowAttendanceStudent> lowAttendanceStudents}) =
      _$TeacherDashboardModelImpl;

  factory _TeacherDashboardModel.fromJson(Map<String, dynamic> json) =
      _$TeacherDashboardModelImpl.fromJson;

  @override
  List<EnrollmentInfo> get enrollments;
  @override
  DashboardStats get stats;
  @override
  List<RecentSession> get recentSessions;
  @override
  List<LowAttendanceStudent> get lowAttendanceStudents;

  /// Create a copy of TeacherDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherDashboardModelImplCopyWith<_$TeacherDashboardModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EnrollmentInfo _$EnrollmentInfoFromJson(Map<String, dynamic> json) {
  return _EnrollmentInfo.fromJson(json);
}

/// @nodoc
mixin _$EnrollmentInfo {
  String get id => throw _privateConstructorUsedError;
  SubjectInfo get subject => throw _privateConstructorUsedError;
  BatchInfo get batch => throw _privateConstructorUsedError;
  EnrollmentStats get stats => throw _privateConstructorUsedError;

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
  $Res call(
      {String id, SubjectInfo subject, BatchInfo batch, EnrollmentStats stats});

  $SubjectInfoCopyWith<$Res> get subject;
  $BatchInfoCopyWith<$Res> get batch;
  $EnrollmentStatsCopyWith<$Res> get stats;
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
    Object? id = null,
    Object? subject = null,
    Object? batch = null,
    Object? stats = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectInfo,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as BatchInfo,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as EnrollmentStats,
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
  $EnrollmentStatsCopyWith<$Res> get stats {
    return $EnrollmentStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
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
  $Res call(
      {String id, SubjectInfo subject, BatchInfo batch, EnrollmentStats stats});

  @override
  $SubjectInfoCopyWith<$Res> get subject;
  @override
  $BatchInfoCopyWith<$Res> get batch;
  @override
  $EnrollmentStatsCopyWith<$Res> get stats;
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
    Object? id = null,
    Object? subject = null,
    Object? batch = null,
    Object? stats = null,
  }) {
    return _then(_$EnrollmentInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectInfo,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as BatchInfo,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as EnrollmentStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnrollmentInfoImpl implements _EnrollmentInfo {
  const _$EnrollmentInfoImpl(
      {required this.id,
      required this.subject,
      required this.batch,
      required this.stats});

  factory _$EnrollmentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollmentInfoImplFromJson(json);

  @override
  final String id;
  @override
  final SubjectInfo subject;
  @override
  final BatchInfo batch;
  @override
  final EnrollmentStats stats;

  @override
  String toString() {
    return 'EnrollmentInfo(id: $id, subject: $subject, batch: $batch, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, subject, batch, stats);

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
      {required final String id,
      required final SubjectInfo subject,
      required final BatchInfo batch,
      required final EnrollmentStats stats}) = _$EnrollmentInfoImpl;

  factory _EnrollmentInfo.fromJson(Map<String, dynamic> json) =
      _$EnrollmentInfoImpl.fromJson;

  @override
  String get id;
  @override
  SubjectInfo get subject;
  @override
  BatchInfo get batch;
  @override
  EnrollmentStats get stats;

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
  int get studentCount => throw _privateConstructorUsedError;

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
  $Res call({String code, String name, int studentCount});
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
    Object? studentCount = null,
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
      studentCount: null == studentCount
          ? _value.studentCount
          : studentCount // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({String code, String name, int studentCount});
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
    Object? studentCount = null,
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
      studentCount: null == studentCount
          ? _value.studentCount
          : studentCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchInfoImpl implements _BatchInfo {
  const _$BatchInfoImpl(
      {required this.code, required this.name, required this.studentCount});

  factory _$BatchInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchInfoImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final int studentCount;

  @override
  String toString() {
    return 'BatchInfo(code: $code, name: $name, studentCount: $studentCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchInfoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.studentCount, studentCount) ||
                other.studentCount == studentCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, studentCount);

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
      required final int studentCount}) = _$BatchInfoImpl;

  factory _BatchInfo.fromJson(Map<String, dynamic> json) =
      _$BatchInfoImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  int get studentCount;

  /// Create a copy of BatchInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchInfoImplCopyWith<_$BatchInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnrollmentStats _$EnrollmentStatsFromJson(Map<String, dynamic> json) {
  return _EnrollmentStats.fromJson(json);
}

/// @nodoc
mixin _$EnrollmentStats {
  int get sessionsHeld => throw _privateConstructorUsedError;
  double get averageAttendance => throw _privateConstructorUsedError;
  DateTime? get lastSession => throw _privateConstructorUsedError;

  /// Serializes this EnrollmentStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnrollmentStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrollmentStatsCopyWith<EnrollmentStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollmentStatsCopyWith<$Res> {
  factory $EnrollmentStatsCopyWith(
          EnrollmentStats value, $Res Function(EnrollmentStats) then) =
      _$EnrollmentStatsCopyWithImpl<$Res, EnrollmentStats>;
  @useResult
  $Res call(
      {int sessionsHeld, double averageAttendance, DateTime? lastSession});
}

/// @nodoc
class _$EnrollmentStatsCopyWithImpl<$Res, $Val extends EnrollmentStats>
    implements $EnrollmentStatsCopyWith<$Res> {
  _$EnrollmentStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnrollmentStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionsHeld = null,
    Object? averageAttendance = null,
    Object? lastSession = freezed,
  }) {
    return _then(_value.copyWith(
      sessionsHeld: null == sessionsHeld
          ? _value.sessionsHeld
          : sessionsHeld // ignore: cast_nullable_to_non_nullable
              as int,
      averageAttendance: null == averageAttendance
          ? _value.averageAttendance
          : averageAttendance // ignore: cast_nullable_to_non_nullable
              as double,
      lastSession: freezed == lastSession
          ? _value.lastSession
          : lastSession // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnrollmentStatsImplCopyWith<$Res>
    implements $EnrollmentStatsCopyWith<$Res> {
  factory _$$EnrollmentStatsImplCopyWith(_$EnrollmentStatsImpl value,
          $Res Function(_$EnrollmentStatsImpl) then) =
      __$$EnrollmentStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int sessionsHeld, double averageAttendance, DateTime? lastSession});
}

/// @nodoc
class __$$EnrollmentStatsImplCopyWithImpl<$Res>
    extends _$EnrollmentStatsCopyWithImpl<$Res, _$EnrollmentStatsImpl>
    implements _$$EnrollmentStatsImplCopyWith<$Res> {
  __$$EnrollmentStatsImplCopyWithImpl(
      _$EnrollmentStatsImpl _value, $Res Function(_$EnrollmentStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnrollmentStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionsHeld = null,
    Object? averageAttendance = null,
    Object? lastSession = freezed,
  }) {
    return _then(_$EnrollmentStatsImpl(
      sessionsHeld: null == sessionsHeld
          ? _value.sessionsHeld
          : sessionsHeld // ignore: cast_nullable_to_non_nullable
              as int,
      averageAttendance: null == averageAttendance
          ? _value.averageAttendance
          : averageAttendance // ignore: cast_nullable_to_non_nullable
              as double,
      lastSession: freezed == lastSession
          ? _value.lastSession
          : lastSession // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnrollmentStatsImpl implements _EnrollmentStats {
  const _$EnrollmentStatsImpl(
      {required this.sessionsHeld,
      required this.averageAttendance,
      this.lastSession});

  factory _$EnrollmentStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollmentStatsImplFromJson(json);

  @override
  final int sessionsHeld;
  @override
  final double averageAttendance;
  @override
  final DateTime? lastSession;

  @override
  String toString() {
    return 'EnrollmentStats(sessionsHeld: $sessionsHeld, averageAttendance: $averageAttendance, lastSession: $lastSession)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentStatsImpl &&
            (identical(other.sessionsHeld, sessionsHeld) ||
                other.sessionsHeld == sessionsHeld) &&
            (identical(other.averageAttendance, averageAttendance) ||
                other.averageAttendance == averageAttendance) &&
            (identical(other.lastSession, lastSession) ||
                other.lastSession == lastSession));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionsHeld, averageAttendance, lastSession);

  /// Create a copy of EnrollmentStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentStatsImplCopyWith<_$EnrollmentStatsImpl> get copyWith =>
      __$$EnrollmentStatsImplCopyWithImpl<_$EnrollmentStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrollmentStatsImplToJson(
      this,
    );
  }
}

abstract class _EnrollmentStats implements EnrollmentStats {
  const factory _EnrollmentStats(
      {required final int sessionsHeld,
      required final double averageAttendance,
      final DateTime? lastSession}) = _$EnrollmentStatsImpl;

  factory _EnrollmentStats.fromJson(Map<String, dynamic> json) =
      _$EnrollmentStatsImpl.fromJson;

  @override
  int get sessionsHeld;
  @override
  double get averageAttendance;
  @override
  DateTime? get lastSession;

  /// Create a copy of EnrollmentStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollmentStatsImplCopyWith<_$EnrollmentStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentSession _$RecentSessionFromJson(Map<String, dynamic> json) {
  return _RecentSession.fromJson(json);
}

/// @nodoc
mixin _$RecentSession {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  SubjectEnrollmentInfo get subjectEnrollment =>
      throw _privateConstructorUsedError;
  RecordsCount get count => throw _privateConstructorUsedError;

  /// Serializes this RecentSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentSessionCopyWith<RecentSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentSessionCopyWith<$Res> {
  factory $RecentSessionCopyWith(
          RecentSession value, $Res Function(RecentSession) then) =
      _$RecentSessionCopyWithImpl<$Res, RecentSession>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String startTime,
      String endTime,
      SubjectEnrollmentInfo subjectEnrollment,
      RecordsCount count});

  $SubjectEnrollmentInfoCopyWith<$Res> get subjectEnrollment;
  $RecordsCountCopyWith<$Res> get count;
}

/// @nodoc
class _$RecentSessionCopyWithImpl<$Res, $Val extends RecentSession>
    implements $RecentSessionCopyWith<$Res> {
  _$RecentSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? subjectEnrollment = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      subjectEnrollment: null == subjectEnrollment
          ? _value.subjectEnrollment
          : subjectEnrollment // ignore: cast_nullable_to_non_nullable
              as SubjectEnrollmentInfo,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as RecordsCount,
    ) as $Val);
  }

  /// Create a copy of RecentSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectEnrollmentInfoCopyWith<$Res> get subjectEnrollment {
    return $SubjectEnrollmentInfoCopyWith<$Res>(_value.subjectEnrollment,
        (value) {
      return _then(_value.copyWith(subjectEnrollment: value) as $Val);
    });
  }

  /// Create a copy of RecentSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecordsCountCopyWith<$Res> get count {
    return $RecordsCountCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecentSessionImplCopyWith<$Res>
    implements $RecentSessionCopyWith<$Res> {
  factory _$$RecentSessionImplCopyWith(
          _$RecentSessionImpl value, $Res Function(_$RecentSessionImpl) then) =
      __$$RecentSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String startTime,
      String endTime,
      SubjectEnrollmentInfo subjectEnrollment,
      RecordsCount count});

  @override
  $SubjectEnrollmentInfoCopyWith<$Res> get subjectEnrollment;
  @override
  $RecordsCountCopyWith<$Res> get count;
}

/// @nodoc
class __$$RecentSessionImplCopyWithImpl<$Res>
    extends _$RecentSessionCopyWithImpl<$Res, _$RecentSessionImpl>
    implements _$$RecentSessionImplCopyWith<$Res> {
  __$$RecentSessionImplCopyWithImpl(
      _$RecentSessionImpl _value, $Res Function(_$RecentSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? subjectEnrollment = null,
    Object? count = null,
  }) {
    return _then(_$RecentSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      subjectEnrollment: null == subjectEnrollment
          ? _value.subjectEnrollment
          : subjectEnrollment // ignore: cast_nullable_to_non_nullable
              as SubjectEnrollmentInfo,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as RecordsCount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentSessionImpl implements _RecentSession {
  const _$RecentSessionImpl(
      {required this.id,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.subjectEnrollment,
      required this.count});

  factory _$RecentSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentSessionImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final SubjectEnrollmentInfo subjectEnrollment;
  @override
  final RecordsCount count;

  @override
  String toString() {
    return 'RecentSession(id: $id, date: $date, startTime: $startTime, endTime: $endTime, subjectEnrollment: $subjectEnrollment, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.subjectEnrollment, subjectEnrollment) ||
                other.subjectEnrollment == subjectEnrollment) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, date, startTime, endTime, subjectEnrollment, count);

  /// Create a copy of RecentSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentSessionImplCopyWith<_$RecentSessionImpl> get copyWith =>
      __$$RecentSessionImplCopyWithImpl<_$RecentSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentSessionImplToJson(
      this,
    );
  }
}

abstract class _RecentSession implements RecentSession {
  const factory _RecentSession(
      {required final String id,
      required final DateTime date,
      required final String startTime,
      required final String endTime,
      required final SubjectEnrollmentInfo subjectEnrollment,
      required final RecordsCount count}) = _$RecentSessionImpl;

  factory _RecentSession.fromJson(Map<String, dynamic> json) =
      _$RecentSessionImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  SubjectEnrollmentInfo get subjectEnrollment;
  @override
  RecordsCount get count;

  /// Create a copy of RecentSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentSessionImplCopyWith<_$RecentSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubjectEnrollmentInfo _$SubjectEnrollmentInfoFromJson(
    Map<String, dynamic> json) {
  return _SubjectEnrollmentInfo.fromJson(json);
}

/// @nodoc
mixin _$SubjectEnrollmentInfo {
  SubjectInfo get subject => throw _privateConstructorUsedError;
  BatchInfo get batch => throw _privateConstructorUsedError;

  /// Serializes this SubjectEnrollmentInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectEnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectEnrollmentInfoCopyWith<SubjectEnrollmentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectEnrollmentInfoCopyWith<$Res> {
  factory $SubjectEnrollmentInfoCopyWith(SubjectEnrollmentInfo value,
          $Res Function(SubjectEnrollmentInfo) then) =
      _$SubjectEnrollmentInfoCopyWithImpl<$Res, SubjectEnrollmentInfo>;
  @useResult
  $Res call({SubjectInfo subject, BatchInfo batch});

  $SubjectInfoCopyWith<$Res> get subject;
  $BatchInfoCopyWith<$Res> get batch;
}

/// @nodoc
class _$SubjectEnrollmentInfoCopyWithImpl<$Res,
        $Val extends SubjectEnrollmentInfo>
    implements $SubjectEnrollmentInfoCopyWith<$Res> {
  _$SubjectEnrollmentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectEnrollmentInfo
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

  /// Create a copy of SubjectEnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectInfoCopyWith<$Res> get subject {
    return $SubjectInfoCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  /// Create a copy of SubjectEnrollmentInfo
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
abstract class _$$SubjectEnrollmentInfoImplCopyWith<$Res>
    implements $SubjectEnrollmentInfoCopyWith<$Res> {
  factory _$$SubjectEnrollmentInfoImplCopyWith(
          _$SubjectEnrollmentInfoImpl value,
          $Res Function(_$SubjectEnrollmentInfoImpl) then) =
      __$$SubjectEnrollmentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SubjectInfo subject, BatchInfo batch});

  @override
  $SubjectInfoCopyWith<$Res> get subject;
  @override
  $BatchInfoCopyWith<$Res> get batch;
}

/// @nodoc
class __$$SubjectEnrollmentInfoImplCopyWithImpl<$Res>
    extends _$SubjectEnrollmentInfoCopyWithImpl<$Res,
        _$SubjectEnrollmentInfoImpl>
    implements _$$SubjectEnrollmentInfoImplCopyWith<$Res> {
  __$$SubjectEnrollmentInfoImplCopyWithImpl(_$SubjectEnrollmentInfoImpl _value,
      $Res Function(_$SubjectEnrollmentInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectEnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? batch = null,
  }) {
    return _then(_$SubjectEnrollmentInfoImpl(
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
class _$SubjectEnrollmentInfoImpl implements _SubjectEnrollmentInfo {
  const _$SubjectEnrollmentInfoImpl(
      {required this.subject, required this.batch});

  factory _$SubjectEnrollmentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectEnrollmentInfoImplFromJson(json);

  @override
  final SubjectInfo subject;
  @override
  final BatchInfo batch;

  @override
  String toString() {
    return 'SubjectEnrollmentInfo(subject: $subject, batch: $batch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectEnrollmentInfoImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.batch, batch) || other.batch == batch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subject, batch);

  /// Create a copy of SubjectEnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectEnrollmentInfoImplCopyWith<_$SubjectEnrollmentInfoImpl>
      get copyWith => __$$SubjectEnrollmentInfoImplCopyWithImpl<
          _$SubjectEnrollmentInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectEnrollmentInfoImplToJson(
      this,
    );
  }
}

abstract class _SubjectEnrollmentInfo implements SubjectEnrollmentInfo {
  const factory _SubjectEnrollmentInfo(
      {required final SubjectInfo subject,
      required final BatchInfo batch}) = _$SubjectEnrollmentInfoImpl;

  factory _SubjectEnrollmentInfo.fromJson(Map<String, dynamic> json) =
      _$SubjectEnrollmentInfoImpl.fromJson;

  @override
  SubjectInfo get subject;
  @override
  BatchInfo get batch;

  /// Create a copy of SubjectEnrollmentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectEnrollmentInfoImplCopyWith<_$SubjectEnrollmentInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecordsCount _$RecordsCountFromJson(Map<String, dynamic> json) {
  return _RecordsCount.fromJson(json);
}

/// @nodoc
mixin _$RecordsCount {
  int get records => throw _privateConstructorUsedError;

  /// Serializes this RecordsCount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecordsCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordsCountCopyWith<RecordsCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordsCountCopyWith<$Res> {
  factory $RecordsCountCopyWith(
          RecordsCount value, $Res Function(RecordsCount) then) =
      _$RecordsCountCopyWithImpl<$Res, RecordsCount>;
  @useResult
  $Res call({int records});
}

/// @nodoc
class _$RecordsCountCopyWithImpl<$Res, $Val extends RecordsCount>
    implements $RecordsCountCopyWith<$Res> {
  _$RecordsCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordsCount
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
abstract class _$$RecordsCountImplCopyWith<$Res>
    implements $RecordsCountCopyWith<$Res> {
  factory _$$RecordsCountImplCopyWith(
          _$RecordsCountImpl value, $Res Function(_$RecordsCountImpl) then) =
      __$$RecordsCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int records});
}

/// @nodoc
class __$$RecordsCountImplCopyWithImpl<$Res>
    extends _$RecordsCountCopyWithImpl<$Res, _$RecordsCountImpl>
    implements _$$RecordsCountImplCopyWith<$Res> {
  __$$RecordsCountImplCopyWithImpl(
      _$RecordsCountImpl _value, $Res Function(_$RecordsCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordsCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
  }) {
    return _then(_$RecordsCountImpl(
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordsCountImpl implements _RecordsCount {
  const _$RecordsCountImpl({required this.records});

  factory _$RecordsCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordsCountImplFromJson(json);

  @override
  final int records;

  @override
  String toString() {
    return 'RecordsCount(records: $records)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordsCountImpl &&
            (identical(other.records, records) || other.records == records));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, records);

  /// Create a copy of RecordsCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordsCountImplCopyWith<_$RecordsCountImpl> get copyWith =>
      __$$RecordsCountImplCopyWithImpl<_$RecordsCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordsCountImplToJson(
      this,
    );
  }
}

abstract class _RecordsCount implements RecordsCount {
  const factory _RecordsCount({required final int records}) =
      _$RecordsCountImpl;

  factory _RecordsCount.fromJson(Map<String, dynamic> json) =
      _$RecordsCountImpl.fromJson;

  @override
  int get records;

  /// Create a copy of RecordsCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordsCountImplCopyWith<_$RecordsCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LowAttendanceStudent _$LowAttendanceStudentFromJson(Map<String, dynamic> json) {
  return _LowAttendanceStudent.fromJson(json);
}

/// @nodoc
mixin _$LowAttendanceStudent {
  String get studentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get batchCode => throw _privateConstructorUsedError;
  String get subjectCode => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this LowAttendanceStudent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LowAttendanceStudent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LowAttendanceStudentCopyWith<LowAttendanceStudent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LowAttendanceStudentCopyWith<$Res> {
  factory $LowAttendanceStudentCopyWith(LowAttendanceStudent value,
          $Res Function(LowAttendanceStudent) then) =
      _$LowAttendanceStudentCopyWithImpl<$Res, LowAttendanceStudent>;
  @useResult
  $Res call(
      {String studentId,
      String name,
      String batchCode,
      String subjectCode,
      double percentage});
}

/// @nodoc
class _$LowAttendanceStudentCopyWithImpl<$Res,
        $Val extends LowAttendanceStudent>
    implements $LowAttendanceStudentCopyWith<$Res> {
  _$LowAttendanceStudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LowAttendanceStudent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? name = null,
    Object? batchCode = null,
    Object? subjectCode = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      batchCode: null == batchCode
          ? _value.batchCode
          : batchCode // ignore: cast_nullable_to_non_nullable
              as String,
      subjectCode: null == subjectCode
          ? _value.subjectCode
          : subjectCode // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LowAttendanceStudentImplCopyWith<$Res>
    implements $LowAttendanceStudentCopyWith<$Res> {
  factory _$$LowAttendanceStudentImplCopyWith(_$LowAttendanceStudentImpl value,
          $Res Function(_$LowAttendanceStudentImpl) then) =
      __$$LowAttendanceStudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String studentId,
      String name,
      String batchCode,
      String subjectCode,
      double percentage});
}

/// @nodoc
class __$$LowAttendanceStudentImplCopyWithImpl<$Res>
    extends _$LowAttendanceStudentCopyWithImpl<$Res, _$LowAttendanceStudentImpl>
    implements _$$LowAttendanceStudentImplCopyWith<$Res> {
  __$$LowAttendanceStudentImplCopyWithImpl(_$LowAttendanceStudentImpl _value,
      $Res Function(_$LowAttendanceStudentImpl) _then)
      : super(_value, _then);

  /// Create a copy of LowAttendanceStudent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? name = null,
    Object? batchCode = null,
    Object? subjectCode = null,
    Object? percentage = null,
  }) {
    return _then(_$LowAttendanceStudentImpl(
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      batchCode: null == batchCode
          ? _value.batchCode
          : batchCode // ignore: cast_nullable_to_non_nullable
              as String,
      subjectCode: null == subjectCode
          ? _value.subjectCode
          : subjectCode // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LowAttendanceStudentImpl implements _LowAttendanceStudent {
  const _$LowAttendanceStudentImpl(
      {required this.studentId,
      required this.name,
      required this.batchCode,
      required this.subjectCode,
      required this.percentage});

  factory _$LowAttendanceStudentImpl.fromJson(Map<String, dynamic> json) =>
      _$$LowAttendanceStudentImplFromJson(json);

  @override
  final String studentId;
  @override
  final String name;
  @override
  final String batchCode;
  @override
  final String subjectCode;
  @override
  final double percentage;

  @override
  String toString() {
    return 'LowAttendanceStudent(studentId: $studentId, name: $name, batchCode: $batchCode, subjectCode: $subjectCode, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LowAttendanceStudentImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.batchCode, batchCode) ||
                other.batchCode == batchCode) &&
            (identical(other.subjectCode, subjectCode) ||
                other.subjectCode == subjectCode) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, studentId, name, batchCode, subjectCode, percentage);

  /// Create a copy of LowAttendanceStudent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LowAttendanceStudentImplCopyWith<_$LowAttendanceStudentImpl>
      get copyWith =>
          __$$LowAttendanceStudentImplCopyWithImpl<_$LowAttendanceStudentImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LowAttendanceStudentImplToJson(
      this,
    );
  }
}

abstract class _LowAttendanceStudent implements LowAttendanceStudent {
  const factory _LowAttendanceStudent(
      {required final String studentId,
      required final String name,
      required final String batchCode,
      required final String subjectCode,
      required final double percentage}) = _$LowAttendanceStudentImpl;

  factory _LowAttendanceStudent.fromJson(Map<String, dynamic> json) =
      _$LowAttendanceStudentImpl.fromJson;

  @override
  String get studentId;
  @override
  String get name;
  @override
  String get batchCode;
  @override
  String get subjectCode;
  @override
  double get percentage;

  /// Create a copy of LowAttendanceStudent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LowAttendanceStudentImplCopyWith<_$LowAttendanceStudentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) {
  return _DashboardStats.fromJson(json);
}

/// @nodoc
mixin _$DashboardStats {
  int get totalEnrollments => throw _privateConstructorUsedError;
  int get totalBatchesTeaching => throw _privateConstructorUsedError;
  int get totalSubjects => throw _privateConstructorUsedError;
  int get totalStudents => throw _privateConstructorUsedError;
  int get totalSessions => throw _privateConstructorUsedError;
  double get averageAttendance => throw _privateConstructorUsedError;

  /// Serializes this DashboardStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStatsCopyWith<DashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsCopyWith<$Res> {
  factory $DashboardStatsCopyWith(
          DashboardStats value, $Res Function(DashboardStats) then) =
      _$DashboardStatsCopyWithImpl<$Res, DashboardStats>;
  @useResult
  $Res call(
      {int totalEnrollments,
      int totalBatchesTeaching,
      int totalSubjects,
      int totalStudents,
      int totalSessions,
      double averageAttendance});
}

/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res, $Val extends DashboardStats>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEnrollments = null,
    Object? totalBatchesTeaching = null,
    Object? totalSubjects = null,
    Object? totalStudents = null,
    Object? totalSessions = null,
    Object? averageAttendance = null,
  }) {
    return _then(_value.copyWith(
      totalEnrollments: null == totalEnrollments
          ? _value.totalEnrollments
          : totalEnrollments // ignore: cast_nullable_to_non_nullable
              as int,
      totalBatchesTeaching: null == totalBatchesTeaching
          ? _value.totalBatchesTeaching
          : totalBatchesTeaching // ignore: cast_nullable_to_non_nullable
              as int,
      totalSubjects: null == totalSubjects
          ? _value.totalSubjects
          : totalSubjects // ignore: cast_nullable_to_non_nullable
              as int,
      totalStudents: null == totalStudents
          ? _value.totalStudents
          : totalStudents // ignore: cast_nullable_to_non_nullable
              as int,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      averageAttendance: null == averageAttendance
          ? _value.averageAttendance
          : averageAttendance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardStatsImplCopyWith<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  factory _$$DashboardStatsImplCopyWith(_$DashboardStatsImpl value,
          $Res Function(_$DashboardStatsImpl) then) =
      __$$DashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalEnrollments,
      int totalBatchesTeaching,
      int totalSubjects,
      int totalStudents,
      int totalSessions,
      double averageAttendance});
}

/// @nodoc
class __$$DashboardStatsImplCopyWithImpl<$Res>
    extends _$DashboardStatsCopyWithImpl<$Res, _$DashboardStatsImpl>
    implements _$$DashboardStatsImplCopyWith<$Res> {
  __$$DashboardStatsImplCopyWithImpl(
      _$DashboardStatsImpl _value, $Res Function(_$DashboardStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEnrollments = null,
    Object? totalBatchesTeaching = null,
    Object? totalSubjects = null,
    Object? totalStudents = null,
    Object? totalSessions = null,
    Object? averageAttendance = null,
  }) {
    return _then(_$DashboardStatsImpl(
      totalEnrollments: null == totalEnrollments
          ? _value.totalEnrollments
          : totalEnrollments // ignore: cast_nullable_to_non_nullable
              as int,
      totalBatchesTeaching: null == totalBatchesTeaching
          ? _value.totalBatchesTeaching
          : totalBatchesTeaching // ignore: cast_nullable_to_non_nullable
              as int,
      totalSubjects: null == totalSubjects
          ? _value.totalSubjects
          : totalSubjects // ignore: cast_nullable_to_non_nullable
              as int,
      totalStudents: null == totalStudents
          ? _value.totalStudents
          : totalStudents // ignore: cast_nullable_to_non_nullable
              as int,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      averageAttendance: null == averageAttendance
          ? _value.averageAttendance
          : averageAttendance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsImpl implements _DashboardStats {
  const _$DashboardStatsImpl(
      {required this.totalEnrollments,
      required this.totalBatchesTeaching,
      required this.totalSubjects,
      required this.totalStudents,
      required this.totalSessions,
      required this.averageAttendance});

  factory _$DashboardStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsImplFromJson(json);

  @override
  final int totalEnrollments;
  @override
  @JsonKey()
  final int totalBatchesTeaching;
  @override
  @JsonKey()
  final int totalSubjects;
  @override
  @JsonKey()
  final int totalStudents;
  @override
  final int totalSessions;
  @override
  final double averageAttendance;

  @override
  String toString() {
    return 'DashboardStats(totalEnrollments: $totalEnrollments, totalBatchesTeaching: $totalBatchesTeaching, totalSubjects: $totalSubjects, totalStudents: $totalStudents, totalSessions: $totalSessions, averageAttendance: $averageAttendance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsImpl &&
            (identical(other.totalEnrollments, totalEnrollments) ||
                other.totalEnrollments == totalEnrollments) &&
            (identical(other.totalBatchesTeaching, totalBatchesTeaching) ||
                other.totalBatchesTeaching == totalBatchesTeaching) &&
            (identical(other.totalSubjects, totalSubjects) ||
                other.totalSubjects == totalSubjects) &&
            (identical(other.totalStudents, totalStudents) ||
                other.totalStudents == totalStudents) &&
            (identical(other.totalSessions, totalSessions) ||
                other.totalSessions == totalSessions) &&
            (identical(other.averageAttendance, averageAttendance) ||
                other.averageAttendance == averageAttendance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalEnrollments,
      totalBatchesTeaching,
      totalSubjects,
      totalStudents,
      totalSessions,
      averageAttendance);

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      __$$DashboardStatsImplCopyWithImpl<_$DashboardStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsImplToJson(
      this,
    );
  }
}

abstract class _DashboardStats implements DashboardStats {
  const factory _DashboardStats(
      {required final int totalEnrollments,
      required final int totalBatchesTeaching,
      required final int totalSubjects,
      required final int totalStudents,
      required final int totalSessions,
      required final double averageAttendance}) = _$DashboardStatsImpl;

  factory _DashboardStats.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsImpl.fromJson;

  @override
  int get totalEnrollments;
  @override
  int get totalBatchesTeaching;
  @override
  int get totalSubjects;
  @override
  int get totalStudents;
  @override
  int get totalSessions;
  @override
  double get averageAttendance;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
