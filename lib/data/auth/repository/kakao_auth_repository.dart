import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/data/auth/exception/kakao_exception.dart';
import 'package:snap_blind/data/auth/source/kakao_auth_data_source.dart';
import 'package:snap_blind/domain/auth/entity/auth_token_entity.dart';
import 'package:snap_blind/domain/auth/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
final class KaKaoAuthRepository implements AuthRepository {
  KaKaoAuthRepository({required KaKaoAuthDataSource remote}) : _remote = remote;

  final KaKaoAuthDataSource _remote;

  @override
  Future<Result<AuthTokenEntity>> login() async {
    final Result<kakao.OAuthToken> token = await _remote.loginWithKakaoTalk();

    return token.when(
      ok: (kakao.OAuthToken token) => Result.ok(_map(token)),
      exception: (e) async {
        if (e is KaKaoUserCanceledException) {
          await _remote.loginWithKakaoAccount();
        }

        return Result.error(e);
      },
    );
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  /// app TODO: Mapper를 만들든 확장 함수를 만들든
  AuthTokenEntity _map(kakao.OAuthToken t) => AuthTokenEntity(
    accessToken: t.accessToken,
    accessTokenExpiresAt: t.expiresAt,
    refreshToken: t.refreshToken,
    refreshTokenExpiresAt: t.refreshTokenExpiresAt,
  );
}
