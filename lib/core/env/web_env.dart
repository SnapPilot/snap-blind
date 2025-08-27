import 'package:snap_blind/core/env/app_env.dart';

final class WebEnv extends AppEnv {
  @override
  Future<void> init() async {
    setEnv(
      hostUrl: const String.fromEnvironment(
        AppEnv.supabaseHostConst,
        defaultValue: 'https://evvzbuupespgfbyjhvvk.supabase.co',
      ),
      apiKey: const String.fromEnvironment(
        AppEnv.supabaseApiConst,
        defaultValue: '',
      ),
      kakoSdkNativeKey: const String.fromEnvironment(
        AppEnv.kakaoSdkNativeConst,
        defaultValue: '',
      ),
      kakaoSdkJsKey: const String.fromEnvironment(
        AppEnv.kakaoSdkJsConst,
        defaultValue: '',
      ),
    );

    checkEnv();
  }
}

AppEnv createEnv() => WebEnv();
