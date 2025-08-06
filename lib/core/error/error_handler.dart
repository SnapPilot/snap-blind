import 'package:flutter/cupertino.dart';
import 'package:snap_blind/core/logger/app_logger.dart';

import '../di/di.dart';

abstract final class ErrorHandler {
  static void handleFlutterError(FlutterErrorDetails details) {
    FlutterError.presentError(details);
  }

  static bool handlePlatformDispatcherError(Object error, StackTrace stack) {
    final AppLogger logger = getIt<AppLogger>();
    logger.error(
      'Uncaught error in PlatformDispatcher',
      error: error,
      stackTrace: stack,
    );

    return true;
  }

  static void handleUncaughtError(Object error, StackTrace stack) {
    final AppLogger logger = getIt<AppLogger>();
    logger.error('Uncaught error in main', error: error, stackTrace: stack);
  }
}
