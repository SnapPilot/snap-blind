import 'package:snap_blind/core/utils/typedef.dart';
import 'package:snap_blind/domain/match/entity/partner_entity.dart';

final class PartnerResDto {
  PartnerResDto({
    required this.partnerNickname,
    required this.partnerPhoto,
    required this.intro,
    this.age,
  });

  final String partnerNickname;
  final String partnerPhoto;
  final String intro;
  final int? age;

  factory PartnerResDto.fromJson(Json json) {
    return PartnerResDto(
      partnerNickname: json['partner_nickname'],
      partnerPhoto: json['partner_photo'] ?? '',
      intro: json['partner_intro'] ?? '',
      age: json['partner_age'],
    );
  }

  PartnerEntity toEntity() {
    return PartnerEntity(
      nickname: partnerNickname,
      profileUrl: partnerPhoto,
      intro: intro,
      age: age,
    );
  }
}
