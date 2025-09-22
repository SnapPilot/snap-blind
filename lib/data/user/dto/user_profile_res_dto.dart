import 'package:snap_blind/core/utils/typedef.dart';
import 'package:snap_blind/domain/user/entity/user_profile_entity.dart';

final class UserProfileResDto {
  UserProfileResDto({
    required this.userUid,
    required this.nickname,
    required this.intro,
    required this.gender,
    required this.photoUrl,
    required this.birthDate,
  });

  final String userUid;
  final String nickname;
  final String intro;
  final String gender;
  final String photoUrl;
  final DateTime birthDate;

  factory UserProfileResDto.fromJson(Json json) {
    return UserProfileResDto(
      userUid: json['user_id'],
      nickname: json['nickname'] ?? '',
      intro: json['intro'] ?? '',
      gender: json['gender'],
      photoUrl: json['photo_url'],
      birthDate: DateTime.parse(json['birth_date']),
    );
  }

  UserProfileEntity toEntity() {
    return UserProfileEntity(
      userUid: userUid,
      nickname: nickname,
      intro: intro,
      gender: gender,
      photoUrl: photoUrl,
      birthDate: birthDate,
    );
  }
}
