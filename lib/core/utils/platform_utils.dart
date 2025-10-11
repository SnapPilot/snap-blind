import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

abstract final class PlatformUtils {
  /// Android
  static bool get isAndroid {
    if (kIsWeb) {
      return false;
    }

    return TargetPlatform.android == defaultTargetPlatform;
  }

  static bool get isAndroidWeb => isAndroid && kIsWeb;

  /// IOS
  static bool get isIos {
    if (kIsWeb) {
      return false;
    }

    return TargetPlatform.iOS == defaultTargetPlatform;
  }

  static bool get isIosWeb => isIos && kIsWeb;

  /// Web
  static bool get isWeb {
    if (isIosWeb) {
      return false;
    }

    if (isAndroidWeb) {
      return false;
    }

    return kIsWeb;
  }

  static bool get isMobile => isIos || isAndroid;

  static void launch(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
