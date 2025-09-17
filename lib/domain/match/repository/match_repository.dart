import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/domain/match/entity/partner_entity.dart';

abstract interface class MatchRepository {
  Future<Result<PartnerEntity?>> fetchTodayPartnerInfo();
}
