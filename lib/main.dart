import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:snap_blind/core/router/route_enum.dart';
import 'package:snap_blind/core/router/router_config.dart';
import 'package:snap_blind/presenter/theme/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/di/di.dart';
import 'core/env/app_env.dart';
import 'core/error/error_handler.dart';

import 'core/env/mobile_env.dart'
    if (dart.library.html) 'core/env/web_env.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    configureDependencies(kReleaseMode ? Environment.prod : Environment.dev);
    await getIt.allReady();

    FlutterError.onError = ErrorHandler.handleFlutterError;
    PlatformDispatcher.instance.onError =
        ErrorHandler.handlePlatformDispatcherError;

    final AppEnv env = createEnv();
    await env.init();

    await Supabase.initialize(
      url: env.supabaseHostUrl,
      anonKey: env.supabaseApiKey,
    );

    KakaoSdk.init(
      nativeAppKey: env.kakaoSdkNativeKey,
      javaScriptAppKey: env.kakaoSdkJsKey,
    );

    createRouter(initialLocation: AppRoute.login.path);

    runApp(const MyApp());
  }, ErrorHandler.handleUncaughtError);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Pretendard',
      ),
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Container(
            color: AppColors.cGray200,
            child: Center(child: SizedBox(width: 600, child: child)),
          ),
        );
      },
    );
  }
}
