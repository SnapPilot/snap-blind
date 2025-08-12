import 'package:flutter/cupertino.dart';
import 'package:snap_blind/core/di/di.dart';
import 'package:snap_blind/core/logger/app_logger.dart';

abstract class AppEnv {
  static const String supabaseHostConst = 'SUPABASE_HOST_URL';
  static const String supabaseApiConst = 'SUPABASE_API_KEY';

  @protected
  final AppLogger appLogger = getIt<AppLogger>();

  late final String _supabaseHostUrl;
  String get supabaseHostUrl => _supabaseHostUrl;

  late final String _supabaseApiKey;
  String get supabaseApiKey => _supabaseApiKey;

  Future<void> init();

  @protected
  void setEnv({required String hostUrl, required String apiKey}) {
    _supabaseHostUrl = hostUrl;
    _supabaseApiKey = apiKey;
  }

  void checkEnv() {
    if (supabaseApiKey.isEmpty) {
      appLogger.error('SUPABASE_API_KEY가 비어 있습니다.\n.env 파일을 확인해 주세요.');
    }
  }
}
