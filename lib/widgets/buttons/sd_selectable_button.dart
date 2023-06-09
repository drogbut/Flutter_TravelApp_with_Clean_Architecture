import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

/// TODO: Delete this file and refactoring the code with another  custom widget
/// [SdSlectableButton], a simple text button which matches tapable menu button design.
///
/// [SdSlectableButton] is the custom button, which is used as the selectable
/// button in all the app. The selectable button of the webshop 2.0 app can be
/// identified by tapped and untapped colors
///
/// The selectable button has a [Text] widget as a child. The Text widget displays
/// a string of text with single style. The string might break across multiple
/// lines or might all be displayed on the same line depending on the layout
/// constraints.
///
///
/// If the [onPressed] callbacks are null, then this
/// button will be disabled, it will not react to touch.
///
/// This sample produces a forgot password webshop 2.0 button.
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return SizedBox(
///     child: SdSlectableButton(
///       onPressed: () {},
///       label: 'Data',
///       bool: true,
///     )
///   );
/// }
///
/// ```
/// See also:
///
///  * [SdPrimaryButton], a color background custom button with a shader.
///  * [SdSecondaryButton], a transparent custom button with a border.
///  * <https://material.io/design/components/buttons.html>
///
/// [label] must not be null.
/// [titletitle] must not be null.
class SdSlectableButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onPressed;
  final String label;

  const SdSlectableButton({
    required this.label,
    Key? key,
    this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: isSelected
                ? theme.colorScheme.primaryContainer
                : theme.colorScheme.background,
            borderRadius: BorderRadius.circular(sdRadius)),
        height: 40,
        //width: 140,
        child: Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground),
        ),
      ),
    );
  }
}
