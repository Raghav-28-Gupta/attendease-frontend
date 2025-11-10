import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';
import 'login_response.dart'; 
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
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
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Convert to domain entity
  User toEntity() {
    return User(
      id: id,
      email: email,
      role: role,
      emailVerified: emailVerified,
      name: name,
      phone: phone,
      employeeId: employeeId,
      studentId: studentId,
      department: department,
      batchId: batchId,
    );
  }

  // Create from domain entity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      role: user.role,
      emailVerified: user.emailVerified,
      name: user.name,
      phone: user.phone,
      employeeId: user.employeeId,
      studentId: user.studentId,
      department: user.department,
      batchId: user.batchId,
    );
  }

  // Create from UserData (login response)
  factory UserModel.fromUserData(UserData userData) {
    return UserModel(
      id: userData.id,
      email: userData.email,
      role: userData.role,
      emailVerified: userData.emailVerified,
      name: userData.name,
      phone: userData.phone,
      employeeId: userData.employeeId,
      studentId: userData.studentId,
      department: userData.department,
      batchId: userData.batchId,
    );
  }
}
