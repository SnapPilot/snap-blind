import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/data/auth/dto/oauth_api_dto.dart';

abstract interface class AuthRepository {
  Future<Result<OAuthApiDto>> login();

  Future<void> logout();
}
