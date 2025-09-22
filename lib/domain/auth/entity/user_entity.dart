import 'package:snap_blind/core/enum/login_type.dart';
import 'package:snap_blind/presenter/user/user_state.dart';

final class UserEntity {
  UserEntity({
    this.socialId,
    required this.loginType,
    required this.email,
    required this.profileImage,
    required this.nickName,
    required this.intro,
    required this.age,
    required this.gender,
  });

  final int? socialId;
  final LoginType loginType;
  final String email;
  final String profileImage;
  final String nickName;
  final String intro;
  final int age;
  final Gender gender;

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
      intro: '',
      gender: Gender.male,
      age: 0,
    );
  }

  UserEntity copyWith({
    int? socialId,
    LoginType? loginType,
    String? email,
    String? profileImage,
    String? nickName,
    String? intro,
    int? age,
    Gender? gender,
  }) {
    return UserEntity(
      socialId: socialId ?? this.socialId,
      loginType: loginType ?? this.loginType,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      nickName: nickName ?? this.nickName,
      intro: intro ?? this.intro,
      age: age ?? this.age,
      gender: gender ?? this.gender,
    );
  }
}
