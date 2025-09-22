import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/domain/user/entity/user_profile_entity.dart';

abstract interface class UserRepository {
  Future<Result<UserProfileEntity>> fetchUserProfile();
}
