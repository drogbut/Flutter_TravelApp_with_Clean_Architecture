import 'package:flutter/material.dart';

/// [SdSecondaryRectangleIconButton] is a secondary icon button of the app.
///
/// [SdSecondaryRectangleIconButton] is a custom icon button used as a secondary
/// icon button in all app. The secondary icon button in the webshop 2.0 app is
/// an icon contained in a square and can be identified by its coloured
/// background, for example the coupon component.
///
/// By default it is a 48px square containing a 32px icon with 5px corners.
/// These values can be edited via ThemeConfig - if they differ from one
/// application to another - or via the class constants - if they are the same
/// for all apps.
///
/// To build the coupon component of the app, SdSecondaryRectangleIconButton is
/// combined with a textfiled in the example below:
///
/// ```dart
///  Row(
///     crossAxisAlignment: CrossAxisAlignment.center,
///      children: [
///         Expanded(
///           child: Container(
///             decoration: BoxDecoration(
///               borderRadius: BorderRadius.circular(5.0),
///                ),
///              child: Padding(
///                 padding: const EdgeInsets.only(left: 15),
///                 child: TextFormField(
///                     decoration: InputDecoration(
///                       hintText: appLocalizations.btnEnterVoucherCode,
///                       filled: true,
///                       fillColor: theme.colorScheme.surface,
///                        ),
///                      ),
///                    ),
///                   ,
///                  ),
///             const SizedBox(width: 10),
///             SdSecondaryRectangleIconButton(
///                 icon: Icons.checkBoxCheck,
///                 onPressed: () {},
///                 )
///                ],
///              ),
///
/// ```
///
/// See also:
///  * [SdSecondaryButton], a transparent custom button with a border.
///  * [SdRectangleIconButton], a primary icon button of the app.
///  * [CloseButton] <https://api.flutter.dev/flutter/material/CloseButton-class.html>

class SdSecondaryRectangleIconButton extends StatelessWidget {
  /// The icon contain in the square
  final IconData icon;

  /// The callback when the icon is tapped.
  final VoidCallback? onPressed;

  const SdSecondaryRectangleIconButton({
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //disabledForegroundColor: ThemeConfig.elevatedBtnDisableForeground,
        //disabledBackgroundColor: ThemeConfig.elevatedBtnDisableBackground,
        elevation: 0,

        /// TODO : Use ThemeConfig to set constant value or constants class if same value for in the app
        minimumSize: const Size.square(48),
        fixedSize: const Size.square(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.zero,
        side: BorderSide.none,
      ),
      onPressed: onPressed,
      child: Icon(icon, size: 32),
    );
  }
}
