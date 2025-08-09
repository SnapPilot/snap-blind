import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:snap_blind/core/env/app_env.dart';
import 'package:snap_blind/core/error/error_handler.dart';

import 'core/di/di.dart';
import 'presenter/home/home_screen.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    configureDependencies(kReleaseMode ? Environment.prod : Environment.dev);
    await AppEnv().init();

    FlutterError.onError = ErrorHandler.handleFlutterError;
    PlatformDispatcher.instance.onError =
        ErrorHandler.handlePlatformDispatcherError;

    runApp(const MyApp());
  }, ErrorHandler.handleUncaughtError);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
      builder: (context, child) {
        if (child == null) {
          return const SizedBox.shrink();
        }

        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child,
        );
      },
    );
  }
}
