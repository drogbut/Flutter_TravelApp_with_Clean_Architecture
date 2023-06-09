import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';


/// [SdRectangleIconButton] is a primary icon button of the app.
///
/// [SdRectangleIconButton] is a custom icon button used as a primary
/// icon button in all app. The primary icon button in the webshop 2.0 app is
/// an icon contained in a square with the badge and can be identified for
/// example the filter button component.
///
/// By default it is an icon contained in a square with a Badge. The max counter
/// is 99, and the Badget does not display when the count is null and displays
/// in the upper right corner in other cases. ThemeConfig is used in this case
/// to more customization.
///
/// This sample produce the filter app
///
/// ```dart
///   SdRectangleIconButton(
///       count: filtersCount,
///       badgeColor: theme.colorScheme.primary,
///       icon: Icons.productsFilter,
///        onPressed: () => showFiltersDialog(context),
///     )
/// ```
///
/// See also:
///  * [SdSecondaryRectangleIconButton], aa secondary icon button of the app.
///  * [SdRectangleIconButton], a primary icon button of the app.
///  * [CloseButton] <https://api.flutter.dev/flutter/material/CloseButton-class.html>

///TODO : The name should be SdPrimaryRectangleIconButton for the coherence
class SdRectangleIconButton extends StatelessWidget {
  /// The icon contain in the square.
  final IconData icon;

  /// The badge count to display
  final int count;

  /// The max badge count
  final int maxCount;

  /// The callback when the icon is tapped.
  final VoidCallback? onPressed;

  /// The badge background color
  final Color? badgeColor;

  final bool showStadiumBorderFilterBtn;
  final bool showBadgeCount;
  final bool highlightFilterButtonWhenFiltersSelected;
  final bool badgeTopPosition;

  const SdRectangleIconButton({
    required this.icon,
    required this.onPressed,
    this.badgeColor,
    this.count = 0,
    this.maxCount = 99,
    this.showStadiumBorderFilterBtn = false,
    this.showBadgeCount = true,
    this.highlightFilterButtonWhenFiltersSelected = true,
    this.badgeTopPosition = true,
    Key? key,
  }) : super(key: key);

  /// Add the + letter if the counter is at its maximum or display the counter.
  String get _displayCount {
    if (count > maxCount) {
      return '$maxCount+';
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: sdPaddingSmall, vertical: 0),
        decoration: ShapeDecoration(
          shape: showStadiumBorderFilterBtn
              ? const StadiumBorder()
              : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: showBadgeCount
              ? count <= 0
              ? theme.colorScheme.background
              : highlightFilterButtonWhenFiltersSelected
              ? theme.colorScheme.secondary
              : theme.colorScheme.primary
              : Colors.grey,
        ),
        child: badges.Badge(
          position: badgeTopPosition
              ? badges.BadgePosition.topEnd(top: 2, end: -9)
              : badges.BadgePosition.topEnd(end: -12),
          elevation: 0,
          borderSide: BorderSide(color: theme.colorScheme.onPrimary),
          toAnimate: false,
          badgeContent: showBadgeCount
              ? Text(
            _displayCount,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onError,
            ),
          )
              : const SizedBox(
            height: 4,
            width: 4,
          ),
          badgeColor: badgeColor ?? theme.colorScheme.error,
          showBadge: count > 0,
          child: IconButton(
            icon: Icon(
              icon,
              color: showBadgeCount
                  ? count <= 0
                  ? theme.colorScheme.onBackground
                  : theme.colorScheme.onPrimary
                  : theme.colorScheme.onPrimary,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
