import 'package:flutter/material.dart';

class TvPickerIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData iconData;
  final String? tooltip;

  const TvPickerIcon({
    required this.onPressed,
    required this.iconData,
    this.tooltip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        tooltip: tooltip,
        onPressed: onPressed,
        icon: Icon(iconData));
  }
}
