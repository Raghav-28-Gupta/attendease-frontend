// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentDashboardModel _$StudentDashboardModelFromJson(
    Map<String, dynamic> json) {
  return _StudentDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$StudentDashboardModel {
  StudentInfo get student => throw _privateConstructorUsedError;
  List<SubjectAttendanceInfo> get subjects =>
      throw _privateConstructorUsedError;
  DashboardOverview get overview => throw _privateConstructorUsedError;
  List<TodayClassInfo> get todayClasses => throw _privateConstructorUsedError;

  /// Serializes this StudentDashboardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentDashboardModelCopyWith<StudentDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentDashboardModelCopyWith<$Res> {
  factory $StudentDashboardModelCopyWith(StudentDashboardModel value,
          $Res Function(StudentDashboardModel) then) =
      _$StudentDashboardModelCopyWithImpl<$Res, StudentDashboardModel>;
  @useResult
  $Res call(
      {StudentInfo student,
      List<SubjectAttendanceInfo> subjects,
      DashboardOverview overview,
      List<TodayClassInfo> todayClasses});

  $StudentInfoCopyWith<$Res> get student;
  $DashboardOverviewCopyWith<$Res> get overview;
}

/// @nodoc
class _$StudentDashboardModelCopyWithImpl<$Res,
        $Val extends StudentDashboardModel>
    implements $StudentDashboardModelCopyWith<$Res> {
  _$StudentDashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? student = null,
    Object? subjects = null,
    Object? overview = null,
    Object? todayClasses = null,
  }) {
    return _then(_value.copyWith(
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as StudentInfo,
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectAttendanceInfo>,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as DashboardOverview,
      todayClasses: null == todayClasses
          ? _value.todayClasses
          : todayClasses // ignore: cast_nullable_to_non_nullable
              as List<TodayClassInfo>,
    ) as $Val);
  }

  /// Create a copy of StudentDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StudentInfoCopyWith<$Res> get student {
    return $StudentInfoCopyWith<$Res>(_value.student, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }

  /// Create a copy of StudentDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardOverviewCopyWith<$Res> get overview {
    return $DashboardOverviewCopyWith<$Res>(_value.overview, (value) {
      return _then(_value.copyWith(overview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StudentDashboardModelImplCopyWith<$Res>
    implements $StudentDashboardModelCopyWith<$Res> {
  factory _$$StudentDashboardModelImplCopyWith(
          _$StudentDashboardModelImpl value,
          $Res Function(_$StudentDashboardModelImpl) then) =
      __$$StudentDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StudentInfo student,
      List<SubjectAttendanceInfo> subjects,
      DashboardOverview overview,
      List<TodayClassInfo> todayClasses});

  @override
  $StudentInfoCopyWith<$Res> get student;
  @override
  $DashboardOverviewCopyWith<$Res> get overview;
}

/// @nodoc
class __$$StudentDashboardModelImplCopyWithImpl<$Res>
    extends _$StudentDashboardModelCopyWithImpl<$Res,
        _$StudentDashboardModelImpl>
    implements _$$StudentDashboardModelImplCopyWith<$Res> {
  __$$StudentDashboardModelImplCopyWithImpl(_$StudentDashboardModelImpl _value,
      $Res Function(_$StudentDashboardModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? student = null,
    Object? subjects = null,
    Object? overview = null,
    Object? todayClasses = null,
  }) {
    return _then(_$StudentDashboardModelImpl(
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as StudentInfo,
      subjects: null == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectAttendanceInfo>,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as DashboardOverview,
      todayClasses: null == todayClasses
          ? _value._todayClasses
          : todayClasses // ignore: cast_nullable_to_non_nullable
              as List<TodayClassInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentDashboardModelImpl implements _StudentDashboardModel {
  const _$StudentDashboardModelImpl(
      {required this.student,
      final List<SubjectAttendanceInfo> subjects = const [],
      required this.overview,
      final List<TodayClassInfo> todayClasses = const []})
      : _subjects = subjects,
        _todayClasses = todayClasses;

  factory _$StudentDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentDashboardModelImplFromJson(json);

  @override
  final StudentInfo student;
  final List<SubjectAttendanceInfo> _subjects;
  @override
  @JsonKey()
  List<SubjectAttendanceInfo> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @override
  final DashboardOverview overview;
  final List<TodayClassInfo> _todayClasses;
  @override
  @JsonKey()
  List<TodayClassInfo> get todayClasses {
    if (_todayClasses is EqualUnmodifiableListView) return _todayClasses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayClasses);
  }

  @override
  String toString() {
    return 'StudentDashboardModel(student: $student, subjects: $subjects, overview: $overview, todayClasses: $todayClasses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentDashboardModelImpl &&
            (identical(other.student, student) || other.student == student) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            const DeepCollectionEquality()
                .equals(other._todayClasses, _todayClasses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      student,
      const DeepCollectionEquality().hash(_subjects),
      overview,
      const DeepCollectionEquality().hash(_todayClasses));

  /// Create a copy of StudentDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentDashboardModelImplCopyWith<_$StudentDashboardModelImpl>
      get copyWith => __$$StudentDashboardModelImplCopyWithImpl<
          _$StudentDashboardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _StudentDashboardModel implements StudentDashboardModel {
  const factory _StudentDashboardModel(
      {required final StudentInfo student,
      final List<SubjectAttendanceInfo> subjects,
      required final DashboardOverview overview,
      final List<TodayClassInfo> todayClasses}) = _$StudentDashboardModelImpl;

  factory _StudentDashboardModel.fromJson(Map<String, dynamic> json) =
      _$StudentDashboardModelImpl.fromJson;

  @override
  StudentInfo get student;
  @override
  List<SubjectAttendanceInfo> get subjects;
  @override
  DashboardOverview get overview;
  @override
  List<TodayClassInfo> get todayClasses;

  /// Create a copy of StudentDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentDashboardModelImplCopyWith<_$StudentDashboardModelImpl>
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
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  BatchDetailInfo get batch => throw _privateConstructorUsedError;

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
  $Res call(
      {String id,
      String studentId,
      String firstName,
      String lastName,
      String email,
      String? phone,
      BatchDetailInfo batch});

  $BatchDetailInfoCopyWith<$Res> get batch;
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
    Object? email = null,
    Object? phone = freezed,
    Object? batch = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as BatchDetailInfo,
    ) as $Val);
  }

  /// Create a copy of StudentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BatchDetailInfoCopyWith<$Res> get batch {
    return $BatchDetailInfoCopyWith<$Res>(_value.batch, (value) {
      return _then(_value.copyWith(batch: value) as $Val);
    });
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
  $Res call(
      {String id,
      String studentId,
      String firstName,
      String lastName,
      String email,
      String? phone,
      BatchDetailInfo batch});

  @override
  $BatchDetailInfoCopyWith<$Res> get batch;
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
    Object? email = null,
    Object? phone = freezed,
    Object? batch = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as BatchDetailInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentInfoImpl extends _StudentInfo {
  const _$StudentInfoImpl(
      {this.id = '',
      this.studentId = '',
      this.firstName = 'Student',
      this.lastName = '',
      this.email = '',
      this.phone,
      required this.batch})
      : super._();

  factory _$StudentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentInfoImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String studentId;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String email;
  @override
  final String? phone;
  @override
  final BatchDetailInfo batch;

  @override
  String toString() {
    return 'StudentInfo(id: $id, studentId: $studentId, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, batch: $batch)';
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
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.batch, batch) || other.batch == batch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, studentId, firstName, lastName, email, phone, batch);

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
      {final String id,
      final String studentId,
      final String firstName,
      final String lastName,
      final String email,
      final String? phone,
      required final BatchDetailInfo batch}) = _$StudentInfoImpl;
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
  @override
  String get email;
  @override
  String? get phone;
  @override
  BatchDetailInfo get batch;

  /// Create a copy of StudentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentInfoImplCopyWith<_$StudentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BatchDetailInfo _$BatchDetailInfoFromJson(Map<String, dynamic> json) {
  return _BatchDetailInfo.fromJson(json);
}

/// @nodoc
mixin _$BatchDetailInfo {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get academicYear => throw _privateConstructorUsedError;

  /// Serializes this BatchDetailInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BatchDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatchDetailInfoCopyWith<BatchDetailInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchDetailInfoCopyWith<$Res> {
  factory $BatchDetailInfoCopyWith(
          BatchDetailInfo value, $Res Function(BatchDetailInfo) then) =
      _$BatchDetailInfoCopyWithImpl<$Res, BatchDetailInfo>;
  @useResult
  $Res call({String code, String name, String academicYear});
}

/// @nodoc
class _$BatchDetailInfoCopyWithImpl<$Res, $Val extends BatchDetailInfo>
    implements $BatchDetailInfoCopyWith<$Res> {
  _$BatchDetailInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BatchDetailInfo
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
abstract class _$$BatchDetailInfoImplCopyWith<$Res>
    implements $BatchDetailInfoCopyWith<$Res> {
  factory _$$BatchDetailInfoImplCopyWith(_$BatchDetailInfoImpl value,
          $Res Function(_$BatchDetailInfoImpl) then) =
      __$$BatchDetailInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String academicYear});
}

/// @nodoc
class __$$BatchDetailInfoImplCopyWithImpl<$Res>
    extends _$BatchDetailInfoCopyWithImpl<$Res, _$BatchDetailInfoImpl>
    implements _$$BatchDetailInfoImplCopyWith<$Res> {
  __$$BatchDetailInfoImplCopyWithImpl(
      _$BatchDetailInfoImpl _value, $Res Function(_$BatchDetailInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BatchDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? academicYear = null,
  }) {
    return _then(_$BatchDetailInfoImpl(
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
class _$BatchDetailInfoImpl implements _BatchDetailInfo {
  const _$BatchDetailInfoImpl(
      {this.code = '', this.name = 'Unknown Batch', this.academicYear = ''});

  factory _$BatchDetailInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchDetailInfoImplFromJson(json);

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String academicYear;

  @override
  String toString() {
    return 'BatchDetailInfo(code: $code, name: $name, academicYear: $academicYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchDetailInfoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.academicYear, academicYear) ||
                other.academicYear == academicYear));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, academicYear);

  /// Create a copy of BatchDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchDetailInfoImplCopyWith<_$BatchDetailInfoImpl> get copyWith =>
      __$$BatchDetailInfoImplCopyWithImpl<_$BatchDetailInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchDetailInfoImplToJson(
      this,
    );
  }
}

abstract class _BatchDetailInfo implements BatchDetailInfo {
  const factory _BatchDetailInfo(
      {final String code,
      final String name,
      final String academicYear}) = _$BatchDetailInfoImpl;

  factory _BatchDetailInfo.fromJson(Map<String, dynamic> json) =
      _$BatchDetailInfoImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get academicYear;

  /// Create a copy of BatchDetailInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchDetailInfoImplCopyWith<_$BatchDetailInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubjectAttendanceInfo _$SubjectAttendanceInfoFromJson(
    Map<String, dynamic> json) {
  return _SubjectAttendanceInfo.fromJson(json);
}

/// @nodoc
mixin _$SubjectAttendanceInfo {
  String get subjectCode => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;
  String get teacherName => throw _privateConstructorUsedError;
  AttendanceStats get stats => throw _privateConstructorUsedError;

  /// Serializes this SubjectAttendanceInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectAttendanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectAttendanceInfoCopyWith<SubjectAttendanceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectAttendanceInfoCopyWith<$Res> {
  factory $SubjectAttendanceInfoCopyWith(SubjectAttendanceInfo value,
          $Res Function(SubjectAttendanceInfo) then) =
      _$SubjectAttendanceInfoCopyWithImpl<$Res, SubjectAttendanceInfo>;
  @useResult
  $Res call(
      {String subjectCode,
      String subjectName,
      String semester,
      String teacherName,
      AttendanceStats stats});

  $AttendanceStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$SubjectAttendanceInfoCopyWithImpl<$Res,
        $Val extends SubjectAttendanceInfo>
    implements $SubjectAttendanceInfoCopyWith<$Res> {
  _$SubjectAttendanceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectAttendanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectCode = null,
    Object? subjectName = null,
    Object? semester = null,
    Object? teacherName = null,
    Object? stats = null,
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
      teacherName: null == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as AttendanceStats,
    ) as $Val);
  }

  /// Create a copy of SubjectAttendanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendanceStatsCopyWith<$Res> get stats {
    return $AttendanceStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubjectAttendanceInfoImplCopyWith<$Res>
    implements $SubjectAttendanceInfoCopyWith<$Res> {
  factory _$$SubjectAttendanceInfoImplCopyWith(
          _$SubjectAttendanceInfoImpl value,
          $Res Function(_$SubjectAttendanceInfoImpl) then) =
      __$$SubjectAttendanceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String subjectCode,
      String subjectName,
      String semester,
      String teacherName,
      AttendanceStats stats});

  @override
  $AttendanceStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$SubjectAttendanceInfoImplCopyWithImpl<$Res>
    extends _$SubjectAttendanceInfoCopyWithImpl<$Res,
        _$SubjectAttendanceInfoImpl>
    implements _$$SubjectAttendanceInfoImplCopyWith<$Res> {
  __$$SubjectAttendanceInfoImplCopyWithImpl(_$SubjectAttendanceInfoImpl _value,
      $Res Function(_$SubjectAttendanceInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectAttendanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectCode = null,
    Object? subjectName = null,
    Object? semester = null,
    Object? teacherName = null,
    Object? stats = null,
  }) {
    return _then(_$SubjectAttendanceInfoImpl(
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
      teacherName: null == teacherName
          ? _value.teacherName
          : teacherName // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as AttendanceStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectAttendanceInfoImpl implements _SubjectAttendanceInfo {
  const _$SubjectAttendanceInfoImpl(
      {this.subjectCode = '',
      this.subjectName = 'Unknown Subject',
      this.semester = '',
      this.teacherName = 'Unknown Teacher',
      required this.stats});

  factory _$SubjectAttendanceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectAttendanceInfoImplFromJson(json);

  @override
  @JsonKey()
  final String subjectCode;
  @override
  @JsonKey()
  final String subjectName;
  @override
  @JsonKey()
  final String semester;
  @override
  @JsonKey()
  final String teacherName;
  @override
  final AttendanceStats stats;

  @override
  String toString() {
    return 'SubjectAttendanceInfo(subjectCode: $subjectCode, subjectName: $subjectName, semester: $semester, teacherName: $teacherName, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectAttendanceInfoImpl &&
            (identical(other.subjectCode, subjectCode) ||
                other.subjectCode == subjectCode) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.teacherName, teacherName) ||
                other.teacherName == teacherName) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, subjectCode, subjectName, semester, teacherName, stats);

  /// Create a copy of SubjectAttendanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectAttendanceInfoImplCopyWith<_$SubjectAttendanceInfoImpl>
      get copyWith => __$$SubjectAttendanceInfoImplCopyWithImpl<
          _$SubjectAttendanceInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectAttendanceInfoImplToJson(
      this,
    );
  }
}

abstract class _SubjectAttendanceInfo implements SubjectAttendanceInfo {
  const factory _SubjectAttendanceInfo(
      {final String subjectCode,
      final String subjectName,
      final String semester,
      final String teacherName,
      required final AttendanceStats stats}) = _$SubjectAttendanceInfoImpl;

  factory _SubjectAttendanceInfo.fromJson(Map<String, dynamic> json) =
      _$SubjectAttendanceInfoImpl.fromJson;

  @override
  String get subjectCode;
  @override
  String get subjectName;
  @override
  String get semester;
  @override
  String get teacherName;
  @override
  AttendanceStats get stats;

  /// Create a copy of SubjectAttendanceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectAttendanceInfoImplCopyWith<_$SubjectAttendanceInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AttendanceStats _$AttendanceStatsFromJson(Map<String, dynamic> json) {
  return _AttendanceStats.fromJson(json);
}

/// @nodoc
mixin _$AttendanceStats {
  int get totalSessions => throw _privateConstructorUsedError;
  int get present => throw _privateConstructorUsedError;
  int get absent => throw _privateConstructorUsedError;
  int get late => throw _privateConstructorUsedError;
  int get excused => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this AttendanceStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceStatsCopyWith<AttendanceStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceStatsCopyWith<$Res> {
  factory $AttendanceStatsCopyWith(
          AttendanceStats value, $Res Function(AttendanceStats) then) =
      _$AttendanceStatsCopyWithImpl<$Res, AttendanceStats>;
  @useResult
  $Res call(
      {int totalSessions,
      int present,
      int absent,
      int late,
      int excused,
      double percentage,
      String status});
}

/// @nodoc
class _$AttendanceStatsCopyWithImpl<$Res, $Val extends AttendanceStats>
    implements $AttendanceStatsCopyWith<$Res> {
  _$AttendanceStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceStats
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceStatsImplCopyWith<$Res>
    implements $AttendanceStatsCopyWith<$Res> {
  factory _$$AttendanceStatsImplCopyWith(_$AttendanceStatsImpl value,
          $Res Function(_$AttendanceStatsImpl) then) =
      __$$AttendanceStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalSessions,
      int present,
      int absent,
      int late,
      int excused,
      double percentage,
      String status});
}

/// @nodoc
class __$$AttendanceStatsImplCopyWithImpl<$Res>
    extends _$AttendanceStatsCopyWithImpl<$Res, _$AttendanceStatsImpl>
    implements _$$AttendanceStatsImplCopyWith<$Res> {
  __$$AttendanceStatsImplCopyWithImpl(
      _$AttendanceStatsImpl _value, $Res Function(_$AttendanceStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceStats
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
  }) {
    return _then(_$AttendanceStatsImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceStatsImpl extends _AttendanceStats {
  const _$AttendanceStatsImpl(
      {this.totalSessions = 0,
      this.present = 0,
      this.absent = 0,
      this.late = 0,
      this.excused = 0,
      this.percentage = 0.0,
      this.status = 'GOOD'})
      : super._();

  factory _$AttendanceStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalSessions;
  @override
  @JsonKey()
  final int present;
  @override
  @JsonKey()
  final int absent;
  @override
  @JsonKey()
  final int late;
  @override
  @JsonKey()
  final int excused;
  @override
  @JsonKey()
  final double percentage;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'AttendanceStats(totalSessions: $totalSessions, present: $present, absent: $absent, late: $late, excused: $excused, percentage: $percentage, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceStatsImpl &&
            (identical(other.totalSessions, totalSessions) ||
                other.totalSessions == totalSessions) &&
            (identical(other.present, present) || other.present == present) &&
            (identical(other.absent, absent) || other.absent == absent) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.excused, excused) || other.excused == excused) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalSessions, present, absent,
      late, excused, percentage, status);

  /// Create a copy of AttendanceStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceStatsImplCopyWith<_$AttendanceStatsImpl> get copyWith =>
      __$$AttendanceStatsImplCopyWithImpl<_$AttendanceStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceStatsImplToJson(
      this,
    );
  }
}

abstract class _AttendanceStats extends AttendanceStats {
  const factory _AttendanceStats(
      {final int totalSessions,
      final int present,
      final int absent,
      final int late,
      final int excused,
      final double percentage,
      final String status}) = _$AttendanceStatsImpl;
  const _AttendanceStats._() : super._();

  factory _AttendanceStats.fromJson(Map<String, dynamic> json) =
      _$AttendanceStatsImpl.fromJson;

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

  /// Create a copy of AttendanceStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceStatsImplCopyWith<_$AttendanceStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardOverview _$DashboardOverviewFromJson(Map<String, dynamic> json) {
  return _DashboardOverview.fromJson(json);
}

/// @nodoc
mixin _$DashboardOverview {
  int get totalSubjects => throw _privateConstructorUsedError;
  double get overallAttendance => throw _privateConstructorUsedError;
  int get totalSessions => throw _privateConstructorUsedError;
  int get classesAttended => throw _privateConstructorUsedError;
  int get lowAttendanceCount => throw _privateConstructorUsedError;

  /// Serializes this DashboardOverview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardOverviewCopyWith<DashboardOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardOverviewCopyWith<$Res> {
  factory $DashboardOverviewCopyWith(
          DashboardOverview value, $Res Function(DashboardOverview) then) =
      _$DashboardOverviewCopyWithImpl<$Res, DashboardOverview>;
  @useResult
  $Res call(
      {int totalSubjects,
      double overallAttendance,
      int totalSessions,
      int classesAttended,
      int lowAttendanceCount});
}

/// @nodoc
class _$DashboardOverviewCopyWithImpl<$Res, $Val extends DashboardOverview>
    implements $DashboardOverviewCopyWith<$Res> {
  _$DashboardOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSubjects = null,
    Object? overallAttendance = null,
    Object? totalSessions = null,
    Object? classesAttended = null,
    Object? lowAttendanceCount = null,
  }) {
    return _then(_value.copyWith(
      totalSubjects: null == totalSubjects
          ? _value.totalSubjects
          : totalSubjects // ignore: cast_nullable_to_non_nullable
              as int,
      overallAttendance: null == overallAttendance
          ? _value.overallAttendance
          : overallAttendance // ignore: cast_nullable_to_non_nullable
              as double,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      classesAttended: null == classesAttended
          ? _value.classesAttended
          : classesAttended // ignore: cast_nullable_to_non_nullable
              as int,
      lowAttendanceCount: null == lowAttendanceCount
          ? _value.lowAttendanceCount
          : lowAttendanceCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardOverviewImplCopyWith<$Res>
    implements $DashboardOverviewCopyWith<$Res> {
  factory _$$DashboardOverviewImplCopyWith(_$DashboardOverviewImpl value,
          $Res Function(_$DashboardOverviewImpl) then) =
      __$$DashboardOverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalSubjects,
      double overallAttendance,
      int totalSessions,
      int classesAttended,
      int lowAttendanceCount});
}

/// @nodoc
class __$$DashboardOverviewImplCopyWithImpl<$Res>
    extends _$DashboardOverviewCopyWithImpl<$Res, _$DashboardOverviewImpl>
    implements _$$DashboardOverviewImplCopyWith<$Res> {
  __$$DashboardOverviewImplCopyWithImpl(_$DashboardOverviewImpl _value,
      $Res Function(_$DashboardOverviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSubjects = null,
    Object? overallAttendance = null,
    Object? totalSessions = null,
    Object? classesAttended = null,
    Object? lowAttendanceCount = null,
  }) {
    return _then(_$DashboardOverviewImpl(
      totalSubjects: null == totalSubjects
          ? _value.totalSubjects
          : totalSubjects // ignore: cast_nullable_to_non_nullable
              as int,
      overallAttendance: null == overallAttendance
          ? _value.overallAttendance
          : overallAttendance // ignore: cast_nullable_to_non_nullable
              as double,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      classesAttended: null == classesAttended
          ? _value.classesAttended
          : classesAttended // ignore: cast_nullable_to_non_nullable
              as int,
      lowAttendanceCount: null == lowAttendanceCount
          ? _value.lowAttendanceCount
          : lowAttendanceCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardOverviewImpl implements _DashboardOverview {
  const _$DashboardOverviewImpl(
      {this.totalSubjects = 0,
      this.overallAttendance = 0.0,
      this.totalSessions = 0,
      this.classesAttended = 0,
      this.lowAttendanceCount = 0});

  factory _$DashboardOverviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardOverviewImplFromJson(json);

  @override
  @JsonKey()
  final int totalSubjects;
  @override
  @JsonKey()
  final double overallAttendance;
  @override
  @JsonKey()
  final int totalSessions;
  @override
  @JsonKey()
  final int classesAttended;
  @override
  @JsonKey()
  final int lowAttendanceCount;

  @override
  String toString() {
    return 'DashboardOverview(totalSubjects: $totalSubjects, overallAttendance: $overallAttendance, totalSessions: $totalSessions, classesAttended: $classesAttended, lowAttendanceCount: $lowAttendanceCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardOverviewImpl &&
            (identical(other.totalSubjects, totalSubjects) ||
                other.totalSubjects == totalSubjects) &&
            (identical(other.overallAttendance, overallAttendance) ||
                other.overallAttendance == overallAttendance) &&
            (identical(other.totalSessions, totalSessions) ||
                other.totalSessions == totalSessions) &&
            (identical(other.classesAttended, classesAttended) ||
                other.classesAttended == classesAttended) &&
            (identical(other.lowAttendanceCount, lowAttendanceCount) ||
                other.lowAttendanceCount == lowAttendanceCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalSubjects, overallAttendance,
      totalSessions, classesAttended, lowAttendanceCount);

  /// Create a copy of DashboardOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardOverviewImplCopyWith<_$DashboardOverviewImpl> get copyWith =>
      __$$DashboardOverviewImplCopyWithImpl<_$DashboardOverviewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardOverviewImplToJson(
      this,
    );
  }
}

abstract class _DashboardOverview implements DashboardOverview {
  const factory _DashboardOverview(
      {final int totalSubjects,
      final double overallAttendance,
      final int totalSessions,
      final int classesAttended,
      final int lowAttendanceCount}) = _$DashboardOverviewImpl;

  factory _DashboardOverview.fromJson(Map<String, dynamic> json) =
      _$DashboardOverviewImpl.fromJson;

  @override
  int get totalSubjects;
  @override
  double get overallAttendance;
  @override
  int get totalSessions;
  @override
  int get classesAttended;
  @override
  int get lowAttendanceCount;

  /// Create a copy of DashboardOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardOverviewImplCopyWith<_$DashboardOverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodayClassInfo _$TodayClassInfoFromJson(Map<String, dynamic> json) {
  return _TodayClassInfo.fromJson(json);
}

/// @nodoc
mixin _$TodayClassInfo {
  String get id => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String? get room => throw _privateConstructorUsedError;
  TodayClassSubjectEnrollment get subjectEnrollment =>
      throw _privateConstructorUsedError;

  /// Serializes this TodayClassInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayClassInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayClassInfoCopyWith<TodayClassInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayClassInfoCopyWith<$Res> {
  factory $TodayClassInfoCopyWith(
          TodayClassInfo value, $Res Function(TodayClassInfo) then) =
      _$TodayClassInfoCopyWithImpl<$Res, TodayClassInfo>;
  @useResult
  $Res call(
      {String id,
      String startTime,
      String endTime,
      String? room,
      TodayClassSubjectEnrollment subjectEnrollment});

  $TodayClassSubjectEnrollmentCopyWith<$Res> get subjectEnrollment;
}

/// @nodoc
class _$TodayClassInfoCopyWithImpl<$Res, $Val extends TodayClassInfo>
    implements $TodayClassInfoCopyWith<$Res> {
  _$TodayClassInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayClassInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
              as TodayClassSubjectEnrollment,
    ) as $Val);
  }

  /// Create a copy of TodayClassInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodayClassSubjectEnrollmentCopyWith<$Res> get subjectEnrollment {
    return $TodayClassSubjectEnrollmentCopyWith<$Res>(_value.subjectEnrollment,
        (value) {
      return _then(_value.copyWith(subjectEnrollment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodayClassInfoImplCopyWith<$Res>
    implements $TodayClassInfoCopyWith<$Res> {
  factory _$$TodayClassInfoImplCopyWith(_$TodayClassInfoImpl value,
          $Res Function(_$TodayClassInfoImpl) then) =
      __$$TodayClassInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String startTime,
      String endTime,
      String? room,
      TodayClassSubjectEnrollment subjectEnrollment});

  @override
  $TodayClassSubjectEnrollmentCopyWith<$Res> get subjectEnrollment;
}

/// @nodoc
class __$$TodayClassInfoImplCopyWithImpl<$Res>
    extends _$TodayClassInfoCopyWithImpl<$Res, _$TodayClassInfoImpl>
    implements _$$TodayClassInfoImplCopyWith<$Res> {
  __$$TodayClassInfoImplCopyWithImpl(
      _$TodayClassInfoImpl _value, $Res Function(_$TodayClassInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayClassInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? room = freezed,
    Object? subjectEnrollment = null,
  }) {
    return _then(_$TodayClassInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as TodayClassSubjectEnrollment,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayClassInfoImpl extends _TodayClassInfo {
  const _$TodayClassInfoImpl(
      {this.id = '',
      this.startTime = '',
      this.endTime = '',
      this.room,
      required this.subjectEnrollment})
      : super._();

  factory _$TodayClassInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayClassInfoImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String startTime;
  @override
  @JsonKey()
  final String endTime;
  @override
  final String? room;
  @override
  final TodayClassSubjectEnrollment subjectEnrollment;

  @override
  String toString() {
    return 'TodayClassInfo(id: $id, startTime: $startTime, endTime: $endTime, room: $room, subjectEnrollment: $subjectEnrollment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayClassInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.subjectEnrollment, subjectEnrollment) ||
                other.subjectEnrollment == subjectEnrollment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, startTime, endTime, room, subjectEnrollment);

  /// Create a copy of TodayClassInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayClassInfoImplCopyWith<_$TodayClassInfoImpl> get copyWith =>
      __$$TodayClassInfoImplCopyWithImpl<_$TodayClassInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayClassInfoImplToJson(
      this,
    );
  }
}

abstract class _TodayClassInfo extends TodayClassInfo {
  const factory _TodayClassInfo(
          {final String id,
          final String startTime,
          final String endTime,
          final String? room,
          required final TodayClassSubjectEnrollment subjectEnrollment}) =
      _$TodayClassInfoImpl;
  const _TodayClassInfo._() : super._();

  factory _TodayClassInfo.fromJson(Map<String, dynamic> json) =
      _$TodayClassInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get startTime;
  @override
  String get endTime;
  @override
  String? get room;
  @override
  TodayClassSubjectEnrollment get subjectEnrollment;

  /// Create a copy of TodayClassInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayClassInfoImplCopyWith<_$TodayClassInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodayClassSubjectEnrollment _$TodayClassSubjectEnrollmentFromJson(
    Map<String, dynamic> json) {
  return _TodayClassSubjectEnrollment.fromJson(json);
}

/// @nodoc
mixin _$TodayClassSubjectEnrollment {
  TodayClassSubject get subject => throw _privateConstructorUsedError;
  TodayClassTeacher get teacher => throw _privateConstructorUsedError;

  /// Serializes this TodayClassSubjectEnrollment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayClassSubjectEnrollment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayClassSubjectEnrollmentCopyWith<TodayClassSubjectEnrollment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayClassSubjectEnrollmentCopyWith<$Res> {
  factory $TodayClassSubjectEnrollmentCopyWith(
          TodayClassSubjectEnrollment value,
          $Res Function(TodayClassSubjectEnrollment) then) =
      _$TodayClassSubjectEnrollmentCopyWithImpl<$Res,
          TodayClassSubjectEnrollment>;
  @useResult
  $Res call({TodayClassSubject subject, TodayClassTeacher teacher});

  $TodayClassSubjectCopyWith<$Res> get subject;
  $TodayClassTeacherCopyWith<$Res> get teacher;
}

/// @nodoc
class _$TodayClassSubjectEnrollmentCopyWithImpl<$Res,
        $Val extends TodayClassSubjectEnrollment>
    implements $TodayClassSubjectEnrollmentCopyWith<$Res> {
  _$TodayClassSubjectEnrollmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayClassSubjectEnrollment
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
              as TodayClassSubject,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as TodayClassTeacher,
    ) as $Val);
  }

  /// Create a copy of TodayClassSubjectEnrollment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodayClassSubjectCopyWith<$Res> get subject {
    return $TodayClassSubjectCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  /// Create a copy of TodayClassSubjectEnrollment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodayClassTeacherCopyWith<$Res> get teacher {
    return $TodayClassTeacherCopyWith<$Res>(_value.teacher, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodayClassSubjectEnrollmentImplCopyWith<$Res>
    implements $TodayClassSubjectEnrollmentCopyWith<$Res> {
  factory _$$TodayClassSubjectEnrollmentImplCopyWith(
          _$TodayClassSubjectEnrollmentImpl value,
          $Res Function(_$TodayClassSubjectEnrollmentImpl) then) =
      __$$TodayClassSubjectEnrollmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TodayClassSubject subject, TodayClassTeacher teacher});

  @override
  $TodayClassSubjectCopyWith<$Res> get subject;
  @override
  $TodayClassTeacherCopyWith<$Res> get teacher;
}

/// @nodoc
class __$$TodayClassSubjectEnrollmentImplCopyWithImpl<$Res>
    extends _$TodayClassSubjectEnrollmentCopyWithImpl<$Res,
        _$TodayClassSubjectEnrollmentImpl>
    implements _$$TodayClassSubjectEnrollmentImplCopyWith<$Res> {
  __$$TodayClassSubjectEnrollmentImplCopyWithImpl(
      _$TodayClassSubjectEnrollmentImpl _value,
      $Res Function(_$TodayClassSubjectEnrollmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayClassSubjectEnrollment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? teacher = null,
  }) {
    return _then(_$TodayClassSubjectEnrollmentImpl(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as TodayClassSubject,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as TodayClassTeacher,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayClassSubjectEnrollmentImpl
    implements _TodayClassSubjectEnrollment {
  const _$TodayClassSubjectEnrollmentImpl(
      {required this.subject, required this.teacher});

  factory _$TodayClassSubjectEnrollmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TodayClassSubjectEnrollmentImplFromJson(json);

  @override
  final TodayClassSubject subject;
  @override
  final TodayClassTeacher teacher;

  @override
  String toString() {
    return 'TodayClassSubjectEnrollment(subject: $subject, teacher: $teacher)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayClassSubjectEnrollmentImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.teacher, teacher) || other.teacher == teacher));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subject, teacher);

  /// Create a copy of TodayClassSubjectEnrollment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayClassSubjectEnrollmentImplCopyWith<_$TodayClassSubjectEnrollmentImpl>
      get copyWith => __$$TodayClassSubjectEnrollmentImplCopyWithImpl<
          _$TodayClassSubjectEnrollmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayClassSubjectEnrollmentImplToJson(
      this,
    );
  }
}

abstract class _TodayClassSubjectEnrollment
    implements TodayClassSubjectEnrollment {
  const factory _TodayClassSubjectEnrollment(
          {required final TodayClassSubject subject,
          required final TodayClassTeacher teacher}) =
      _$TodayClassSubjectEnrollmentImpl;

  factory _TodayClassSubjectEnrollment.fromJson(Map<String, dynamic> json) =
      _$TodayClassSubjectEnrollmentImpl.fromJson;

  @override
  TodayClassSubject get subject;
  @override
  TodayClassTeacher get teacher;

  /// Create a copy of TodayClassSubjectEnrollment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayClassSubjectEnrollmentImplCopyWith<_$TodayClassSubjectEnrollmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TodayClassSubject _$TodayClassSubjectFromJson(Map<String, dynamic> json) {
  return _TodayClassSubject.fromJson(json);
}

/// @nodoc
mixin _$TodayClassSubject {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;

  /// Serializes this TodayClassSubject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayClassSubject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayClassSubjectCopyWith<TodayClassSubject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayClassSubjectCopyWith<$Res> {
  factory $TodayClassSubjectCopyWith(
          TodayClassSubject value, $Res Function(TodayClassSubject) then) =
      _$TodayClassSubjectCopyWithImpl<$Res, TodayClassSubject>;
  @useResult
  $Res call({String code, String name, String semester});
}

/// @nodoc
class _$TodayClassSubjectCopyWithImpl<$Res, $Val extends TodayClassSubject>
    implements $TodayClassSubjectCopyWith<$Res> {
  _$TodayClassSubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayClassSubject
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
abstract class _$$TodayClassSubjectImplCopyWith<$Res>
    implements $TodayClassSubjectCopyWith<$Res> {
  factory _$$TodayClassSubjectImplCopyWith(_$TodayClassSubjectImpl value,
          $Res Function(_$TodayClassSubjectImpl) then) =
      __$$TodayClassSubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, String semester});
}

/// @nodoc
class __$$TodayClassSubjectImplCopyWithImpl<$Res>
    extends _$TodayClassSubjectCopyWithImpl<$Res, _$TodayClassSubjectImpl>
    implements _$$TodayClassSubjectImplCopyWith<$Res> {
  __$$TodayClassSubjectImplCopyWithImpl(_$TodayClassSubjectImpl _value,
      $Res Function(_$TodayClassSubjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayClassSubject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? semester = null,
  }) {
    return _then(_$TodayClassSubjectImpl(
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
class _$TodayClassSubjectImpl implements _TodayClassSubject {
  const _$TodayClassSubjectImpl(
      {this.code = '', this.name = 'Unknown Subject', this.semester = ''});

  factory _$TodayClassSubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayClassSubjectImplFromJson(json);

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String semester;

  @override
  String toString() {
    return 'TodayClassSubject(code: $code, name: $name, semester: $semester)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayClassSubjectImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.semester, semester) ||
                other.semester == semester));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, semester);

  /// Create a copy of TodayClassSubject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayClassSubjectImplCopyWith<_$TodayClassSubjectImpl> get copyWith =>
      __$$TodayClassSubjectImplCopyWithImpl<_$TodayClassSubjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayClassSubjectImplToJson(
      this,
    );
  }
}

abstract class _TodayClassSubject implements TodayClassSubject {
  const factory _TodayClassSubject(
      {final String code,
      final String name,
      final String semester}) = _$TodayClassSubjectImpl;

  factory _TodayClassSubject.fromJson(Map<String, dynamic> json) =
      _$TodayClassSubjectImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get semester;

  /// Create a copy of TodayClassSubject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayClassSubjectImplCopyWith<_$TodayClassSubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodayClassTeacher _$TodayClassTeacherFromJson(Map<String, dynamic> json) {
  return _TodayClassTeacher.fromJson(json);
}

/// @nodoc
mixin _$TodayClassTeacher {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;

  /// Serializes this TodayClassTeacher to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayClassTeacher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayClassTeacherCopyWith<TodayClassTeacher> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayClassTeacherCopyWith<$Res> {
  factory $TodayClassTeacherCopyWith(
          TodayClassTeacher value, $Res Function(TodayClassTeacher) then) =
      _$TodayClassTeacherCopyWithImpl<$Res, TodayClassTeacher>;
  @useResult
  $Res call({String firstName, String lastName});
}

/// @nodoc
class _$TodayClassTeacherCopyWithImpl<$Res, $Val extends TodayClassTeacher>
    implements $TodayClassTeacherCopyWith<$Res> {
  _$TodayClassTeacherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayClassTeacher
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
abstract class _$$TodayClassTeacherImplCopyWith<$Res>
    implements $TodayClassTeacherCopyWith<$Res> {
  factory _$$TodayClassTeacherImplCopyWith(_$TodayClassTeacherImpl value,
          $Res Function(_$TodayClassTeacherImpl) then) =
      __$$TodayClassTeacherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName});
}

/// @nodoc
class __$$TodayClassTeacherImplCopyWithImpl<$Res>
    extends _$TodayClassTeacherCopyWithImpl<$Res, _$TodayClassTeacherImpl>
    implements _$$TodayClassTeacherImplCopyWith<$Res> {
  __$$TodayClassTeacherImplCopyWithImpl(_$TodayClassTeacherImpl _value,
      $Res Function(_$TodayClassTeacherImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayClassTeacher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$TodayClassTeacherImpl(
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
class _$TodayClassTeacherImpl extends _TodayClassTeacher {
  const _$TodayClassTeacherImpl(
      {this.firstName = 'Unknown', this.lastName = 'Teacher'})
      : super._();

  factory _$TodayClassTeacherImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayClassTeacherImplFromJson(json);

  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;

  @override
  String toString() {
    return 'TodayClassTeacher(firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayClassTeacherImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  /// Create a copy of TodayClassTeacher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayClassTeacherImplCopyWith<_$TodayClassTeacherImpl> get copyWith =>
      __$$TodayClassTeacherImplCopyWithImpl<_$TodayClassTeacherImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayClassTeacherImplToJson(
      this,
    );
  }
}

abstract class _TodayClassTeacher extends TodayClassTeacher {
  const factory _TodayClassTeacher(
      {final String firstName,
      final String lastName}) = _$TodayClassTeacherImpl;
  const _TodayClassTeacher._() : super._();

  factory _TodayClassTeacher.fromJson(Map<String, dynamic> json) =
      _$TodayClassTeacherImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;

  /// Create a copy of TodayClassTeacher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayClassTeacherImplCopyWith<_$TodayClassTeacherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
