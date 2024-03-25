import 'package:flutter/cupertino.dart';
import 'package:travel_app/features/responsive/domain/device_screen_type.dart';

class SizingInfo {
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;
  final BoxConstraints constraints;

  SizingInfo({
    required this.deviceScreenType,
    required this.screenSize,
    required this.localWidgetSize,
    required this.constraints,
  });

  @override
  String toString() {
    return 'deviceScreenType: $deviceScreenType, screenSize: $screenSize, localWidgetSize: $localWidgetSize, constraints: $constraints';
  }
}
