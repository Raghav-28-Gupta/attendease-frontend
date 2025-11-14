// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectAttendanceDetail _$SubjectAttendanceDetailFromJson(
    Map<String, dynamic> json) {
  return _SubjectAttendanceDetail.fromJson(json);
}

/// @nodoc
mixin _$SubjectAttendanceDetail {
  String get subjectCode => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;
  AttendanceDetailStats get stats => throw _privateConstructorUsedError;
  List<AttendanceRecordInfo> get records => throw _privateConstructorUsedError;

  /// Serializes this SubjectAttendanceDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectAttendanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectAttendanceDetailCopyWith<SubjectAttendanceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectAttendanceDetailCopyWith<$Res> {
  factory $SubjectAttendanceDetailCopyWith(SubjectAttendanceDetail value,
          $Res Function(SubjectAttendanceDetail) then) =
      _$SubjectAttendanceDetailCopyWithImpl<$Res, SubjectAttendanceDetail>;
  @useResult
  $Res call(
      {String subjectCode,
      String subjectName,
      String semester,
      AttendanceDetailStats stats,
      List<AttendanceRecordInfo> records});

  $AttendanceDetailStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$SubjectAttendanceDetailCopyWithImpl<$Res,
        $Val extends SubjectAttendanceDetail>
    implements $SubjectAttendanceDetailCopyWith<$Res> {
  _$SubjectAttendanceDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectAttendanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectCode = null,
    Object? subjectName = null,
    Object? semester = null,
    Object? stats = null,
    Object? records = null,
  }) {
    return _then(_value.copyWith(
      subjectCode: null == subjectCode
          ? _value.subjectCode
          : subjectCode // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as AttendanceDetailStats,
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRecordInfo>,
    ) as $Val);
  }

  /// Create a copy of SubjectAttendanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendanceDetailStatsCopyWith<$Res> get stats {
    return $AttendanceDetailStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubjectAttendanceDetailImplCopyWith<$Res>
    implements $SubjectAttendanceDetailCopyWith<$Res> {
  factory _$$SubjectAttendanceDetailImplCopyWith(
          _$SubjectAttendanceDetailImpl value,
          $Res Function(_$SubjectAttendanceDetailImpl) then) =
      __$$SubjectAttendanceDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String subjectCode,
      String subjectName,
      String semester,
      AttendanceDetailStats stats,
      List<AttendanceRecordInfo> records});

  @override
  $AttendanceDetailStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$SubjectAttendanceDetailImplCopyWithImpl<$Res>
    extends _$SubjectAttendanceDetailCopyWithImpl<$Res,
        _$SubjectAttendanceDetailImpl>
    implements _$$SubjectAttendanceDetailImplCopyWith<$Res> {
  __$$SubjectAttendanceDetailImplCopyWithImpl(
      _$SubjectAttendanceDetailImpl _value,
      $Res Function(_$SubjectAttendanceDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectAttendanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectCode = null,
    Object? subjectName = null,
    Object? semester = null,
    Object? stats = null,
    Object? records = null,
  }) {
    return _then(_$SubjectAttendanceDetailImpl(
      subjectCode: null == subjectCode
          ? _value.subjectCode
          : subjectCode // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as AttendanceDetailStats,
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRecordInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectAttendanceDetailImpl implements _SubjectAttendanceDetail {
  const _$SubjectAttendanceDetailImpl(
      {required this.subjectCode,
      required this.subjectName,
      required this.semester,
      required this.stats,
      required final List<AttendanceRecordInfo> records})
      : _records = records;

  factory _$SubjectAttendanceDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectAttendanceDetailImplFromJson(json);

  @override
  final String subjectCode;
  @override
  final String subjectName;
  @override
  final String semester;
  @override
  final AttendanceDetailStats stats;
  final List<AttendanceRecordInfo> _records;
  @override
  List<AttendanceRecordInfo> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  String toString() {
    return 'SubjectAttendanceDetail(subjectCode: $subjectCode, subjectName: $subjectName, semester: $semester, stats: $stats, records: $records)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectAttendanceDetailImpl &&
            (identical(other.subjectCode, subjectCode) ||
                other.subjectCode == subjectCode) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subjectCode, subjectName,
      semester, stats, const DeepCollectionEquality().hash(_records));

  /// Create a copy of SubjectAttendanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectAttendanceDetailImplCopyWith<_$SubjectAttendanceDetailImpl>
      get copyWith => __$$SubjectAttendanceDetailImplCopyWithImpl<
          _$SubjectAttendanceDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectAttendanceDetailImplToJson(
      this,
    );
  }
}

abstract class _SubjectAttendanceDetail implements SubjectAttendanceDetail {
  const factory _SubjectAttendanceDetail(
          {required final String subjectCode,
          required final String subjectName,
          required final String semester,
          required final AttendanceDetailStats stats,
          required final List<AttendanceRecordInfo> records}) =
      _$SubjectAttendanceDetailImpl;

  factory _SubjectAttendanceDetail.fromJson(Map<String, dynamic> json) =
      _$SubjectAttendanceDetailImpl.fromJson;

  @override
  String get subjectCode;
  @override
  String get subjectName;
  @override
  String get semester;
  @override
  AttendanceDetailStats get stats;
  @override
  List<AttendanceRecordInfo> get records;

  /// Create a copy of SubjectAttendanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectAttendanceDetailImplCopyWith<_$SubjectAttendanceDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AttendanceDetailStats _$AttendanceDetailStatsFromJson(
    Map<String, dynamic> json) {
  return _AttendanceDetailStats.fromJson(json);
}

/// @nodoc
mixin _$AttendanceDetailStats {
  int get totalSessions => throw _privateConstructorUsedError;
  int get present => throw _privateConstructorUsedError;
  int get absent => throw _privateConstructorUsedError;
  int get late => throw _privateConstructorUsedError;
  int get excused => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get sessionsNeeded => throw _privateConstructorUsedError;

  /// Serializes this AttendanceDetailStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceDetailStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceDetailStatsCopyWith<AttendanceDetailStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDetailStatsCopyWith<$Res> {
  factory $AttendanceDetailStatsCopyWith(AttendanceDetailStats value,
          $Res Function(AttendanceDetailStats) then) =
      _$AttendanceDetailStatsCopyWithImpl<$Res, AttendanceDetailStats>;
  @useResult
  $Res call(
      {int totalSessions,
      int present,
      int absent,
      int late,
      int excused,
      double percentage,
      String status,
      int sessionsNeeded});
}

/// @nodoc
class _$AttendanceDetailStatsCopyWithImpl<$Res,
        $Val extends AttendanceDetailStats>
    implements $AttendanceDetailStatsCopyWith<$Res> {
  _$AttendanceDetailStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceDetailStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSessions = null,
    Object? present = null,
    Object? absent = null,
    Object? late = null,
    Object? excused = null,
    Object? percentage = null,
    Object? status = null,
    Object? sessionsNeeded = null,
  }) {
    return _then(_value.copyWith(
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      present: null == present
          ? _value.present
          : present // ignore: cast_nullable_to_non_nullable
              as int,
      absent: null == absent
          ? _value.absent
          : absent // ignore: cast_nullable_to_non_nullable
              as int,
      late: null == late
          ? _value.late
          : late // ignore: cast_nullable_to_non_nullable
              as int,
      excused: null == excused
          ? _value.excused
          : excused // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sessionsNeeded: null == sessionsNeeded
          ? _value.sessionsNeeded
          : sessionsNeeded // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceDetailStatsImplCopyWith<$Res>
    implements $AttendanceDetailStatsCopyWith<$Res> {
  factory _$$AttendanceDetailStatsImplCopyWith(
          _$AttendanceDetailStatsImpl value,
          $Res Function(_$AttendanceDetailStatsImpl) then) =
      __$$AttendanceDetailStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalSessions,
      int present,
      int absent,
      int late,
      int excused,
      double percentage,
      String status,
      int sessionsNeeded});
}

/// @nodoc
class __$$AttendanceDetailStatsImplCopyWithImpl<$Res>
    extends _$AttendanceDetailStatsCopyWithImpl<$Res,
        _$AttendanceDetailStatsImpl>
    implements _$$AttendanceDetailStatsImplCopyWith<$Res> {
  __$$AttendanceDetailStatsImplCopyWithImpl(_$AttendanceDetailStatsImpl _value,
      $Res Function(_$AttendanceDetailStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceDetailStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSessions = null,
    Object? present = null,
    Object? absent = null,
    Object? late = null,
    Object? excused = null,
    Object? percentage = null,
    Object? status = null,
    Object? sessionsNeeded = null,
  }) {
    return _then(_$AttendanceDetailStatsImpl(
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      present: null == present
          ? _value.present
          : present // ignore: cast_nullable_to_non_nullable
              as int,
      absent: null == absent
          ? _value.absent
          : absent // ignore: cast_nullable_to_non_nullable
              as int,
      late: null == late
          ? _value.late
          : late // ignore: cast_nullable_to_non_nullable
              as int,
      excused: null == excused
          ? _value.excused
          : excused // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      sessionsNeeded: null == sessionsNeeded
          ? _value.sessionsNeeded
          : sessionsNeeded // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceDetailStatsImpl implements _AttendanceDetailStats {
  const _$AttendanceDetailStatsImpl(
      {required this.totalSessions,
      required this.present,
      required this.absent,
      required this.late,
      required this.excused,
      required this.percentage,
      required this.status,
      required this.sessionsNeeded});

  factory _$AttendanceDetailStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceDetailStatsImplFromJson(json);

  @override
  final int totalSessions;
  @override
  final int present;
  @override
  final int absent;
  @override
  final int late;
  @override
  final int excused;
  @override
  final double percentage;
  @override
  final String status;
  @override
  final int sessionsNeeded;

  @override
  String toString() {
    return 'AttendanceDetailStats(totalSessions: $totalSessions, present: $present, absent: $absent, late: $late, excused: $excused, percentage: $percentage, status: $status, sessionsNeeded: $sessionsNeeded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceDetailStatsImpl &&
            (identical(other.totalSessions, totalSessions) ||
                other.totalSessions == totalSessions) &&
            (identical(other.present, present) || other.present == present) &&
            (identical(other.absent, absent) || other.absent == absent) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.excused, excused) || other.excused == excused) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sessionsNeeded, sessionsNeeded) ||
                other.sessionsNeeded == sessionsNeeded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalSessions, present, absent,
      late, excused, percentage, status, sessionsNeeded);

  /// Create a copy of AttendanceDetailStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceDetailStatsImplCopyWith<_$AttendanceDetailStatsImpl>
      get copyWith => __$$AttendanceDetailStatsImplCopyWithImpl<
          _$AttendanceDetailStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceDetailStatsImplToJson(
      this,
    );
  }
}

abstract class _AttendanceDetailStats implements AttendanceDetailStats {
  const factory _AttendanceDetailStats(
      {required final int totalSessions,
      required final int present,
      required final int absent,
      required final int late,
      required final int excused,
      required final double percentage,
      required final String status,
      required final int sessionsNeeded}) = _$AttendanceDetailStatsImpl;

  factory _AttendanceDetailStats.fromJson(Map<String, dynamic> json) =
      _$AttendanceDetailStatsImpl.fromJson;

  @override
  int get totalSessions;
  @override
  int get present;
  @override
  int get absent;
  @override
  int get late;
  @override
  int get excused;
  @override
  double get percentage;
  @override
  String get status;
  @override
  int get sessionsNeeded;

  /// Create a copy of AttendanceDetailStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceDetailStatsImplCopyWith<_$AttendanceDetailStatsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AttendanceRecordInfo _$AttendanceRecordInfoFromJson(Map<String, dynamic> json) {
  return _AttendanceRecordInfo.fromJson(json);
}

/// @nodoc
mixin _$AttendanceRecordInfo {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get markedAt => throw _privateConstructorUsedError;

  /// Serializes this AttendanceRecordInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceRecordInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceRecordInfoCopyWith<AttendanceRecordInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceRecordInfoCopyWith<$Res> {
  factory $AttendanceRecordInfoCopyWith(AttendanceRecordInfo value,
          $Res Function(AttendanceRecordInfo) then) =
      _$AttendanceRecordInfoCopyWithImpl<$Res, AttendanceRecordInfo>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String startTime,
      String endTime,
      String status,
      DateTime markedAt});
}

/// @nodoc
class _$AttendanceRecordInfoCopyWithImpl<$Res,
        $Val extends AttendanceRecordInfo>
    implements $AttendanceRecordInfoCopyWith<$Res> {
  _$AttendanceRecordInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceRecordInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? markedAt = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      markedAt: null == markedAt
          ? _value.markedAt
          : markedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceRecordInfoImplCopyWith<$Res>
    implements $AttendanceRecordInfoCopyWith<$Res> {
  factory _$$AttendanceRecordInfoImplCopyWith(_$AttendanceRecordInfoImpl value,
          $Res Function(_$AttendanceRecordInfoImpl) then) =
      __$$AttendanceRecordInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String startTime,
      String endTime,
      String status,
      DateTime markedAt});
}

/// @nodoc
class __$$AttendanceRecordInfoImplCopyWithImpl<$Res>
    extends _$AttendanceRecordInfoCopyWithImpl<$Res, _$AttendanceRecordInfoImpl>
    implements _$$AttendanceRecordInfoImplCopyWith<$Res> {
  __$$AttendanceRecordInfoImplCopyWithImpl(_$AttendanceRecordInfoImpl _value,
      $Res Function(_$AttendanceRecordInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceRecordInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? markedAt = null,
  }) {
    return _then(_$AttendanceRecordInfoImpl(
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      markedAt: null == markedAt
          ? _value.markedAt
          : markedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceRecordInfoImpl implements _AttendanceRecordInfo {
  const _$AttendanceRecordInfoImpl(
      {required this.id,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.status,
      required this.markedAt});

  factory _$AttendanceRecordInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceRecordInfoImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String status;
  @override
  final DateTime markedAt;

  @override
  String toString() {
    return 'AttendanceRecordInfo(id: $id, date: $date, startTime: $startTime, endTime: $endTime, status: $status, markedAt: $markedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceRecordInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.markedAt, markedAt) ||
                other.markedAt == markedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, startTime, endTime, status, markedAt);

  /// Create a copy of AttendanceRecordInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceRecordInfoImplCopyWith<_$AttendanceRecordInfoImpl>
      get copyWith =>
          __$$AttendanceRecordInfoImplCopyWithImpl<_$AttendanceRecordInfoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceRecordInfoImplToJson(
      this,
    );
  }
}

abstract class _AttendanceRecordInfo implements AttendanceRecordInfo {
  const factory _AttendanceRecordInfo(
      {required final String id,
      required final DateTime date,
      required final String startTime,
      required final String endTime,
      required final String status,
      required final DateTime markedAt}) = _$AttendanceRecordInfoImpl;

  factory _AttendanceRecordInfo.fromJson(Map<String, dynamic> json) =
      _$AttendanceRecordInfoImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String get status;
  @override
  DateTime get markedAt;

  /// Create a copy of AttendanceRecordInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceRecordInfoImplCopyWith<_$AttendanceRecordInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
