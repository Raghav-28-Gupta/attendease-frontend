// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BatchModel _$BatchModelFromJson(Map<String, dynamic> json) {
  return _BatchModel.fromJson(json);
}

/// @nodoc
mixin _$BatchModel {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get academicYear => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get studentCount => throw _privateConstructorUsedError;

  /// Serializes this BatchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatchModelCopyWith<BatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchModelCopyWith<$Res> {
  factory $BatchModelCopyWith(
          BatchModel value, $Res Function(BatchModel) then) =
      _$BatchModelCopyWithImpl<$Res, BatchModel>;
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      String academicYear,
      String? description,
      DateTime createdAt,
      int studentCount});
}

/// @nodoc
class _$BatchModelCopyWithImpl<$Res, $Val extends BatchModel>
    implements $BatchModelCopyWith<$Res> {
  _$BatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? academicYear = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? studentCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      studentCount: null == studentCount
          ? _value.studentCount
          : studentCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchModelImplCopyWith<$Res>
    implements $BatchModelCopyWith<$Res> {
  factory _$$BatchModelImplCopyWith(
          _$BatchModelImpl value, $Res Function(_$BatchModelImpl) then) =
      __$$BatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      String academicYear,
      String? description,
      DateTime createdAt,
      int studentCount});
}

/// @nodoc
class __$$BatchModelImplCopyWithImpl<$Res>
    extends _$BatchModelCopyWithImpl<$Res, _$BatchModelImpl>
    implements _$$BatchModelImplCopyWith<$Res> {
  __$$BatchModelImplCopyWithImpl(
      _$BatchModelImpl _value, $Res Function(_$BatchModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? academicYear = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? studentCount = null,
  }) {
    return _then(_$BatchModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      studentCount: null == studentCount
          ? _value.studentCount
          : studentCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchModelImpl implements _BatchModel {
  const _$BatchModelImpl(
      {required this.id,
      required this.code,
      required this.name,
      required this.academicYear,
      this.description,
      required this.createdAt,
      required this.studentCount});

  factory _$BatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchModelImplFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String academicYear;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final int studentCount;

  @override
  String toString() {
    return 'BatchModel(id: $id, code: $code, name: $name, academicYear: $academicYear, description: $description, createdAt: $createdAt, studentCount: $studentCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.academicYear, academicYear) ||
                other.academicYear == academicYear) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.studentCount, studentCount) ||
                other.studentCount == studentCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, academicYear,
      description, createdAt, studentCount);

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchModelImplCopyWith<_$BatchModelImpl> get copyWith =>
      __$$BatchModelImplCopyWithImpl<_$BatchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchModelImplToJson(
      this,
    );
  }
}

abstract class _BatchModel implements BatchModel {
  const factory _BatchModel(
      {required final String id,
      required final String code,
      required final String name,
      required final String academicYear,
      final String? description,
      required final DateTime createdAt,
      required final int studentCount}) = _$BatchModelImpl;

  factory _BatchModel.fromJson(Map<String, dynamic> json) =
      _$BatchModelImpl.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  String get name;
  @override
  String get academicYear;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  int get studentCount;

  /// Create a copy of BatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchModelImplCopyWith<_$BatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateBatchRequest _$CreateBatchRequestFromJson(Map<String, dynamic> json) {
  return _CreateBatchRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateBatchRequest {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get academicYear => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this CreateBatchRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateBatchRequestCopyWith<CreateBatchRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBatchRequestCopyWith<$Res> {
  factory $CreateBatchRequestCopyWith(
          CreateBatchRequest value, $Res Function(CreateBatchRequest) then) =
      _$CreateBatchRequestCopyWithImpl<$Res, CreateBatchRequest>;
  @useResult
  $Res call(
      {String code, String name, String academicYear, String? description});
}

/// @nodoc
class _$CreateBatchRequestCopyWithImpl<$Res, $Val extends CreateBatchRequest>
    implements $CreateBatchRequestCopyWith<$Res> {
  _$CreateBatchRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? academicYear = null,
    Object? description = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBatchRequestImplCopyWith<$Res>
    implements $CreateBatchRequestCopyWith<$Res> {
  factory _$$CreateBatchRequestImplCopyWith(_$CreateBatchRequestImpl value,
          $Res Function(_$CreateBatchRequestImpl) then) =
      __$$CreateBatchRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String name, String academicYear, String? description});
}

/// @nodoc
class __$$CreateBatchRequestImplCopyWithImpl<$Res>
    extends _$CreateBatchRequestCopyWithImpl<$Res, _$CreateBatchRequestImpl>
    implements _$$CreateBatchRequestImplCopyWith<$Res> {
  __$$CreateBatchRequestImplCopyWithImpl(_$CreateBatchRequestImpl _value,
      $Res Function(_$CreateBatchRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? academicYear = null,
    Object? description = freezed,
  }) {
    return _then(_$CreateBatchRequestImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateBatchRequestImpl implements _CreateBatchRequest {
  const _$CreateBatchRequestImpl(
      {required this.code,
      required this.name,
      required this.academicYear,
      this.description});

  factory _$CreateBatchRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBatchRequestImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String academicYear;
  @override
  final String? description;

  @override
  String toString() {
    return 'CreateBatchRequest(code: $code, name: $name, academicYear: $academicYear, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBatchRequestImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.academicYear, academicYear) ||
                other.academicYear == academicYear) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, name, academicYear, description);

  /// Create a copy of CreateBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBatchRequestImplCopyWith<_$CreateBatchRequestImpl> get copyWith =>
      __$$CreateBatchRequestImplCopyWithImpl<_$CreateBatchRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBatchRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateBatchRequest implements CreateBatchRequest {
  const factory _CreateBatchRequest(
      {required final String code,
      required final String name,
      required final String academicYear,
      final String? description}) = _$CreateBatchRequestImpl;

  factory _CreateBatchRequest.fromJson(Map<String, dynamic> json) =
      _$CreateBatchRequestImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get academicYear;
  @override
  String? get description;

  /// Create a copy of CreateBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBatchRequestImplCopyWith<_$CreateBatchRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateBatchRequest _$UpdateBatchRequestFromJson(Map<String, dynamic> json) {
  return _UpdateBatchRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateBatchRequest {
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get academicYear => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this UpdateBatchRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateBatchRequestCopyWith<UpdateBatchRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateBatchRequestCopyWith<$Res> {
  factory $UpdateBatchRequestCopyWith(
          UpdateBatchRequest value, $Res Function(UpdateBatchRequest) then) =
      _$UpdateBatchRequestCopyWithImpl<$Res, UpdateBatchRequest>;
  @useResult
  $Res call(
      {String? code, String? name, String? academicYear, String? description});
}

/// @nodoc
class _$UpdateBatchRequestCopyWithImpl<$Res, $Val extends UpdateBatchRequest>
    implements $UpdateBatchRequestCopyWith<$Res> {
  _$UpdateBatchRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? academicYear = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      academicYear: freezed == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateBatchRequestImplCopyWith<$Res>
    implements $UpdateBatchRequestCopyWith<$Res> {
  factory _$$UpdateBatchRequestImplCopyWith(_$UpdateBatchRequestImpl value,
          $Res Function(_$UpdateBatchRequestImpl) then) =
      __$$UpdateBatchRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code, String? name, String? academicYear, String? description});
}

/// @nodoc
class __$$UpdateBatchRequestImplCopyWithImpl<$Res>
    extends _$UpdateBatchRequestCopyWithImpl<$Res, _$UpdateBatchRequestImpl>
    implements _$$UpdateBatchRequestImplCopyWith<$Res> {
  __$$UpdateBatchRequestImplCopyWithImpl(_$UpdateBatchRequestImpl _value,
      $Res Function(_$UpdateBatchRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? academicYear = freezed,
    Object? description = freezed,
  }) {
    return _then(_$UpdateBatchRequestImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      academicYear: freezed == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateBatchRequestImpl implements _UpdateBatchRequest {
  const _$UpdateBatchRequestImpl(
      {this.code, this.name, this.academicYear, this.description});

  factory _$UpdateBatchRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateBatchRequestImplFromJson(json);

  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? academicYear;
  @override
  final String? description;

  @override
  String toString() {
    return 'UpdateBatchRequest(code: $code, name: $name, academicYear: $academicYear, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBatchRequestImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.academicYear, academicYear) ||
                other.academicYear == academicYear) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, name, academicYear, description);

  /// Create a copy of UpdateBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBatchRequestImplCopyWith<_$UpdateBatchRequestImpl> get copyWith =>
      __$$UpdateBatchRequestImplCopyWithImpl<_$UpdateBatchRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateBatchRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateBatchRequest implements UpdateBatchRequest {
  const factory _UpdateBatchRequest(
      {final String? code,
      final String? name,
      final String? academicYear,
      final String? description}) = _$UpdateBatchRequestImpl;

  factory _UpdateBatchRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateBatchRequestImpl.fromJson;

  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get academicYear;
  @override
  String? get description;

  /// Create a copy of UpdateBatchRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateBatchRequestImplCopyWith<_$UpdateBatchRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
