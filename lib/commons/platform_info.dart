import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

/// Class which returns us with the info on which platform the application is
/// currently running
/// [getCurrentPlatformType] returns the flutter project platform, whether it is
/// running on Android, Or iOS or Web
///
/// [getCurrentThemePlatform] returns the OS type of the user,
/// Example, If the user is running the app on iPhone but on a web browser
/// then this would return iOS
/// but getCurrentPlatformType would return web
///
/// isDesktopOS isAppOS isWeb is generally used to know, wheather the app is
/// running on desktop or mobile or web
class PlatformInfo {
  bool isDesktopOS() {
    return !kIsWeb && (Platform.isMacOS || Platform.isWindows);
  }

  bool isMobileOS() {
    return !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  }

  bool isWeb() {
    return kIsWeb;
  }

  PlatformType getCurrentPlatformType() {
    if (kIsWeb) {
      return PlatformType.web;
    }
    if (Platform.isMacOS) {
      return PlatformType.macOS;
    }
    if (Platform.isWindows) {
      return PlatformType.windows;
    }
    if (Platform.isIOS) {
      return PlatformType.iOS;
    }
    if (Platform.isAndroid) {
      return PlatformType.android;
    }
    return PlatformType.unknown;
  }

  TargetPlatform getCurrentThemePlatform(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return TargetPlatform.android;
    }
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return TargetPlatform.iOS;
    }
    if (Theme.of(context).platform == TargetPlatform.macOS) {
      return TargetPlatform.macOS;
    }
    if (Theme.of(context).platform == TargetPlatform.windows) {
      return TargetPlatform.windows;
    }
    if (Theme.of(context).platform == TargetPlatform.linux) {
      return TargetPlatform.linux;
    }
    if (Theme.of(context).platform == TargetPlatform.fuchsia) {
      return TargetPlatform.fuchsia;
    }
    return TargetPlatform.android;
  }
}

enum PlatformType { web, iOS, android, macOS, windows, unknown }
