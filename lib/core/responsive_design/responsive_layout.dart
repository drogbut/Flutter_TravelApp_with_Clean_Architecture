import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A widget for the responsive layout of the different type of the devices.
///
/// See also:
///   * Admin Panel Dashboard in : https://www.youtube.com/watch?v=n7O3pXfENPU
class ResponsiveLayout extends StatelessWidget {
  /// Constructor
  const ResponsiveLayout({
    required this.tiny,
    required this.phone,
    required this.tablet,
    required this.largeTablet,
    required this.computer,
    Key? key,
  }) : super(key: key);

  /// if the size ist just way to small like this.
  final Widget tiny;

  /// The phone mode.
  final Widget phone;

  /// the tablet Mode.
  final Widget tablet;

  /// The largeTablet mode.
  final Widget largeTablet;

  /// The computer mode.
  final Widget computer;

  /// The height small limit constant.
  static const int tinyHeightLimit = 100;

  /// The width small limit constant.
  static const int tinyLimit = 270;

  /// The phone limit constant.
  static const int phoneLimit = 600;

  /// The tablet limit constant.
  static const int tabletLimit = 904;

  /// The large tablet limit constant.
  static const int largeTabletLimit = 1240;

  /// The laptop limit constant.
  static const int laptopLimit = 1440;

  /// The tiny height screen limits according to the context.
  static bool isTinyHeightLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;

  /// The tiny width screen limits according to the context.
  static bool isTinyLimit(BuildContext context) =>
      MediaQuery.of(context).size.width < tinyLimit;

  /// The phone screen limits according to the context.
  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit &&
      MediaQuery.of(context).size.width >= tinyLimit;

  /// The tablet screen limits according to the context.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;

  /// The large tablet screen limits according to the context.
  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < largeTabletLimit &&
      MediaQuery.of(context).size.width >= tabletLimit;

  /// The computer screen limits according to the context
  static bool isComputer(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeTabletLimit;

  /// The computer screen limits according to the context
  static bool isLargeDevice(BuildContext context) =>
      MediaQuery.of(context).size.width >= laptopLimit;

  /// The device width is at least that of a tablet
  static bool isAtLeastTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= phoneLimit;

  /// Checks whether the application is running on an android/ios environment
  static bool get isMobilePlatform => [
        TargetPlatform.android,
        TargetPlatform.iOS,
      ].contains(defaultTargetPlatform);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < tinyLimit ||
          constraints.maxHeight < tinyHeightLimit) {
        return tiny;
      }
      if (constraints.maxWidth < phoneLimit) {
        return phone;
      }
      if (constraints.maxWidth < tabletLimit) {
        return tablet;
      }
      if (constraints.maxWidth < largeTabletLimit) {
        return largeTablet;
      } else {
        return computer;
      }
    });
  }
}
