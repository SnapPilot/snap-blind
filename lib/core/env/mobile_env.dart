import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:snap_blind/core/env/app_env.dart';

final class MobileEnv extends AppEnv {
  MobileEnv._internal();

  static final MobileEnv _instance = MobileEnv._internal();
  factory MobileEnv() => _instance;

  @override
  Future<void> init() async {
    await dotenv.load(fileName: 'env/.env');

    setEnv(
      hostUrl: dotenv.get(
        AppEnv.supabaseHostConst,
        fallback: 'https://antkaamjavartdpwczbr.supabase.co',
      ),
      apiKey: dotenv.get(AppEnv.supabaseApiConst, fallback: ''),
      kakoSdkNativeKey: dotenv.get(AppEnv.kakaoSdkNativeConst, fallback: ''),
      kakaoSdkJsKey: dotenv.get(AppEnv.kakaoSdkJsConst, fallback: ''),
    );

    checkEnv();
  }
}

AppEnv createEnv() => MobileEnv();
