import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

@immutable
final class GetTodayMatchPartnerProfileEvent extends HomeEvent {}
