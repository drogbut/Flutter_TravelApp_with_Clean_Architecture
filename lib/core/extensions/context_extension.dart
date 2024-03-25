import 'package:flutter/material.dart';
import 'package:travel_app/features/responsive/domain/breakpoints.dart';

import '../../features/responsive/domain/device_screen_type.dart';

extension ContextExtension on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get screenWidth => mediaQuerySize.width;
  double get screenHeight => mediaQuerySize.height;

  bool get isPhone => deviceType == DeviceScreenType.mobile;

  DeviceScreenType get deviceType {
    double deviceWidth = mediaQuerySize.shortestSide;

    if (deviceWidth > DeviceBreakpoints.largeDesktop) {
      return DeviceScreenType.largeDesktop;
    }

    if (deviceWidth > DeviceBreakpoints.desktop) {
      return DeviceScreenType.desktop;
    }

    if (deviceWidth > DeviceBreakpoints.tablet) {
      return DeviceScreenType.tablet;
    }

    if (deviceWidth > DeviceBreakpoints.wearable) {
      return DeviceScreenType.wearable;
    }

    return DeviceScreenType.mobile;
  }
}
