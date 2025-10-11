import 'package:snap_blind/presenter/user/user_edit_state.dart';

final class UserProfileEntity {
  UserProfileEntity({
    required this.userUid,
    required this.nickname,
    required this.intro,
    required this.gender,
    required this.photoUrl,
    this.birthDate,
  });

  final String userUid;
  final String nickname;
  final String intro;
  final Gender gender;
  final String photoUrl;
  final DateTime? birthDate;

  int get age {
    if (birthDate == null) return 0;

    final now = DateTime.now();
    int age = now.year - birthDate!.year;

    if (now.month < birthDate!.month ||
        (now.month == birthDate!.month && now.day < birthDate!.day)) {
      age--;
    }
    return age;
  }
}
