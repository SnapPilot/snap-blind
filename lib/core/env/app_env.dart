import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:snap_blind/core/di/di.dart';
import 'package:snap_blind/core/logger/app_logger.dart';

final class AppEnv {
  AppEnv._internal();

  static final AppEnv _instance = AppEnv._internal();
  factory AppEnv() => _instance;

  final AppLogger _appLogger = getIt<AppLogger>();

  late final String _supabaseHostUrl;
  String get supabaseHostUrl => _supabaseHostUrl;

  late final String _supabaseApiKey;
  String get supabaseApiKey => _supabaseApiKey;

  Future<void> init() async {
    await dotenv.load(fileName: 'env/.env');

    _supabaseHostUrl = dotenv.get(
      'SUPABASE_HOST_URL',
      fallback: 'https://antkaamjavartdpwczbr.supabase.co',
    );
    _supabaseApiKey = dotenv.get('SUPABASE_API_KEY', fallback: '');

    if (_supabaseApiKey.isEmpty) {
      _appLogger.error('SUPABASE_API_KEY가 비어 있습니다.\n.env 파일을 확인해 주세요.');
    }
  }
}
