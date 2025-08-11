import 'package:snap_blind/core/env/app_env.dart';

final class WebEnv extends AppEnv {
  @override
  Future<void> init() async {
    supabaseHostUrl = String.fromEnvironment(
      supabaseHostConst,
      defaultValue: 'https://antkaamjavartdpwczbr.supabase.co',
    );
    supabaseApiKey = String.fromEnvironment(supabaseApiConst, defaultValue: '');

    checkEnv();
  }
}

AppEnv createEnv() => WebEnv();
