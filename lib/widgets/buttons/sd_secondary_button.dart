import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_secondary_button_style.dart';

/// [SdSecondaryButton], a transparent custom button with a border.
///
/// [SdSecondaryButton] is the custom button, which is used as the secondary
/// button in all the app. The secondary button of the webshop 2.0 app can be
/// identified by its transparent background e.g. Cancel
///
/// TODO: ...
///
/// This sample produces a login webshop button.
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return SizedBox(
///     width: MediaQuery.of(context).size.width / 2.3,
///     child: SdSecondaryButton(
///       onPressed: () {},
///       title: 'Abbrechen',
///     )
///   );
/// }
///
/// ```
///
/// See also:
///
///  * [SdPrimaryButton], a color background custom button with a shader.
///  * [SdTertiaryButton], a simple text button without a shadow.
///  * [CloseButton] <https://api.flutter.dev/flutter/material/CloseButton-class.html>

class SdSecondaryButton extends StatelessWidget {
  /// The label for the button.
  final String title;

  /// The callback when the button is tapped.
  /// If this callback and onLongPress are null, then the button will be disabled.
  final VoidCallback? onPressed;

  /// The icon when the button has an icon
  final IconData? icon;

  /// A secondary button without icon
  const SdSecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  }) : icon = null;

  /// A secondary button with icon
  const SdSecondaryButton.icon({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonTheme = theme.extension<SdSecondaryButtonStyle>()!;

    /// I'm working on clean code for the buttons and I have a small question about SdSecondaryButton:
    ///
    /// 1) The implementation of what we have seems complex to me when we can
    ///  make it simple using the OutlinedButton widget. All the basic parameters
    ///  will simply be customised in sd_theme.dart in this case.
    ///
    /// 2) If not, I would like to know the necessity of using the extensions and
    ///  the Builder in this case. The answer to these questions will allow me to
    ///  adjust the documentation in this case.
    ///
    ///  At the last AllHands Tech, it was discussed to reduce the complexity in
    ///  the work in general. Thank you
    ///
    /// TODO (Alissa answer) : Approach 1 sounds good to me  We should generally do the
    /// customizations from the theme, when possible, instead of creating a new
    /// component.
    return Theme(
      data: theme.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(50, 50)),
            elevation: MaterialStateProperty.all(0),
            overlayColor: MaterialStateProperty.all(
                buttonTheme.overlayColor.withOpacity(0.1)),
            foregroundColor: MaterialStateProperty.all(buttonTheme.textColor),
            textStyle: MaterialStateProperty.all(
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: buttonTheme.borderColor, width: 2),
            )),
            backgroundColor:
                MaterialStateProperty.all(buttonTheme.backgroundColor),
          ),
        ),
      ),
      child: Builder(builder: (context) {
        return icon == null
            ? ElevatedButton(
                onPressed: onPressed,
                child: SelectionContainer.disabled(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : ElevatedButton.icon(
                icon: Icon(icon!),
                label: SelectionContainer.disabled(child: Text(title)),
                onPressed: onPressed,
              );
      }),
    );
  }
}
