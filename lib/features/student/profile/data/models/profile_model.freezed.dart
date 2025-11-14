// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentProfileModel _$StudentProfileModelFromJson(Map<String, dynamic> json) {
  return _StudentProfileModel.fromJson(json);
}

/// @nodoc
mixin _$StudentProfileModel {
  String get id => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String get batchId => throw _privateConstructorUsedError;
  BatchInfo get batch => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this StudentProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentProfileModelCopyWith<StudentProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentProfileModelCopyWith<$Res> {
  factory $StudentProfileModelCopyWith(
          StudentProfileModel value, $Res Function(StudentProfileModel) then) =
      _$StudentProfileModelCopyWithImpl<$Res, StudentProfileModel>;
  @useResult
  $Res call(
      {String id,
      String studentId,
      String firstName,
      String lastName,
      String email,
      String? phone,
      String batchId,
      BatchInfo batch,
      DateTime createdAt});

  $BatchInfoCopyWith<$Res> get batch;
}

/// @nodoc
class _$StudentProfileModelCopyWithImpl<$Res, $Val extends StudentProfileModel>
    implements $StudentProfileModelCopyWith<$Res> {
  _$StudentProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentProfileModel
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
    Object? batchId = null,
    Object? batch = null,
    Object? createdAt = null,
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
      batchId: null == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as BatchInfo,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of StudentProfileModel
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
abstract class _$$StudentProfileModelImplCopyWith<$Res>
    implements $StudentProfileModelCopyWith<$Res> {
  factory _$$StudentProfileModelImplCopyWith(_$StudentProfileModelImpl value,
          $Res Function(_$StudentProfileModelImpl) then) =
      __$$StudentProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String studentId,
      String firstName,
      String lastName,
      String email,
      String? phone,
      String batchId,
      BatchInfo batch,
      DateTime createdAt});

  @override
  $BatchInfoCopyWith<$Res> get batch;
}

/// @nodoc
class __$$StudentProfileModelImplCopyWithImpl<$Res>
    extends _$StudentProfileModelCopyWithImpl<$Res, _$StudentProfileModelImpl>
    implements _$$StudentProfileModelImplCopyWith<$Res> {
  __$$StudentProfileModelImplCopyWithImpl(_$StudentProfileModelImpl _value,
      $Res Function(_$StudentProfileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentProfileModel
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
    Object? batchId = null,
    Object? batch = null,
    Object? createdAt = null,
  }) {
    return _then(_$StudentProfileModelImpl(
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
      batchId: null == batchId
          ? _value.batchId
          : batchId // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as BatchInfo,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentProfileModelImpl extends _StudentProfileModel {
  const _$StudentProfileModelImpl(
      {required this.id,
      required this.studentId,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.phone,
      required this.batchId,
      required this.batch,
      required this.createdAt})
      : super._();

  factory _$StudentProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentProfileModelImplFromJson(json);

  @override
  final String id;
  @override
  final String studentId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String batchId;
  @override
  final BatchInfo batch;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'StudentProfileModel(id: $id, studentId: $studentId, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, batchId: $batchId, batch: $batch, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentProfileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, studentId, firstName,
      lastName, email, phone, batchId, batch, createdAt);

  /// Create a copy of StudentProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentProfileModelImplCopyWith<_$StudentProfileModelImpl> get copyWith =>
      __$$StudentProfileModelImplCopyWithImpl<_$StudentProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentProfileModelImplToJson(
      this,
    );
  }
}

abstract class _StudentProfileModel extends StudentProfileModel {
  const factory _StudentProfileModel(
      {required final String id,
      required final String studentId,
      required final String firstName,
      required final String lastName,
      required final String email,
      final String? phone,
      required final String batchId,
      required final BatchInfo batch,
      required final DateTime createdAt}) = _$StudentProfileModelImpl;
  const _StudentProfileModel._() : super._();

  factory _StudentProfileModel.fromJson(Map<String, dynamic> json) =
      _$StudentProfileModelImpl.fromJson;

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
  String get batchId;
  @override
  BatchInfo get batch;
  @override
  DateTime get createdAt;

  /// Create a copy of StudentProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentProfileModelImplCopyWith<_$StudentProfileModelImpl> get copyWith =>
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

UpdateProfileRequest _$UpdateProfileRequestFromJson(Map<String, dynamic> json) {
  return _UpdateProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateProfileRequest {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  /// Serializes this UpdateProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateProfileRequestCopyWith<UpdateProfileRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProfileRequestCopyWith<$Res> {
  factory $UpdateProfileRequestCopyWith(UpdateProfileRequest value,
          $Res Function(UpdateProfileRequest) then) =
      _$UpdateProfileRequestCopyWithImpl<$Res, UpdateProfileRequest>;
  @useResult
  $Res call({String? firstName, String? lastName, String? phone});
}

/// @nodoc
class _$UpdateProfileRequestCopyWithImpl<$Res,
        $Val extends UpdateProfileRequest>
    implements $UpdateProfileRequestCopyWith<$Res> {
  _$UpdateProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateProfileRequestImplCopyWith<$Res>
    implements $UpdateProfileRequestCopyWith<$Res> {
  factory _$$UpdateProfileRequestImplCopyWith(_$UpdateProfileRequestImpl value,
          $Res Function(_$UpdateProfileRequestImpl) then) =
      __$$UpdateProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? firstName, String? lastName, String? phone});
}

/// @nodoc
class __$$UpdateProfileRequestImplCopyWithImpl<$Res>
    extends _$UpdateProfileRequestCopyWithImpl<$Res, _$UpdateProfileRequestImpl>
    implements _$$UpdateProfileRequestImplCopyWith<$Res> {
  __$$UpdateProfileRequestImplCopyWithImpl(_$UpdateProfileRequestImpl _value,
      $Res Function(_$UpdateProfileRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$UpdateProfileRequestImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateProfileRequestImpl implements _UpdateProfileRequest {
  const _$UpdateProfileRequestImpl({this.firstName, this.lastName, this.phone});

  factory _$UpdateProfileRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateProfileRequestImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? phone;

  @override
  String toString() {
    return 'UpdateProfileRequest(firstName: $firstName, lastName: $lastName, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileRequestImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, phone);

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileRequestImplCopyWith<_$UpdateProfileRequestImpl>
      get copyWith =>
          __$$UpdateProfileRequestImplCopyWithImpl<_$UpdateProfileRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateProfileRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateProfileRequest implements UpdateProfileRequest {
  const factory _UpdateProfileRequest(
      {final String? firstName,
      final String? lastName,
      final String? phone}) = _$UpdateProfileRequestImpl;

  factory _UpdateProfileRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateProfileRequestImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get phone;

  /// Create a copy of UpdateProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileRequestImplCopyWith<_$UpdateProfileRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
