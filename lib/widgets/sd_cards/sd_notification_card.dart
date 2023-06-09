import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

/// [SdNotificationCard] is the custom widget, which is used as the base widget
/// to display notifications.
///
/// The background flow is used to notify an error, a progress or a success.
/// [SdNotificationCard] is composed of a font, an icon on the left  and the
/// description.
///
/// The following code is an example of screen 119 of the webshop 2.0 app
///
/// ```dart
///   Widget notificationComponent1({required BuildContext context}) {
///     return SdNotificationCard(
///       onPressed: () {},
///       message: const Text('Ihre persönlichen Daten wurden erfolgreich...'),
///       bgColor: sdPrimaryNotification,
///       iconColor: sdSuccessDark,
///     );
///   }
/// ```
///
/// See also:
///
///  * [SdCard] is the custom widget, which is used to build the card components
///     on webshop 2.0, a transparent custom button with a border.
///  * [SdArticleTileHorizontal] displays the article card on horizontal mode.
///  * [SdShowBottomSheetDialog] A class to build different modal bottom sheet
class SdNotificationCard extends Card {
  SdNotificationCard({
    required VoidCallback onPressed,
    required Widget message,
    required Color bgColor,
    Color iconColor = Colors.lightGreen,
    double radius = sdRadius,
    IconData iconData = Icons.info_outline,
    Key? key,
  }) : super(
          key: key,
          color: bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  icon: Icon(iconData),
                  onPressed: onPressed,
                  color: iconColor,
                ),
                Flexible(child: message)
              ],
            ),
          ),
        );
}
