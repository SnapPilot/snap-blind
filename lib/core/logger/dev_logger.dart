import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'app_logger.dart';

@LazySingleton(as: AppLogger, env: [Environment.dev])
class DevLogger extends AppLogger {
  final _logger = Logger();

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(String message) {
    _logger.i(message);
  }
}
