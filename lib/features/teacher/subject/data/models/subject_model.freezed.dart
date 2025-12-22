// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) {
  return _SubjectModel.fromJson(json);
}

/// @nodoc
mixin _$SubjectModel {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'credits')
  double get credits => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SubjectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectModelCopyWith<SubjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectModelCopyWith<$Res> {
  factory $SubjectModelCopyWith(
          SubjectModel value, $Res Function(SubjectModel) then) =
      _$SubjectModelCopyWithImpl<$Res, SubjectModel>;
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      @JsonKey(name: 'credits') double credits,
      String department,
      String semester,
      String? description,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SubjectModelCopyWithImpl<$Res, $Val extends SubjectModel>
    implements $SubjectModelCopyWith<$Res> {
  _$SubjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? credits = null,
    Object? department = null,
    Object? semester = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

/// @nodoc
abstract class _$$SubjectModelImplCopyWith<$Res>
    implements $SubjectModelCopyWith<$Res> {
  factory _$$SubjectModelImplCopyWith(
          _$SubjectModelImpl value, $Res Function(_$SubjectModelImpl) then) =
      __$$SubjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      @JsonKey(name: 'credits') double credits,
      String department,
      String semester,
      String? description,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$SubjectModelImplCopyWithImpl<$Res>
    extends _$SubjectModelCopyWithImpl<$Res, _$SubjectModelImpl>
    implements _$$SubjectModelImplCopyWith<$Res> {
  __$$SubjectModelImplCopyWithImpl(
      _$SubjectModelImpl _value, $Res Function(_$SubjectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? credits = null,
    Object? department = null,
    Object? semester = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SubjectModelImpl(
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
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$SubjectModelImpl implements _SubjectModel {
  const _$SubjectModelImpl(
      {required this.id,
      required this.code,
      required this.name,
      @JsonKey(name: 'credits') required this.credits,
      required this.department,
      required this.semester,
      this.description,
      required this.createdAt,
      required this.updatedAt});

  factory _$SubjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectModelImplFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  @JsonKey(name: 'credits')
  final double credits;
  @override
  final String department;
  @override
  final String semester;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SubjectModel(id: $id, code: $code, name: $name, credits: $credits, department: $department, semester: $semester, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, credits,
      department, semester, description, createdAt, updatedAt);

  /// Create a copy of SubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectModelImplCopyWith<_$SubjectModelImpl> get copyWith =>
      __$$SubjectModelImplCopyWithImpl<_$SubjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectModelImplToJson(
      this,
    );
  }
}

abstract class _SubjectModel implements SubjectModel {
  const factory _SubjectModel(
      {required final String id,
      required final String code,
      required final String name,
      @JsonKey(name: 'credits') required final double credits,
      required final String department,
      required final String semester,
      final String? description,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SubjectModelImpl;

  factory _SubjectModel.fromJson(Map<String, dynamic> json) =
      _$SubjectModelImpl.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(name: 'credits')
  double get credits;
  @override
  String get department;
  @override
  String get semester;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of SubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectModelImplCopyWith<_$SubjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateSubjectRequest _$CreateSubjectRequestFromJson(Map<String, dynamic> json) {
  return _CreateSubjectRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateSubjectRequest {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'credits')
  double get credits => throw _privateConstructorUsedError; // ✅ ADD THIS
  String get department => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this CreateSubjectRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSubjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSubjectRequestCopyWith<CreateSubjectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSubjectRequestCopyWith<$Res> {
  factory $CreateSubjectRequestCopyWith(CreateSubjectRequest value,
          $Res Function(CreateSubjectRequest) then) =
      _$CreateSubjectRequestCopyWithImpl<$Res, CreateSubjectRequest>;
  @useResult
  $Res call(
      {String code,
      String name,
      @JsonKey(name: 'credits') double credits,
      String department,
      String semester,
      String? description});
}

/// @nodoc
class _$CreateSubjectRequestCopyWithImpl<$Res,
        $Val extends CreateSubjectRequest>
    implements $CreateSubjectRequestCopyWith<$Res> {
  _$CreateSubjectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSubjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? credits = null,
    Object? department = null,
    Object? semester = null,
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
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateSubjectRequestImplCopyWith<$Res>
    implements $CreateSubjectRequestCopyWith<$Res> {
  factory _$$CreateSubjectRequestImplCopyWith(_$CreateSubjectRequestImpl value,
          $Res Function(_$CreateSubjectRequestImpl) then) =
      __$$CreateSubjectRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      @JsonKey(name: 'credits') double credits,
      String department,
      String semester,
      String? description});
}

/// @nodoc
class __$$CreateSubjectRequestImplCopyWithImpl<$Res>
    extends _$CreateSubjectRequestCopyWithImpl<$Res, _$CreateSubjectRequestImpl>
    implements _$$CreateSubjectRequestImplCopyWith<$Res> {
  __$$CreateSubjectRequestImplCopyWithImpl(_$CreateSubjectRequestImpl _value,
      $Res Function(_$CreateSubjectRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateSubjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? credits = null,
    Object? department = null,
    Object? semester = null,
    Object? description = freezed,
  }) {
    return _then(_$CreateSubjectRequestImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
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
class _$CreateSubjectRequestImpl implements _CreateSubjectRequest {
  const _$CreateSubjectRequestImpl(
      {required this.code,
      required this.name,
      @JsonKey(name: 'credits') required this.credits,
      required this.department,
      required this.semester,
      this.description});

  factory _$CreateSubjectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSubjectRequestImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  @JsonKey(name: 'credits')
  final double credits;
// ✅ ADD THIS
  @override
  final String department;
  @override
  final String semester;
  @override
  final String? description;

  @override
  String toString() {
    return 'CreateSubjectRequest(code: $code, name: $name, credits: $credits, department: $department, semester: $semester, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSubjectRequestImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, name, credits, department, semester, description);

  /// Create a copy of CreateSubjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSubjectRequestImplCopyWith<_$CreateSubjectRequestImpl>
      get copyWith =>
          __$$CreateSubjectRequestImplCopyWithImpl<_$CreateSubjectRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSubjectRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateSubjectRequest implements CreateSubjectRequest {
  const factory _CreateSubjectRequest(
      {required final String code,
      required final String name,
      @JsonKey(name: 'credits') required final double credits,
      required final String department,
      required final String semester,
      final String? description}) = _$CreateSubjectRequestImpl;

  factory _CreateSubjectRequest.fromJson(Map<String, dynamic> json) =
      _$CreateSubjectRequestImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(name: 'credits')
  double get credits; // ✅ ADD THIS
  @override
  String get department;
  @override
  String get semester;
  @override
  String? get description;

  /// Create a copy of CreateSubjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSubjectRequestImplCopyWith<_$CreateSubjectRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateSubjectRequest _$UpdateSubjectRequestFromJson(Map<String, dynamic> json) {
  return _UpdateSubjectRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateSubjectRequest {
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'credits')
  double? get credits => throw _privateConstructorUsedError; // ✅ ADD THIS
  String? get department => throw _privateConstructorUsedError;
  String? get semester => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this UpdateSubjectRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateSubjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateSubjectRequestCopyWith<UpdateSubjectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSubjectRequestCopyWith<$Res> {
  factory $UpdateSubjectRequestCopyWith(UpdateSubjectRequest value,
          $Res Function(UpdateSubjectRequest) then) =
      _$UpdateSubjectRequestCopyWithImpl<$Res, UpdateSubjectRequest>;
  @useResult
  $Res call(
      {String? code,
      String? name,
      @JsonKey(name: 'credits') double? credits,
      String? department,
      String? semester,
      String? description});
}

/// @nodoc
class _$UpdateSubjectRequestCopyWithImpl<$Res,
        $Val extends UpdateSubjectRequest>
    implements $UpdateSubjectRequestCopyWith<$Res> {
  _$UpdateSubjectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateSubjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? credits = freezed,
    Object? department = freezed,
    Object? semester = freezed,
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
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      semester: freezed == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateSubjectRequestImplCopyWith<$Res>
    implements $UpdateSubjectRequestCopyWith<$Res> {
  factory _$$UpdateSubjectRequestImplCopyWith(_$UpdateSubjectRequestImpl value,
          $Res Function(_$UpdateSubjectRequestImpl) then) =
      __$$UpdateSubjectRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? name,
      @JsonKey(name: 'credits') double? credits,
      String? department,
      String? semester,
      String? description});
}

/// @nodoc
class __$$UpdateSubjectRequestImplCopyWithImpl<$Res>
    extends _$UpdateSubjectRequestCopyWithImpl<$Res, _$UpdateSubjectRequestImpl>
    implements _$$UpdateSubjectRequestImplCopyWith<$Res> {
  __$$UpdateSubjectRequestImplCopyWithImpl(_$UpdateSubjectRequestImpl _value,
      $Res Function(_$UpdateSubjectRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateSubjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? credits = freezed,
    Object? department = freezed,
    Object? semester = freezed,
    Object? description = freezed,
  }) {
    return _then(_$UpdateSubjectRequestImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      semester: freezed == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
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
class _$UpdateSubjectRequestImpl implements _UpdateSubjectRequest {
  const _$UpdateSubjectRequestImpl(
      {this.code,
      this.name,
      @JsonKey(name: 'credits') this.credits,
      this.department,
      this.semester,
      this.description});

  factory _$UpdateSubjectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateSubjectRequestImplFromJson(json);

  @override
  final String? code;
  @override
  final String? name;
  @override
  @JsonKey(name: 'credits')
  final double? credits;
// ✅ ADD THIS
  @override
  final String? department;
  @override
  final String? semester;
  @override
  final String? description;

  @override
  String toString() {
    return 'UpdateSubjectRequest(code: $code, name: $name, credits: $credits, department: $department, semester: $semester, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSubjectRequestImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, name, credits, department, semester, description);

  /// Create a copy of UpdateSubjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSubjectRequestImplCopyWith<_$UpdateSubjectRequestImpl>
      get copyWith =>
          __$$UpdateSubjectRequestImplCopyWithImpl<_$UpdateSubjectRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateSubjectRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateSubjectRequest implements UpdateSubjectRequest {
  const factory _UpdateSubjectRequest(
      {final String? code,
      final String? name,
      @JsonKey(name: 'credits') final double? credits,
      final String? department,
      final String? semester,
      final String? description}) = _$UpdateSubjectRequestImpl;

  factory _UpdateSubjectRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateSubjectRequestImpl.fromJson;

  @override
  String? get code;
  @override
  String? get name;
  @override
  @JsonKey(name: 'credits')
  double? get credits; // ✅ ADD THIS
  @override
  String? get department;
  @override
  String? get semester;
  @override
  String? get description;

  /// Create a copy of UpdateSubjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSubjectRequestImplCopyWith<_$UpdateSubjectRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
