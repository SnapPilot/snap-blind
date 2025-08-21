import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/domain/auth/entity/auth_token_entity.dart';

abstract interface class AuthRepository {
  Future<Result<AuthTokenEntity>> login();
  Future<void> logout();
}
