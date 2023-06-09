import 'package:flutter/material.dart';
import 'package:travel_app/widgets/badges/sd_counter_badge.dart';

/// [SdFloatingActionButton], a custom rounded button with border and shader.
///
/// [SdFloatingActionButton] is the custom button, which is used as the floating
/// button in all the app. The floating button of the webshop 2.0 app can be
/// identified by its background, shader and rounder corners e.g. shoppingCard
///
/// the floating button is an icon wrapper in three circular containers with
/// different [radius]. The biggest container has a fixed radius, the second
/// container has a radius -10 and the last one has a radius -20.
///
/// The FAB can contain a number at the top right. To build it, wrap the FAB and
/// [CounterBadge] it in a [Stack], then wrap it in a [FittedBox].
///
/// This sample produces a shopping card webshop floating button.
///
/// ```dart
/// @override
///   Widget build(BuildContext context) {
///     return SdFloatingActionButton(
///       iconData: Icons.homeTakeaway,
///       onPressed: () {},
///     );
///   }
/// ```
///
/// See also:
///
///  * [SdPrimaryButton], a color background custom button with a shader.
///  * [FittedBox] {@youtube 560 315 https://www.youtube.com/watch?v=T4Uehk3_wlY}
///  * <https://material.io/design/components/buttons.html>

class SdFloatingActionButton extends StatelessWidget {
  /// The icon contain in the circle
  final IconData iconData;

  /// The callback when the icon is pressed.
  final VoidCallback? onPressed;

  /// TODO: As isSelected is not used in the build, delete it
  final bool? isSelected;

  /// The radius of the first container
  final double radius;

  /// The icon size inside the container
  final double iconSize;

  /// The padding container
  final double padding;

  /// The floating icon color
  final Color? iconColor;

  /// The main color in the container
  final Color? primaryColor;

  /// The background color
  final Color? backgroundColor;

  /// A number to show as a badge to the top right of the button.
  final int? badgeCount;

  const SdFloatingActionButton({
    required this.iconData,
    required this.onPressed,
    required this.isSelected,
    this.radius = 100,
    this.iconSize = 40,
    this.padding = 7.5,
    this.iconColor,
    this.primaryColor,
    this.backgroundColor,
    this.badgeCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor =
        backgroundColor ?? theme.colorScheme.background;
    final mainColor = primaryColor ?? theme.colorScheme.primary;
    final effectiveIconColor = iconColor ?? theme.colorScheme.onPrimary;
    final floatingIcon = Card(
      elevation: 4,
      shadowColor: mainColor,
      color: effectiveBackgroundColor,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Container(
        foregroundDecoration: onPressed == null
            ? const BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
              )
            : null,
        width: radius - 10,
        height: radius - 10,
        padding: EdgeInsets.all(padding),
        child: Container(
          width: radius - 20,
          height: radius - 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: mainColor,
          ),
          child: IconButton(
            icon: Icon(
              iconData,
              size: iconSize,
              color: effectiveIconColor,
            ),
            onPressed: onPressed,
            color: mainColor,
          ),
        ),
      ),
    );
    if (badgeCount == null) {
      return floatingIcon;
    }

    return FittedBox(
      child: Stack(
        children: [
          floatingIcon,
          CounterBadge(count: badgeCount!),
        ],
      ),
    );
  }
}
