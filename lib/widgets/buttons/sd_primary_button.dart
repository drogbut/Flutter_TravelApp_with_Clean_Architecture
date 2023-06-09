import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

/// [SdPrimaryButton] is a color background custom button with a shader.
///
/// [SdPrimaryButton] is the custom button, which is used as the primary
/// button in all the app. The primary button of the webshop 2.0 app can be
/// identified by its coloured background e.g. Login, Register, Let's Go...
///
/// The primary button has a [Text] widget as a child. The Text widget displays
/// a string as title with single style. [title] must not be null. The title
/// might break across multiple lines or might all be displayed on the same
/// line depending on the layout constraints.
///
/// The static method [styleFrom] is a convenient way to edit the button style
/// from simple values. But for state customizations - Disable, hover, pressed,
/// default -ElevatedButtonThemeData has been used from the sd_theme.dart file.
///
/// To give the length of the button relative to the screen, the widget is
/// wrapped in a SizeBox using the MediaQuery.of() method as shown in the
/// example below.
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return SizedBox(
///     width: MediaQuery.of(context).size.width * 0.70,
///     child: SdPrimaryButton(
///       onPressed: () {},
///       title: 'Login',
///     )
///   );
/// }
///
/// ```
/// If [onTap] and [onLongPress] callbacks are null, then the button will
/// be disabled.
///
/// See also:
///  * [SdSecondaryButton], a transparent custom button with a border.
///  * [SdTertiaryButton], a simple text button without a shadow.
///  * [CloseButton] <https://api.flutter.dev/flutter/material/CloseButton-class.html>

class SdPrimaryButton extends ElevatedButton {
  SdPrimaryButton({
    required String title,
    required VoidCallback? onPressed,
    OutlinedBorder? shape,
    VoidCallback? onLongPress,
    double horizontalPadding = sdPaddingLarge,
    Key? key,
  }) : super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,

          /// TODO: Use MaterialStateProperty() instead styleFrom() to enable hover, pressed, disable
          style: ElevatedButton.styleFrom(
            disabledForegroundColor: Colors.red,
            disabledBackgroundColor: Colors.yellow,
            shape: shape,
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          ),

          /// TODO: It is important to put text into a disable selection container ?
          child: SelectionContainer.disabled(
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
        );
}
