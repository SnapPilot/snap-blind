import 'package:snap_blind/core/enum/login_type.dart';

final class UserEntity {
  UserEntity({
    this.socialId,
    required this.loginType,
    required this.email,
    required this.profileImage,
    required this.nickName,
  });

  final int? socialId;
  final LoginType loginType;
  final String email;
  final String profileImage;
  final String nickName;

  factory UserEntity.fromKaKao({
    required int socialId,
    required LoginType loginType,
    required String email,
    required String profileImage,
    required String nickName,
  }) {
    return UserEntity(
      socialId: socialId,
      loginType: loginType,
      email: email,
      profileImage: profileImage,
      nickName: nickName,
    );
  }

  UserEntity copyWith({
    int? socialId,
    LoginType? loginType,
    String? email,
    String? profileImage,
    String? nickName,
  }) {
    return UserEntity(
      socialId: socialId ?? this.socialId,
      loginType: loginType ?? this.loginType,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      nickName: nickName ?? this.nickName,
    );
  }
}
