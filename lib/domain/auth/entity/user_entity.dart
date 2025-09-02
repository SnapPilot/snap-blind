import 'package:snap_blind/core/enum/login_type.dart';

final class UserEntity {
  UserEntity({
    required this.socialId,
    required this.loginType,
    required this.email,
  });

  final int socialId;
  final LoginType loginType;
  final String email;

  factory UserEntity.fromKaKao({
    required int socialId,
    required LoginType loginType,
    required String email,
  }) {
    return UserEntity(socialId: socialId, loginType: loginType, email: email);
  }
}
