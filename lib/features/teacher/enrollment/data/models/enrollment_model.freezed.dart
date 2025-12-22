// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrollment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnrollmentModel _$EnrollmentModelFromJson(Map<String, dynamic> json) {
  return _EnrollmentModel.fromJson(json);
}

/// @nodoc
mixin _$EnrollmentModel {
  String get id => throw _privateConstructorUsedError;
  String get subjectId => throw _privateConstructorUsedError;
  String get batchId => throw _privateConstructorUsedError;
  String get teacherId => throw _privateConstructorUsedError;
  SubjectInfo get subject => throw _privateConstructorUsedError;
  BatchInfo get batch => throw _privateConstructorUsedError;
  TeacherInfo get teacher => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this EnrollmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrollmentModelCopyWith<EnrollmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollmentModelCopyWith<$Res> {
  factory $EnrollmentModelCopyWith(
          EnrollmentModel value, $Res Function(EnrollmentModel) then) =
      _$EnrollmentModelCopyWithImpl<$Res, EnrollmentModel>;
  @useResult
  $Res call(
      {String id,
      String subjectId,
      String batchId,
      String teacherId,
      SubjectInfo subject,
      BatchInfo batch,
      TeacherInfo teacher,
      DateTime createdAt,
      DateTime updatedAt});

  $SubjectInfoCopyWith<$Res> get subject;
  $BatchInfoCopyWith<$Res> get batch;
  $TeacherInfoCopyWith<$Res> get teacher;
}

/// @nodoc
class _$EnrollmentModelCopyWithImpl<$Res, $Val extends EnrollmentModel>
    implements $EnrollmentModelCopyWith<$Res> {
  _$EnrollmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectId = null,
    Object? batchId = null,
    Object? teacherId = null,
    Object? subject = null,
    Object? batch = null,
    Object? teacher = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of EnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectInfoCopyWith<$Res> get subject {
    return $SubjectInfoCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  /// Create a copy of EnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BatchInfoCopyWith<$Res> get batch {
    return $BatchInfoCopyWith<$Res>(_value.batch, (value) {
      return _then(_value.copyWith(batch: value) as $Val);
    });
  }

  /// Create a copy of EnrollmentModel
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
abstract class _$$EnrollmentModelImplCopyWith<$Res>
    implements $EnrollmentModelCopyWith<$Res> {
  factory _$$EnrollmentModelImplCopyWith(_$EnrollmentModelImpl value,
          $Res Function(_$EnrollmentModelImpl) then) =
      __$$EnrollmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String subjectId,
      String batchId,
      String teacherId,
      SubjectInfo subject,
      BatchInfo batch,
      TeacherInfo teacher,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $SubjectInfoCopyWith<$Res> get subject;
  @override
  $BatchInfoCopyWith<$Res> get batch;
  @override
  $TeacherInfoCopyWith<$Res> get teacher;
}

/// @nodoc
class __$$EnrollmentModelImplCopyWithImpl<$Res>
    extends _$EnrollmentModelCopyWithImpl<$Res, _$EnrollmentModelImpl>
    implements _$$EnrollmentModelImplCopyWith<$Res> {
  __$$EnrollmentModelImplCopyWithImpl(
      _$EnrollmentModelImpl _value, $Res Function(_$EnrollmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectId = null,
    Object? batchId = null,
    Object? teacherId = null,
    Object? subject = null,
    Object? batch = null,
    Object? teacher = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$EnrollmentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnrollmentModelImpl implements _EnrollmentModel {
  const _$EnrollmentModelImpl(
      {required this.id,
      required this.subjectId,
      required this.batchId,
      required this.teacherId,
      required this.subject,
      required this.batch,
      required this.teacher,
      required this.createdAt,
      required this.updatedAt});

  factory _$EnrollmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollmentModelImplFromJson(json);

  @override
  final String id;
  @override
  final String subjectId;
  @override
  final String batchId;
  @override
  final String teacherId;
  @override
  final SubjectInfo subject;
  @override
  final BatchInfo batch;
  @override
  final TeacherInfo teacher;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'EnrollmentModel(id: $id, subjectId: $subjectId, batchId: $batchId, teacherId: $teacherId, subject: $subject, batch: $batch, teacher: $teacher, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, subjectId, batchId,
      teacherId, subject, batch, teacher, createdAt, updatedAt);

  /// Create a copy of EnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentModelImplCopyWith<_$EnrollmentModelImpl> get copyWith =>
      __$$EnrollmentModelImplCopyWithImpl<_$EnrollmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrollmentModelImplToJson(
      this,
    );
  }
}

abstract class _EnrollmentModel implements EnrollmentModel {
  const factory _EnrollmentModel(
      {required final String id,
      required final String subjectId,
      required final String batchId,
      required final String teacherId,
      required final SubjectInfo subject,
      required final BatchInfo batch,
      required final TeacherInfo teacher,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$EnrollmentModelImpl;

  factory _EnrollmentModel.fromJson(Map<String, dynamic> json) =
      _$EnrollmentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get subjectId;
  @override
  String get batchId;
  @override
  String get teacherId;
  @override
  SubjectInfo get subject;
  @override
  BatchInfo get batch;
  @override
  TeacherInfo get teacher;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of EnrollmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollmentModelImplCopyWith<_$EnrollmentModelImpl> get copyWith =>
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
  String get department => throw _privateConstructorUsedError;

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
  $Res call({String code, String name, String semester, String department});
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
    Object? department = null,
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
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
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
  $Res call({String code, String name, String semester, String department});
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
    Object? department = null,
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
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectInfoImpl implements _SubjectInfo {
  const _$SubjectInfoImpl(
      {required this.code,
      required this.name,
      required this.semester,
      required this.department});

  factory _$SubjectInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectInfoImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String semester;
  @override
  final String department;

  @override
  String toString() {
    return 'SubjectInfo(code: $code, name: $name, semester: $semester, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectInfoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, name, semester, department);

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
      required final String semester,
      required final String department}) = _$SubjectInfoImpl;

  factory _SubjectInfo.fromJson(Map<String, dynamic> json) =
      _$SubjectInfoImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get semester;
  @override
  String get department;

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
  @JsonKey(name: 'year')
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
  $Res call(
      {String code, String name, @JsonKey(name: 'year') String academicYear});
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
  $Res call(
      {String code, String name, @JsonKey(name: 'year') String academicYear});
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
      {required this.code,
      required this.name,
      @JsonKey(name: 'year') required this.academicYear});

  factory _$BatchInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchInfoImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  @JsonKey(name: 'year')
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
          @JsonKey(name: 'year') required final String academicYear}) =
      _$BatchInfoImpl;

  factory _BatchInfo.fromJson(Map<String, dynamic> json) =
      _$BatchInfoImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(name: 'year')
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
  String get employeeId => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;

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
  $Res call(
      {String firstName,
      String lastName,
      String employeeId,
      String? department});
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
    Object? employeeId = null,
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
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {String firstName,
      String lastName,
      String employeeId,
      String? department});
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
    Object? employeeId = null,
    Object? department = freezed,
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
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
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
class _$TeacherInfoImpl extends _TeacherInfo {
  const _$TeacherInfoImpl(
      {required this.firstName,
      required this.lastName,
      required this.employeeId,
      this.department})
      : super._();

  factory _$TeacherInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherInfoImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String employeeId;
  @override
  final String? department;

  @override
  String toString() {
    return 'TeacherInfo(firstName: $firstName, lastName: $lastName, employeeId: $employeeId, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherInfoImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, employeeId, department);

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
      required final String lastName,
      required final String employeeId,
      final String? department}) = _$TeacherInfoImpl;
  const _TeacherInfo._() : super._();

  factory _TeacherInfo.fromJson(Map<String, dynamic> json) =
      _$TeacherInfoImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get employeeId;
  @override
  String? get department;

  /// Create a copy of TeacherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherInfoImplCopyWith<_$TeacherInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnrollBatchesRequest _$EnrollBatchesRequestFromJson(Map<String, dynamic> json) {
  return _EnrollBatchesRequest.fromJson(json);
}

/// @nodoc
mixin _$EnrollBatchesRequest {
  String get subjectId => throw _privateConstructorUsedError;
  List<String> get batchIds =>
      throw _privateConstructorUsedError; // ✅ ARRAY, not single batchId
  String? get semester => throw _privateConstructorUsedError;

  /// Serializes this EnrollBatchesRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnrollBatchesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrollBatchesRequestCopyWith<EnrollBatchesRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollBatchesRequestCopyWith<$Res> {
  factory $EnrollBatchesRequestCopyWith(EnrollBatchesRequest value,
          $Res Function(EnrollBatchesRequest) then) =
      _$EnrollBatchesRequestCopyWithImpl<$Res, EnrollBatchesRequest>;
  @useResult
  $Res call({String subjectId, List<String> batchIds, String? semester});
}

/// @nodoc
class _$EnrollBatchesRequestCopyWithImpl<$Res,
        $Val extends EnrollBatchesRequest>
    implements $EnrollBatchesRequestCopyWith<$Res> {
  _$EnrollBatchesRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnrollBatchesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
    Object? batchIds = null,
    Object? semester = freezed,
  }) {
    return _then(_value.copyWith(
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      batchIds: null == batchIds
          ? _value.batchIds
          : batchIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      semester: freezed == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnrollBatchesRequestImplCopyWith<$Res>
    implements $EnrollBatchesRequestCopyWith<$Res> {
  factory _$$EnrollBatchesRequestImplCopyWith(_$EnrollBatchesRequestImpl value,
          $Res Function(_$EnrollBatchesRequestImpl) then) =
      __$$EnrollBatchesRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String subjectId, List<String> batchIds, String? semester});
}

/// @nodoc
class __$$EnrollBatchesRequestImplCopyWithImpl<$Res>
    extends _$EnrollBatchesRequestCopyWithImpl<$Res, _$EnrollBatchesRequestImpl>
    implements _$$EnrollBatchesRequestImplCopyWith<$Res> {
  __$$EnrollBatchesRequestImplCopyWithImpl(_$EnrollBatchesRequestImpl _value,
      $Res Function(_$EnrollBatchesRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnrollBatchesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
    Object? batchIds = null,
    Object? semester = freezed,
  }) {
    return _then(_$EnrollBatchesRequestImpl(
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      batchIds: null == batchIds
          ? _value._batchIds
          : batchIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      semester: freezed == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnrollBatchesRequestImpl implements _EnrollBatchesRequest {
  const _$EnrollBatchesRequestImpl(
      {required this.subjectId,
      required final List<String> batchIds,
      this.semester})
      : _batchIds = batchIds;

  factory _$EnrollBatchesRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollBatchesRequestImplFromJson(json);

  @override
  final String subjectId;
  final List<String> _batchIds;
  @override
  List<String> get batchIds {
    if (_batchIds is EqualUnmodifiableListView) return _batchIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_batchIds);
  }

// ✅ ARRAY, not single batchId
  @override
  final String? semester;

  @override
  String toString() {
    return 'EnrollBatchesRequest(subjectId: $subjectId, batchIds: $batchIds, semester: $semester)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollBatchesRequestImpl &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            const DeepCollectionEquality().equals(other._batchIds, _batchIds) &&
            (identical(other.semester, semester) ||
                other.semester == semester));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subjectId,
      const DeepCollectionEquality().hash(_batchIds), semester);

  /// Create a copy of EnrollBatchesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollBatchesRequestImplCopyWith<_$EnrollBatchesRequestImpl>
      get copyWith =>
          __$$EnrollBatchesRequestImplCopyWithImpl<_$EnrollBatchesRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrollBatchesRequestImplToJson(
      this,
    );
  }
}

abstract class _EnrollBatchesRequest implements EnrollBatchesRequest {
  const factory _EnrollBatchesRequest(
      {required final String subjectId,
      required final List<String> batchIds,
      final String? semester}) = _$EnrollBatchesRequestImpl;

  factory _EnrollBatchesRequest.fromJson(Map<String, dynamic> json) =
      _$EnrollBatchesRequestImpl.fromJson;

  @override
  String get subjectId;
  @override
  List<String> get batchIds; // ✅ ARRAY, not single batchId
  @override
  String? get semester;

  /// Create a copy of EnrollBatchesRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollBatchesRequestImplCopyWith<_$EnrollBatchesRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EnrollBatchesResponse _$EnrollBatchesResponseFromJson(
    Map<String, dynamic> json) {
  return _EnrollBatchesResponse.fromJson(json);
}

/// @nodoc
mixin _$EnrollBatchesResponse {
  String get message => throw _privateConstructorUsedError;
  List<EnrollmentModel> get enrollments => throw _privateConstructorUsedError;

  /// Serializes this EnrollBatchesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnrollBatchesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrollBatchesResponseCopyWith<EnrollBatchesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollBatchesResponseCopyWith<$Res> {
  factory $EnrollBatchesResponseCopyWith(EnrollBatchesResponse value,
          $Res Function(EnrollBatchesResponse) then) =
      _$EnrollBatchesResponseCopyWithImpl<$Res, EnrollBatchesResponse>;
  @useResult
  $Res call({String message, List<EnrollmentModel> enrollments});
}

/// @nodoc
class _$EnrollBatchesResponseCopyWithImpl<$Res,
        $Val extends EnrollBatchesResponse>
    implements $EnrollBatchesResponseCopyWith<$Res> {
  _$EnrollBatchesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnrollBatchesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? enrollments = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      enrollments: null == enrollments
          ? _value.enrollments
          : enrollments // ignore: cast_nullable_to_non_nullable
              as List<EnrollmentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnrollBatchesResponseImplCopyWith<$Res>
    implements $EnrollBatchesResponseCopyWith<$Res> {
  factory _$$EnrollBatchesResponseImplCopyWith(
          _$EnrollBatchesResponseImpl value,
          $Res Function(_$EnrollBatchesResponseImpl) then) =
      __$$EnrollBatchesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<EnrollmentModel> enrollments});
}

/// @nodoc
class __$$EnrollBatchesResponseImplCopyWithImpl<$Res>
    extends _$EnrollBatchesResponseCopyWithImpl<$Res,
        _$EnrollBatchesResponseImpl>
    implements _$$EnrollBatchesResponseImplCopyWith<$Res> {
  __$$EnrollBatchesResponseImplCopyWithImpl(_$EnrollBatchesResponseImpl _value,
      $Res Function(_$EnrollBatchesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnrollBatchesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? enrollments = null,
  }) {
    return _then(_$EnrollBatchesResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      enrollments: null == enrollments
          ? _value._enrollments
          : enrollments // ignore: cast_nullable_to_non_nullable
              as List<EnrollmentModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnrollBatchesResponseImpl implements _EnrollBatchesResponse {
  const _$EnrollBatchesResponseImpl(
      {required this.message, required final List<EnrollmentModel> enrollments})
      : _enrollments = enrollments;

  factory _$EnrollBatchesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollBatchesResponseImplFromJson(json);

  @override
  final String message;
  final List<EnrollmentModel> _enrollments;
  @override
  List<EnrollmentModel> get enrollments {
    if (_enrollments is EqualUnmodifiableListView) return _enrollments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enrollments);
  }

  @override
  String toString() {
    return 'EnrollBatchesResponse(message: $message, enrollments: $enrollments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollBatchesResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._enrollments, _enrollments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_enrollments));

  /// Create a copy of EnrollBatchesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollBatchesResponseImplCopyWith<_$EnrollBatchesResponseImpl>
      get copyWith => __$$EnrollBatchesResponseImplCopyWithImpl<
          _$EnrollBatchesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrollBatchesResponseImplToJson(
      this,
    );
  }
}

abstract class _EnrollBatchesResponse implements EnrollBatchesResponse {
  const factory _EnrollBatchesResponse(
          {required final String message,
          required final List<EnrollmentModel> enrollments}) =
      _$EnrollBatchesResponseImpl;

  factory _EnrollBatchesResponse.fromJson(Map<String, dynamic> json) =
      _$EnrollBatchesResponseImpl.fromJson;

  @override
  String get message;
  @override
  List<EnrollmentModel> get enrollments;

  /// Create a copy of EnrollBatchesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrollBatchesResponseImplCopyWith<_$EnrollBatchesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateEnrollmentRequest _$CreateEnrollmentRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateEnrollmentRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateEnrollmentRequest {
  String get subjectId => throw _privateConstructorUsedError;
  String get batchId => throw _privateConstructorUsedError;
  String get teacherId => throw _privateConstructorUsedError;

  /// Serializes this CreateEnrollmentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateEnrollmentRequestCopyWith<CreateEnrollmentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEnrollmentRequestCopyWith<$Res> {
  factory $CreateEnrollmentRequestCopyWith(CreateEnrollmentRequest value,
          $Res Function(CreateEnrollmentRequest) then) =
      _$CreateEnrollmentRequestCopyWithImpl<$Res, CreateEnrollmentRequest>;
  @useResult
  $Res call({String subjectId, String batchId, String teacherId});
}

/// @nodoc
class _$CreateEnrollmentRequestCopyWithImpl<$Res,
        $Val extends CreateEnrollmentRequest>
    implements $CreateEnrollmentRequestCopyWith<$Res> {
  _$CreateEnrollmentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
    Object? batchId = null,
    Object? teacherId = null,
  }) {
    return _then(_value.copyWith(
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateEnrollmentRequestImplCopyWith<$Res>
    implements $CreateEnrollmentRequestCopyWith<$Res> {
  factory _$$CreateEnrollmentRequestImplCopyWith(
          _$CreateEnrollmentRequestImpl value,
          $Res Function(_$CreateEnrollmentRequestImpl) then) =
      __$$CreateEnrollmentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String subjectId, String batchId, String teacherId});
}

/// @nodoc
class __$$CreateEnrollmentRequestImplCopyWithImpl<$Res>
    extends _$CreateEnrollmentRequestCopyWithImpl<$Res,
        _$CreateEnrollmentRequestImpl>
    implements _$$CreateEnrollmentRequestImplCopyWith<$Res> {
  __$$CreateEnrollmentRequestImplCopyWithImpl(
      _$CreateEnrollmentRequestImpl _value,
      $Res Function(_$CreateEnrollmentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectId = null,
    Object? batchId = null,
    Object? teacherId = null,
  }) {
    return _then(_$CreateEnrollmentRequestImpl(
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      batchId: null == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateEnrollmentRequestImpl implements _CreateEnrollmentRequest {
  const _$CreateEnrollmentRequestImpl(
      {required this.subjectId,
      required this.batchId,
      required this.teacherId});

  factory _$CreateEnrollmentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateEnrollmentRequestImplFromJson(json);

  @override
  final String subjectId;
  @override
  final String batchId;
  @override
  final String teacherId;

  @override
  String toString() {
    return 'CreateEnrollmentRequest(subjectId: $subjectId, batchId: $batchId, teacherId: $teacherId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEnrollmentRequestImpl &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subjectId, batchId, teacherId);

  /// Create a copy of CreateEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEnrollmentRequestImplCopyWith<_$CreateEnrollmentRequestImpl>
      get copyWith => __$$CreateEnrollmentRequestImplCopyWithImpl<
          _$CreateEnrollmentRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateEnrollmentRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateEnrollmentRequest implements CreateEnrollmentRequest {
  const factory _CreateEnrollmentRequest(
      {required final String subjectId,
      required final String batchId,
      required final String teacherId}) = _$CreateEnrollmentRequestImpl;

  factory _CreateEnrollmentRequest.fromJson(Map<String, dynamic> json) =
      _$CreateEnrollmentRequestImpl.fromJson;

  @override
  String get subjectId;
  @override
  String get batchId;
  @override
  String get teacherId;

  /// Create a copy of CreateEnrollmentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateEnrollmentRequestImplCopyWith<_$CreateEnrollmentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
