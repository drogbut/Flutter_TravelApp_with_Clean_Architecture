import 'package:flutter/material.dart';

import '../../styleguide/responsive_layout.dart';
import '../../styleguide/sd_constants.dart';

/// [SdToggleButton] is use to toggle between the left/right widget.
///
///  In the Webshop 2.0 application, this widget is used to switch between two
///  options - Delivery, Pickup - of the storeFinder.
///
/// Basically an icon and a label are placed in a [row]. As the width differs
/// between small and large screens, they are then wrapped in a [ConstrainedBox]
/// before being placed as children of [ToggleButtons]. isSelected is the
/// selection state corresponding to each toggle button.
///
/// This example display a store finder in Webshop 2.0.
///
/// ```dart
///     SizedBox(
///       height: 64,
///       child: SdToggleButton(
///          largeScreenBtnWidth: 200,
///          smallScreenBtnWidth: 150,
///          selectedState: SdToggleButtonSelection.right,
///          rightText: 'takeAway',
///          leftText: 'delivery',
///          onChanged: (state) {},
///         ),
///       ),
/// ```
///
/// See also:
///   * [SwitchListTile], a switch with a label
///   * [SdToggleButton], a custom witch more labels
///   * [ToggleButtons], a set of toggle buttons.

class SdToggleButton extends StatelessWidget {
  /// /// The icon displayed on the right
  final IconData rightIcon;

  /// /// The icon displayed on the left
  final IconData leftIcon;

  /// /// The text displayed on the right and below the right icon
  final String rightText;

  /// /// The text displayed on the left and below the left icon
  final String leftText;

  /// The selected toggle button
  final SdToggleButtonSelection selectedState;

  /// The button width in the small screen
  final double smallScreenBtnWidth;

  /// The button width in the large screen
  final double largeScreenBtnWidth;

  /// /// The callback when the button is tapped.
  final ValueChanged? onChanged;

  const SdToggleButton({
    required this.rightText,
    required this.leftText,
    required this.selectedState,
    this.rightIcon = Icons.add,
    this.leftIcon = Icons.home,
    this.onChanged,
    this.smallScreenBtnWidth = 150,
    this.largeScreenBtnWidth = 200,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = ResponsiveLayout.isComputer(context) ||
        ResponsiveLayout.isLargeTablet(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      ),
      child: ToggleButtons(
        isSelected: [
          selectedState == SdToggleButtonSelection.left,
          selectedState == SdToggleButtonSelection.right
        ],
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  (isLargeScreen ? largeScreenBtnWidth : smallScreenBtnWidth) -
                      2,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(
                      isLargeScreen ? sdPaddingMedium : sdPaddingSmall),
                  child: Icon(leftIcon),
                ),
                const SizedBox(width: 2),
                Text(
                  leftText,
                )
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  (isLargeScreen ? largeScreenBtnWidth : smallScreenBtnWidth) -
                      2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(rightText),
                const SizedBox(width: 2),
                Padding(
                  padding: EdgeInsets.all(
                      isLargeScreen ? sdPaddingMedium : sdPaddingSmall),
                  child: Icon(rightIcon),
                ),
              ],
            ),
          )
        ],
        onPressed: (newIndex) {
          if (newIndex == 0) {
            onChanged?.call(SdToggleButtonSelection.left);
          } else {
            onChanged?.call(SdToggleButtonSelection.right);
          }
        },
      ),
    );
  }
}
