final class UserProfileUpdateReqDto {
  UserProfileUpdateReqDto({
    required this.uid,
    this.nickName,
    this.intro,
    this.gender,
    this.photoUrl,
    this.birthDate,
    this.agreeTermsOfService,
    this.agreePrivacyPolicy,
    this.agreeAgeOver14,
  });

  final String uid;
  final String? nickName;
  final String? intro;
  final String? gender;
  final String? photoUrl;
  final DateTime? birthDate;
  final bool? agreeTermsOfService;
  final bool? agreePrivacyPolicy;
  final bool? agreeAgeOver14;
}
