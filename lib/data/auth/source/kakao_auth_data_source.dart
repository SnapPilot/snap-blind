import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/network/call_adapter.dart';

@lazySingleton
final class KaKaoAuthDataSource {
  final kakao.UserApi _kakaoApi = kakao.UserApi.instance;

  Future<Result<kakao.OAuthToken>> loginWithKakaoTalk() async {
    if (await kakao.isKakaoTalkInstalled()) {
      return KakaoCallAdapter<kakao.OAuthToken>().adapt(
        () async => await _kakaoApi.loginWithKakaoTalk(),
      );
    }

    return loginWithKakaoAccount();
  }

  Future<Result<kakao.OAuthToken>> loginWithKakaoAccount() async {
    return KakaoCallAdapter<kakao.OAuthToken>().adapt(
      () async => await _kakaoApi.loginWithKakaoAccount(),
    );
  }

  Future<void> logout() async {
    await _kakaoApi.logout();
  }
}
