import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:snap_blind/core/di/di.dart';
import 'package:snap_blind/core/logger/app_logger.dart';
import 'package:snap_blind/core/utils/platform_utils.dart';

abstract class AppEnv {
  static const String supabaseHostConst = 'SUPABASE_HOST_URL';
  static const String supabaseApiConst = 'SUPABASE_API_KEY';
  static const String kakaoSdkNativeConst = 'KAKAO_SDK_NATIVE_KEY';
  static const String kakaoSdkJsConst = 'KAKAO_SDK_JS_KEY';

  @protected
  final AppLogger appLogger = getIt<AppLogger>();

  late final String _supabaseHostUrl;
  String get supabaseHostUrl => _supabaseHostUrl;

  late final String _supabaseApiKey;
  String get supabaseApiKey => _supabaseApiKey;

  late final String _kakaoSdkNativeKey;
  String get kakaoSdkNativeKey => _kakaoSdkNativeKey;

  late final String _kakaoSdkJsKey;
  String get kakaoSdkJsKey => _kakaoSdkJsKey;

  Future<void> init();

  @protected
  void setEnv({
    required String hostUrl,
    required String apiKey,
    required String kakoSdkNativeKey,
    required String kakaoSdkJsKey,
  }) {
    _supabaseHostUrl = hostUrl;
    _supabaseApiKey = apiKey;
    _kakaoSdkNativeKey = kakoSdkNativeKey;
    _kakaoSdkJsKey = kakaoSdkJsKey;
  }

  void checkEnv() {
    if (supabaseApiKey.isEmpty) {
      appLogger.error('SUPABASE_API_KEY가 비어 있습니다.\n.env 파일을 확인해 주세요.');
      return;
    }

    if (kakaoSdkNativeKey.isEmpty && PlatformUtils.isMobile) {
      appLogger.error('kakaoSdkNativeKey가 비어 있습니다.\n.env 파일을 확인해 주세요.');
      return;
    }

    if (kakaoSdkJsKey.isEmpty && PlatformUtils.isWeb) {
      appLogger.error('kakaoSdkJSKey가 비어 있습니다.\n.env 파일을 확인해 주세요.');
      return;
    }
  }
}
