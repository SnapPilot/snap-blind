import 'package:image_picker/image_picker.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/data/user/dto/user_profile_update_req_dto.dart';
import 'package:snap_blind/domain/user/entity/user_profile_entity.dart';

abstract interface class UserRepository {
  Future<Result<UserProfileEntity>> fetchUserProfile();

  Future<Result<UserProfileEntity>> updateProfile(UserProfileUpdateReqDto dto);

  Future<Result<String>> uploadProfileImage(XFile imageFile);
}
