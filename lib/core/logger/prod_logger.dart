import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'app_logger.dart';

// app TODO: 실제 로깅 환경 셋팅
@LazySingleton(as: AppLogger, env: [Environment.prod])
class ProdLogger extends AppLogger {
  final Logger _logger = Logger();

  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(String message) {
    _logger.i(message);
  }
}
