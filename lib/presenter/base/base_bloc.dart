import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_blind/core/logger/app_logger.dart';

import '../../core/di/di.dart';

abstract base class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(super.initialState);

  @override
  void onTransition(Transition<E, S> transition) {
    super.onTransition(transition);

    if (kDebugMode) {
      final AppLogger logger = getIt<AppLogger>();
      logger.info('[Bloc] Transition: $transition');
    }
  }
}
