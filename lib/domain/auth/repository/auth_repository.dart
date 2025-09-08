import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/data/auth/response/oauth_api_response.dart';

abstract interface class AuthRepository {
  Future<Result<OAuthApiResponse>> login();
  Future<void> logout();
}
