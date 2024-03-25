import 'package:flutter/material.dart';
import 'package:travel_app/core/extensions/context_extension.dart';
import 'package:travel_app/features/responsive/domain/sizing_info.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInfo sizingInfo) builder;
  const ResponsiveBuilder({
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizingInfo sizingInfo = SizingInfo(
        deviceScreenType: context.deviceType,
        screenSize: context.mediaQuerySize,
        localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
        constraints: constraints,
      );

      return builder(context, sizingInfo);
    });
  }
}
