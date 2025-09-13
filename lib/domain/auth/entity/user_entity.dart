import 'package:snap_blind/core/enum/login_type.dart';

final class UserEntity {
  UserEntity({this.socialId, required this.loginType, required this.email});

  final int? socialId;
  final LoginType loginType;
  final String email;

  factory UserEntity.fromKaKao({
    required int socialId,
    required LoginType loginType,
    required String email,
  }) {
    return UserEntity(socialId: socialId, loginType: loginType, email: email);
  }

  UserEntity copyWith({int? socialId, LoginType? loginType, String? email}) {
    return UserEntity(
      socialId: socialId ?? this.socialId,
      loginType: loginType ?? this.loginType,
      email: email ?? this.email,
    );
  }
}
