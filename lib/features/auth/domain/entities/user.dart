import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String role,
    required bool emailVerified,
    String? name,
    String? phone,
    String? employeeId,
    String? studentId,
    String? department,
    String? batchId,
  }) = _User;

  const User._();

  // Helper getters
  bool get isTeacher => role == 'TEACHER';
  bool get isStudent => role == 'STUDENT';

  String get displayName => name ?? email.split('@')[0];
}
