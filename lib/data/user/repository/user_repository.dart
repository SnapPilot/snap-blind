import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/core/utils/typedef.dart';
import 'package:snap_blind/data/user/dto/user_profile_res_dto.dart';
import 'package:snap_blind/data/user/dto/user_profile_update_req_dto.dart';
import 'package:snap_blind/data/user/source/supabase_user_data_source.dart';
import 'package:snap_blind/domain/user/entity/user_profile_entity.dart';
import 'package:snap_blind/domain/user/repository/user_repository.dart';

@Injectable(as: UserRepository)
final class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required SupabaseUserDataSource source})
    : _source = source;

  final SupabaseUserDataSource _source;

  @override
  Future<Result<UserProfileEntity>> fetchUserProfile() async {
    final Result<List<Json>> result = await _source.fetchUserProfile();

    return result.when(
      ok: (List<Json> jsonList) {
        final Json? firstJson = jsonList.firstOrNull;

        if (firstJson == null) {
          throw Exception('Fail to Load User Profile');
        }

        final UserProfileResDto userResDto = UserProfileResDto.fromJson(
          firstJson,
        );

        return Result.ok(userResDto.toEntity());
      },
      exception: (e) {
        return Result.error(e);
      },
    );
  }

  @override
  Future<Result<UserProfileEntity>> updateProfile(
    UserProfileUpdateReqDto dto,
  ) async {
    final Result<Json> result = await _source.updateUserProfile(dto);

    return result.when(
      ok: (Json json) {
        final UserProfileResDto userResDto = UserProfileResDto.fromJson(json);

        return Result.ok(userResDto.toEntity());
      },
      exception: (e) {
        return Result.error(e);
      },
    );
  }

  @override
  Future<Result<String>> uploadProfileImage(XFile imageFile) async {
    return await _source.uploadUserProfileImage(imageFile.path);
  }
}
