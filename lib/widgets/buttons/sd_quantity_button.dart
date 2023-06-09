import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/responsive_layout.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

/// [SdQuantityButton] is a button which increases or decreases the counter value.
///
/// [SdQuantityButton] allows you to increase/decrease the counter value. In
/// Webshop 2.0, it is for example located in ArticleDetail and allows you to
/// add/decrease extras to an order detail.
///
/// In the build it should be kept in mind that the length and width are fixed
/// and differ from small to large screens. ThemeConfig is used for more
/// customization.
///
/// This sample produces a quantity increment/decrement button for order detail.
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return SdQuantityButton(
///             quantity: cartItem.quantity,
///             onIncreaseQuantity: (){},
///             onDecreaseQuantity: (){},
///             buttonWidth: 75,
///             buttonHeight: 30,
///             fontSize: 16,
///           );
/// }
///
/// ```
///
/// See also:
///
///  * [SdRectangleIconButton] is a primary icon button of the app.
///  * [SdFloatingActionButton], a custom rounded button with border and shader.
///  * [CloseButton] <https://api.flutter.dev/flutter/material/CloseButton-class.html>

class SdQuantityButton extends StatelessWidget {
  /// Integer variable used for incrementing the value
  final int quantity;

  /// Double variable used for setting up the width of the button
  final double buttonWidth;

  /// Double variable used for setting up the height of the button.
  final double buttonHeight;

  /// Color variable used for setting up the color of the button
  final Color? buttonColor;

  /// Color variable used for setting up the font color of the button
  final Color? fontColor;

  /// Double variable used for setting up the font size, this will also set the
  /// icon size as well, but the font would be 1.2x bigger than the icons
  final double fontSize;

  /// Bool variable used to enable or disable the shadow
  final bool shadowEnable;

  /// The callback when the increment button is tapped.
  final VoidCallback? onIncreaseQuantity;

  /// The callback when the decrement button is tapped
  final VoidCallback? onDecreaseQuantity;

  final bool useStadiumBorderOnQuantityButton;

  const SdQuantityButton({
    required this.quantity,
    required this.fontSize,
    this.buttonWidth = 130,
    this.buttonHeight = 40,
    this.buttonColor,
    this.fontColor,
    this.onDecreaseQuantity,
    this.onIncreaseQuantity,
    this.shadowEnable = false,
    this.useStadiumBorderOnQuantityButton = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPhone = ResponsiveLayout.isPhone(context);
    final buttonColor =
        quantity > 0 ? theme.colorScheme.primary : theme.colorScheme.background;
    final textColor = quantity == 0 ? null : theme.colorScheme.background;

    return Container(
      padding: useStadiumBorderOnQuantityButton
          ? const EdgeInsets.all(sdPaddingXSmall)
          : EdgeInsets.zero,
      decoration: useStadiumBorderOnQuantityButton
          ? ShapeDecoration(
              shape: StadiumBorder(
                side: BorderSide(
                  style: quantity == 0 ? BorderStyle.solid : BorderStyle.none,
                  color: theme.colorScheme.outline,
                ),
              ),
              color: quantity == 0
                  ? Colors.transparent
                  : theme.colorScheme.primary.withOpacity(0.6),
            )
          : ShapeDecoration(
              color: buttonColor,
              shape: const StadiumBorder(),
            ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PlusMinusButton(
              icon: Icons.minimize,
              iconSize: fontSize,
              height: isPhone ? 25 : buttonHeight,
              iconBackgroundColor: useStadiumBorderOnQuantityButton
                  ? quantity == 0
                      ? null
                      : theme.colorScheme.primary
                  : buttonColor,
              onPressed: quantity <= 0 ? null : onDecreaseQuantity?.call,
              fontColor: useStadiumBorderOnQuantityButton ? null : textColor),
          const SizedBox(width: sdPaddingMedium),
          Text(
            quantity.toString(),
            style: theme.textTheme.headlineSmall!.copyWith(
              fontSize: fontSize,
              color: useStadiumBorderOnQuantityButton
                  ? quantity > 0
                      ? theme.colorScheme.background
                      : theme.colorScheme.tertiary
                  : textColor,
            ),
          ),
          const SizedBox(width: sdPaddingMedium),
          _PlusMinusButton(
              icon: Icons.add,
              iconSize: fontSize,
              height: isPhone ? 25 : buttonHeight,
              iconBackgroundColor: useStadiumBorderOnQuantityButton
                  ? quantity == 0
                      ? null
                      : theme.colorScheme.primary
                  : buttonColor,
              onPressed: onIncreaseQuantity,
              fontColor: useStadiumBorderOnQuantityButton ? null : textColor),
        ],
      ),
    );
  }
}

class _PlusMinusButton extends StatelessWidget {
  final IconData icon;
  final double height;
  final double iconSize;
  final Color? iconBackgroundColor;
  final VoidCallback? onPressed;
  final Color? fontColor;
  final bool useStadiumBorderOnQuantityButton;

  const _PlusMinusButton({
    required this.icon,
    required this.height,
    required this.iconSize,
    this.iconBackgroundColor,
    this.onPressed,
    this.fontColor,
    this.useStadiumBorderOnQuantityButton = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Opacity(
        opacity: onPressed != null ? 1.0 : 0.4,
        child: Container(
          width: height,
          height: height,
          padding: const EdgeInsets.all(0),
          decoration: useStadiumBorderOnQuantityButton
              ? ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(
                      style: iconBackgroundColor == null
                          ? BorderStyle.solid
                          : BorderStyle.none,
                      color: useStadiumBorderOnQuantityButton
                          ? theme.colorScheme.outline
                          : theme.colorScheme.background,
                    ),
                  ),
                  color: iconBackgroundColor,
                )
              : null,
          child: Center(
              child: Icon(
            icon,
            size: iconSize - 4,
            color:
                useStadiumBorderOnQuantityButton && iconBackgroundColor != null
                    ? theme.colorScheme.background
                    : fontColor,
          )),
        ),
      ),
    );
  }
}
