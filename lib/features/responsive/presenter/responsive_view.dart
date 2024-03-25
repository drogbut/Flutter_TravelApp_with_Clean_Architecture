import 'package:flutter/material.dart';
import 'package:travel_app/features/responsive/domain/device_screen_type.dart';
import 'package:travel_app/features/responsive/presenter/responsive_builder.dart';

class ResponsiveView extends StatelessWidget {
  final Widget phone;
  final Widget? wearable;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? largeDesktop;

  const ResponsiveView({
    required this.phone,
    this.wearable,
    this.tablet,
    this.desktop,
    this.largeDesktop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      DeviceScreenType currentScreenType = sizingInfo.deviceScreenType;
      switch (currentScreenType) {
        case DeviceScreenType.largeDesktop:
          return _buildLargeDesktop();
        case DeviceScreenType.desktop:
          return _buildDesktop();
        case DeviceScreenType.tablet:
          return _buildTablet();
        case DeviceScreenType.wearable:
          return _buildWearable();
        case DeviceScreenType.mobile:
          return phone;
      }
    });
  }

  Widget _buildLargeDesktop() {
    if (largeDesktop != null) {
      return largeDesktop!;
    }
    if (desktop != null) {
      return desktop!;
    }
    if (tablet != null) {
      return tablet!;
    }
    if (wearable != null) {
      return wearable!;
    }

    return phone;
  }

  Widget _buildDesktop() {
    if (desktop != null) {
      return desktop!;
    }
    if (tablet != null) {
      return tablet!;
    }
    if (wearable != null) {
      return wearable!;
    }

    return phone;
  }

  Widget _buildTablet() {
    if (tablet != null) {
      return tablet!;
    }
    if (wearable != null) {
      return wearable!;
    }

    return phone;
  }

  Widget _buildWearable() {
    if (wearable != null) {
      return wearable!;
    }

    return phone;
  }
}
