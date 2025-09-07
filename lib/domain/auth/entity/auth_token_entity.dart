import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

final class AuthTokenEntity {
  const AuthTokenEntity({
    required this.accessToken,
    this.accessTokenExpiresAt,
    this.idToken,
    this.refreshToken,
    this.refreshTokenExpiresAt,
  });

  final String? idToken;
  final String accessToken;
  final DateTime? accessTokenExpiresAt;
  final String? refreshToken;
  final DateTime? refreshTokenExpiresAt;

  factory AuthTokenEntity.fromKaKao(OAuthToken kakaoToken) {
    return AuthTokenEntity(
      accessToken: kakaoToken.accessToken,
      accessTokenExpiresAt: kakaoToken.expiresAt,
      refreshToken: kakaoToken.refreshToken,
      refreshTokenExpiresAt: kakaoToken.refreshTokenExpiresAt,
      idToken: kakaoToken.idToken,
    );
  }

  AuthTokenEntity copyWith({
    String? idToken,
    String? accessToken,
    DateTime? accessTokenExpiresAt,
    String? refreshToken,
    DateTime? refreshTokenExpiresAt,
  }) {
    return AuthTokenEntity(
      idToken: idToken ?? this.idToken,
      accessToken: accessToken ?? this.accessToken,
      accessTokenExpiresAt: accessTokenExpiresAt ?? this.accessTokenExpiresAt,
      refreshToken: refreshToken ?? this.refreshToken,
      refreshTokenExpiresAt:
          refreshTokenExpiresAt ?? this.refreshTokenExpiresAt,
    );
  }
}
