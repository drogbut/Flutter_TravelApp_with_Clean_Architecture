import 'package:flutter/material.dart';

/// [TVConstants] contains the used constants in the app.
///
/// Keys
/// - Padding is the space between elements within a component.
/// - Dimensions describe the width and height of component elements.
/// - Alignment is the placement of elements within a component.
/// - Factor specifies the percentage: e.g. 0.7 equals 70%
/// - Elevation is the relative distance between two surfaces along the z-axis.
/// - Shadows provide cues about depth, direction of movement, and surface edges
/// - Opacity is the quality of being  obscure  or transparency.
/// - Duration inform how long a transition lasts?
/// - The article is a widget (card) specific to POS app.
///
/// See also:
///
///  * Spacing methods at <https://material.io/design/layout/spacing-methods.html>
///  * The Material spec on touch targets at <https://material.io/design/usability/accessibility.html#layout-typography>.
class MyConstants {
  MyConstants._();

  static String kTemplate = 'template';

  /// The app name
  static const String appName = "Travel App";

  /// Default zero
  static const double zero = 0.0;

  /// Elevation
  static const double elevationZero = 0.0;
  static const double elevationXSmall = 2.0;
  static const double elevationSmall = 4.0;
  static const double elevationMedium = 8.0;
  static const double elevationLarge = 16.0;

  /// Duration
  static const Duration durationSmall = Duration(milliseconds: 100);
  static const Duration durationMedium = Duration(milliseconds: 300);
  static const Duration durationLarge = Duration(milliseconds: 500);

  /// Factor
  static const double factor20 = 0.2;
  static const double factor50 = 0.5;
  static const double factor80 = 0.8;
  static const double factor100 = 1.0;

  /// Toolbar & Appbar
  static const double toolbarHeight = 68.0;
  static const double toolbarHeightExtended = 128.0;

  /// Drawer
  static const double drawerWidth = 256.0;
  static const double drawerLayoutTitleHeight = 64.0;
  static const double drawerLayoutItemHeight = 48.0;
  static const EdgeInsets drawerHorizontalPadding =
      EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets drawerVerticalPadding =
      EdgeInsets.symmetric(vertical: 16.0);

  /// Border radius
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;

  static const double borderRadiusXLarge = 16.0;
  static const double borderRadiusXXLarge = 20.0;

  /// Border side width
  static const double borderWidthSmall = 1.0;
  static const double borderWidthMedium = 2.0;
  static const double borderWidthLarge = 3.0;

  /// Opacity
  static const double opacityFactorSmall = 0.2;
  static const double opacityFactorMedium = 0.5;
  static const double opacityFactorLarge = 0.8;
  static const double opacityFactorOpaque = 1.0;

  /// Buttons & Icon-Buttons
  static const double buttonHeightSmall = 24.0;
  static const double buttonHeightMedium = 44.0;
  static const double buttonHeightLarge = 40.0;

  static const double buttonWidthSmall = 8.0;
  static const double buttonWidthMedium = 16.0;
  static const double buttonWidthLarge = 40.0;

  static const double iconSizeSmall = 20.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 36.0;
  static const double iconSizeXLarge = 54.0;
  static const double iconSizeXXLarge = 96.0;

  /// Padding & Margin
  static const double paddingSmall = 4.0;
  static const double paddingMedium = 8.0;
  static const double paddingLarge = 12.0;
  static const double paddingXLarge = 16.0;
  static const double paddingXXLarge = 24.0;

  /// Dialog
  static const double dialogWidthSmall = 300.0;
  static const double dialogWidthMedium = 400.0;
  static const double dialogWidthLarge = 764.0;

  static const double dialogHeightSmall = 300.0;
  static const double dialogHeightMedium = 400.0;
  static const double dialogHeightLarge = 468.0;
  static const double dialogHeightXLarge = 674.0;

  ///POS Article card size
  static const double articleCardWidth = 132.0;
  static const double articleCardHeightSmall = 60.0;
  static const double articleCardHeightMedium = 132.0;

  /// dropdown Menu
  static const double dropdownButtonHeight = 19.0;

  /// calender modal height on iOS
  static const double inputFieldWidthFacPortrait = 3.7;
  static const double inputFieldWidthFac = 3.4;
}
