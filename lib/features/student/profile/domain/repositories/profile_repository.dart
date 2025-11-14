import 'package:dartz/dartz.dart';
import '../../../../../core/network/network_exceptions.dart';
import '../../data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<NetworkException, StudentProfileModel>> getMyProfile();
  Future<Either<NetworkException, StudentProfileModel>> updateProfile(
    UpdateProfileRequest request,
  );
}
