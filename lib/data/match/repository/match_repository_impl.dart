import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/core/utils/typedef.dart';
import 'package:snap_blind/data/match/dto/partner_res_dto.dart';
import 'package:snap_blind/data/match/source/supabase_match_data_source.dart';
import 'package:snap_blind/domain/match/entity/partner_entity.dart';
import 'package:snap_blind/domain/match/repository/match_repository.dart';

@Injectable(as: MatchRepository)
final class MatchRepositoryImpl implements MatchRepository {
  MatchRepositoryImpl({required SupabaseMatchDataSource source})
    : _source = source;

  final SupabaseMatchDataSource _source;

  @override
  Future<Result<PartnerEntity?>> fetchTodayPartnerInfo() async {
    final Result<List<Json>> result = await _source.fetchTodayMatchPartner();

    return result.when(
      ok: (List<Json> jsonList) {
        final Json? firstJson = jsonList.firstOrNull;

        if (firstJson == null) {
          return const Result.ok(null);
        }

        final PartnerResDto partnerResDto = PartnerResDto.fromJson(firstJson);

        return Result.ok(partnerResDto.toEntity());
      },
      exception: (e) {
        return Result.error(e);
      },
    );
  }
}
