import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:snap_blind/core/enum/login_type.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/data/auth/exception/kakao_exception.dart';
import 'package:snap_blind/data/auth/source/kakao_auth_data_source.dart';
import 'package:snap_blind/domain/auth/entity/auth_token_entity.dart';
import 'package:snap_blind/data/auth/response/oauth_api_response.dart';
import 'package:snap_blind/domain/auth/entity/user_entity.dart';
import 'package:snap_blind/domain/auth/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
final class KaKaoAuthRepository implements AuthRepository {
  KaKaoAuthRepository({required KaKaoAuthDataSource remote}) : _remote = remote;

  final KaKaoAuthDataSource _remote;

  @override
  Future<Result<OAuthApiResponse>> login() async {
    final Result<kakao.OAuthToken> kakaoToken =
        await _remote.loginWithKakaoTalk();

    return kakaoToken.when(
      ok: (kakao.OAuthToken kakaoToken) async {
        final kakao.User user = await _remote.getUser();
        final AuthTokenEntity authTokenEntity = AuthTokenEntity.fromKaKao(
          kakaoToken,
        );
        final UserEntity userEntity = UserEntity.fromKaKao(
          socialId: user.id,
          loginType: LoginType.kakao,
          email: user.kakaoAccount?.email ?? '',
        );

        return Result.ok(
          OAuthApiResponse(
            authTokenEntity: authTokenEntity,
            userEntity: userEntity,
          ),
        );
      },
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
}
