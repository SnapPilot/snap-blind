import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_blind/core/logger/app_logger.dart';
import 'package:snap_blind/presenter/base/base_state.dart';

import '../../core/di/di.dart';

abstract base class BaseBloc<E, S extends BaseState> extends Bloc<E, S> {
  BaseBloc(super.initialState);

  @override
  void onTransition(Transition<E, S> transition) {
    super.onTransition(transition);

    if (kDebugMode) {
      final AppLogger logger = getIt<AppLogger>();

      if (transition.nextState.stateType == BaseStateType.failure) {
        logger.error('[Bloc] Transition: $transition');
        return;
      }

      logger.info('[Bloc] Transition: $transition');
    }
  }
}
