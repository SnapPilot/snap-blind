import 'package:snap_blind/core/env/app_env.dart';

final class WebEnv extends AppEnv {
  @override
  Future<void> init() async {
    supabaseHostUrl = const String.fromEnvironment(
      AppEnv.supabaseHostConst,
      defaultValue: 'https://antkaamjavartdpwczbr.supabase.co',
    );
    supabaseApiKey = const String.fromEnvironment(
      AppEnv.supabaseApiConst,
      defaultValue: '',
    );

    checkEnv();
  }
}

AppEnv createEnv() => WebEnv();
