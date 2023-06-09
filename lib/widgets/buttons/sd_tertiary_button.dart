import 'package:flutter/material.dart';

/// [SdTertiaryButton], a simple text button without a shadow.
///
/// [SdTertiaryButton] is the custom button, which is used as the tertiary
/// button in all the app. The tertiary button of the webshop 2.0 app can be
/// identified by its coloured background e.g. Legal notice, forgot password...
///
/// It is possible to have a tertiary button without an icon or with an icon.
/// This icon can be positioned to the left or right of the text.
///
///
/// This sample produces a user profile button in the webshop 2.0.
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return Padding(
///            padding: const EdgeInsets.only(left: sdPaddingLarge),
///            child: SdTertiaryButton(
///                     onPressed: () {
///                     NavigationHelper.goToProfile(context);
///                     Navigator.pop(context);
///                   },
///               title: appLocalizations.labelProfile,
///               textSize: 18,
///              ),
///             );
/// }
///
/// ```
/// See also:
///
///  * [SdPrimaryButton], a color background custom button with a shader.
///  * [SdSecondaryButton], a transparent custom button with a border.
///  * <https://material.io/design/components/buttons.html>

class SdTertiaryButton extends StatelessWidget {
  /// The label for the button.
  final String title;

  /// The callback when the icon is pressed.
  final VoidCallback? onPressed;

  /// The icon when the button has an icon
  final IconData? icon;

  /// Used to insert the icon before the label text
  final bool? trailingIcon;

  /// The label text color
  final Color? textColor;

  /// The label font weight
  final FontWeight? fontWeight;

  /// The text decoration
  final TextDecoration? textDecoration;

  /// The maximal label line.
  final int? textMaxLines;

  /// How overflowing text should be handled.
  final TextOverflow? textOverflow;

  /// The label text size
  final double? textSize;

  /// The label text padding
  final EdgeInsets? buttonPadding;

  const SdTertiaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.fontWeight = FontWeight.w600,
    this.textColor,
    this.textDecoration,
    this.textSize = 16,
    this.textMaxLines,
    this.textOverflow,
    this.buttonPadding,
  })  : icon = null,
        trailingIcon = null;

  const SdTertiaryButton.icon({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.trailingIcon = false,
    this.textColor,
    this.textDecoration,
    this.textMaxLines,
    this.textOverflow,
    this.textSize = 16,
    this.fontWeight = FontWeight.w600,
    this.buttonPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fontWeight = this.fontWeight;
    final titleWidget = SelectionContainer.disabled(
      child: Text(
        title,
        style: theme.textTheme.labelLarge?.copyWith(
          color: textColor,
          decoration: textDecoration,
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
        maxLines: textMaxLines,
        overflow: textOverflow,
      ),
    );
    final iconWidget = icon == null ? null : Icon(icon!, color: textColor);

    return icon == null
        ? TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              minimumSize: const Size(50, 50),
              padding: buttonPadding,
            ),
            child: titleWidget,
          )
        : TextButton.icon(
            style: TextButton.styleFrom(),
            icon: trailingIcon! ? titleWidget : iconWidget!,
            label: trailingIcon! ? iconWidget! : titleWidget,
            onPressed: onPressed,
          );
  }
}
