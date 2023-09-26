import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// [StoreLogoButton] is a widget that displays the application's logo.
///
/// A flag is used to manage light and dark mode. The size of the logo will be
/// used to responsively manage padding/margin in the appbar.
///
/// See also:
///   * [SvgPicture] a widget that renders an SVG picture from an [AssetBundle]
///   * [InkWell] A rectangular area of a [Material] that responds to touch
class StoreLogoButton extends StatelessWidget {
  const StoreLogoButton({Key? key}) : super(key: key);

  /// TODO: Better to move in appbar file or constants file
  static const logoSize = 160.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String shopIcon;
    if (theme.brightness == Brightness.dark) {
      shopIcon = 'assets/images/travel_logo.svg';
    } else {
      shopIcon = 'assets/images/travel_logo.svg';
    }

    return InkWell(
      onTap: () {
        //NavigationHelper.goToHomeScreen(context);
      },
      hoverColor: Colors.transparent,
      child: SvgPicture.asset(
        shopIcon,
        semanticsLabel: 'Shop Icon',
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
