import 'package:flutter/foundation.dart';
import 'package:snap_blind/domain/match/entity/partner_entity.dart';
import 'package:snap_blind/presenter/base/base_state.dart';

@immutable
base class HomeState extends BaseState {
  const HomeState({super.errorMessage});

  @override
  List<Object?> get props => [...super.props];
}

@immutable
final class PartnerProfileLoadSuccess extends HomeState {
  const PartnerProfileLoadSuccess(this.partner);

  final PartnerEntity partner;

  @override
  List<Object?> get props => [partner];
}

@immutable
final class TodayNotMatched extends HomeState {
  const TodayNotMatched();
}

@immutable
final class PartnerProfileLoadFailure extends HomeState {
  const PartnerProfileLoadFailure({super.errorMessage});

  @override
  List<Object?> get props => [...super.props];
}

@immutable
final class PartnerProfileLoading extends HomeState {
  const PartnerProfileLoading();
}
