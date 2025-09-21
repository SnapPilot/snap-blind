final class PartnerEntity {
  PartnerEntity({
    required this.nickname,
    required this.profileUrl,
    required this.intro,
    this.age,
  });

  final String nickname;
  final String profileUrl;
  final String intro;
  final int? age;

  String get getAge {
    if (age == null) {
      return '';
    }

    return '($age)';
  }
}
