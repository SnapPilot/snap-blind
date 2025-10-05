import 'package:snap_blind/core/utils/typedef.dart';
import 'package:snap_blind/domain/user/entity/user_profile_entity.dart';
import 'package:snap_blind/presenter/user/user_edit_state.dart';

final class UserProfileResDto {
  UserProfileResDto({
    required this.userUid,
    required this.nickname,
    required this.intro,
    required this.gender,
    required this.photoUrl,
    required this.agreeTermsOfService,
    required this.agreePrivacyPolicy,
    required this.agreeAgeOver14,
    this.birthDate,
  });

  final String userUid;
  final String nickname;
  final String intro;
  final Gender gender;
  final String photoUrl;
  final DateTime? birthDate;
  final bool agreeTermsOfService;
  final bool agreePrivacyPolicy;
  final bool agreeAgeOver14;

  factory UserProfileResDto.fromJson(Json json) {
    return UserProfileResDto(
      userUid: json['user_id'],
      nickname: json['nickname'] ?? '',
      intro: json['intro'] ?? '',
      gender: Gender.fromCode(json['gender']),
      photoUrl: json['photo_url'],
      birthDate:
          json['birth_date'] != null
              ? DateTime.parse(json['birth_date'])
              : null,
      agreeTermsOfService: json['agree_terms_of_service'],
      agreePrivacyPolicy: json['agree_privacy_policy'],
      agreeAgeOver14: json['agree_age_over_14'],
    );
  }

  UserProfileEntity toEntity() {
    return UserProfileEntity(
      userUid: userUid,
      nickname: nickname,
      intro: intro,
      gender: gender,
      photoUrl: '$photoUrl?t=${DateTime.now().millisecondsSinceEpoch}',
      birthDate: birthDate,
      agreeAgeOver14: agreeAgeOver14,
      agreePrivacyPolicy: agreePrivacyPolicy,
      agreeTermsOfService: agreeTermsOfService,
    );
  }
}
