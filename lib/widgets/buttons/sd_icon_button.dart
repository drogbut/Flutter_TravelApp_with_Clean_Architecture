import 'package:flutter/material.dart';

/// [SdIconButton] styled for a webshop 2.0 icons. All optional settings for
/// this widget are repeated in the IconButton widget.
///
/// See also:
///
///  * [CloseButton], an icon button for closing pages.
///  * [AppBar], to show a toolbar at the top of an application.
///  * [InkResponse] and [InkWell], for the ink splash effect itself.
class SdIconButton extends StatelessWidget {
  /// The callback when the increment button is pressed.
  final VoidCallback? onPressed;

  /// The icon data.
  final IconData icon;

  /// The icon size
  final double? iconSize;

  /// The padding around the icon
  final EdgeInsetsGeometry padding;

  /// The icon color
  final Color? iconColor;

  /// The icon Background color
  final Color? iconBackgroundColor;

  const SdIconButton({
    required this.onPressed,
    required this.icon,
    this.iconSize,
    this.padding = const EdgeInsets.all(8),
    this.iconColor,
    this.iconBackgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: IconButton(
        highlightColor: Theme.of(context).appBarTheme.foregroundColor,
        onPressed: onPressed,
        icon: Icon(icon,
            color: iconColor ?? Theme.of(context).iconTheme.color,
            size: iconSize),
        padding: padding,
        color: iconBackgroundColor,
      ),
    );
  }
}
