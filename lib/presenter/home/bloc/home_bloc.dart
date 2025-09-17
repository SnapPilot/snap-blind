import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/di/di.dart';
import 'package:snap_blind/core/error/result.dart';
import 'package:snap_blind/core/extension/result_extension.dart';
import 'package:snap_blind/core/logger/app_logger.dart';
import 'package:snap_blind/domain/match/entity/partner_entity.dart';
import 'package:snap_blind/domain/match/repository/match_repository.dart';
import 'package:snap_blind/presenter/base/base_bloc.dart';
import 'package:snap_blind/presenter/const/string_const.dart';
import 'package:snap_blind/presenter/home/event/home_event.dart';
import 'package:snap_blind/presenter/home/state/home_state.dart';

@injectable
final class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this._matchRepository) : super(const HomeState()) {
    on<GetTodayMatchPartnerProfileEvent>(_onGetToadyMatchPartnerProfile);
  }

  final MatchRepository _matchRepository;

  void _onGetToadyMatchPartnerProfile(
    GetTodayMatchPartnerProfileEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const PartnerProfileLoading());

    final Result<PartnerEntity?> result =
        await _matchRepository.fetchTodayPartnerInfo();

    result.when(
      ok: (PartnerEntity? entity) {
        if (entity == null) {
          emit(const TodayNotMatched());
          return;
        }

        emit(PartnerProfileLoadSuccess(entity));
      },
      exception: (Exception e) {
        getIt<AppLogger>().error(e.toString());
        emit(
          const PartnerProfileLoadFailure(
            errorMessage: StringConst.matchLoadFailureMessage,
          ),
        );
      },
    );
  }
}
