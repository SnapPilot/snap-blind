import 'package:flutter/cupertino.dart';
import 'package:snap_blind/core/di/di.dart';
import 'package:snap_blind/core/logger/app_logger.dart';

abstract class AppEnv {
  final String supabaseHostConst = 'SUPABASE_HOST_URL';
  final String supabaseApiConst = 'SUPABASE_API_KEY';

  @protected
  final AppLogger appLogger = getIt<AppLogger>();

  @protected
  late final String supabaseHostUrl;

  @protected
  late final String supabaseApiKey;

  Future<void> init();

  void checkEnv() {
    if (supabaseApiKey.isEmpty) {
      appLogger.error('SUPABASE_API_KEY가 비어 있습니다.\n.env 파일을 확인해 주세요.');
    }
  }
}
