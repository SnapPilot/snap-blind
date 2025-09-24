final class UserProfileUpdateReqDto {
  UserProfileUpdateReqDto({
    required this.uid,
    this.nickName,
    this.intro,
    this.gender,
    this.photoUrl,
    this.birthDate,
  });

  final String uid;
  final String? nickName;
  final String? intro;
  final String? gender;
  final String? photoUrl;
  final DateTime? birthDate;
}
