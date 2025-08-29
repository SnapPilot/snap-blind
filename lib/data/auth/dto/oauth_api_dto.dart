import 'package:snap_blind/domain/auth/entity/auth_token_entity.dart';
import 'package:snap_blind/domain/auth/entity/user_entity.dart';

final class OAuthApiDto {
  OAuthApiDto({required this.authTokenEntity, required this.userEntity});

  final AuthTokenEntity authTokenEntity;
  final UserEntity userEntity;
}
