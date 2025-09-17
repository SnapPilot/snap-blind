import 'package:snap_blind/core/utils/typedef.dart';
import 'package:snap_blind/domain/match/entity/partner_entity.dart';

final class PartnerResDto {
  PartnerResDto({required this.partnerNickname, required this.partnerPhoto});

  final String partnerNickname;
  final String partnerPhoto;

  factory PartnerResDto.fromJson(Json json) {
    return PartnerResDto(
      partnerNickname: json['partner_nickname'],
      partnerPhoto: json['partner_photo'] ?? '',
    );
  }

  PartnerEntity toEntity() {
    return PartnerEntity(nickname: partnerNickname, profileUrl: partnerPhoto);
  }
}
