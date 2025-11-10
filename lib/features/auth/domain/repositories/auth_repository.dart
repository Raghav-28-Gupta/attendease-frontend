import 'package:dartz/dartz.dart';
import '../../../../core/network/network_exceptions.dart';
import '../entities/user.dart';
import '../../data/models/login_request.dart';
import '../../data/models/change_password_request.dart';

abstract class AuthRepository {
  Future<Either<NetworkException, User>> login(LoginRequest request);
  Future<Either<NetworkException, Unit>> logout();
  Future<Either<NetworkException, Unit>> changePassword(
    ChangePasswordRequest request,
  );
  Future<User?> getCurrentUser();
  Future<bool> isLoggedIn();
}
