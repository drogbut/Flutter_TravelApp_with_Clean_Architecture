import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [SdSwitch] is use to toggle the on/off state of a single setting.
///
///  In the Webshop 2.0 project the Cupertino switch is used to be in agreement
///  with the received design. Because flutter does not provide parameters to
///  edit the height and width, the switch is wrapped in Transform and scale to
///  change the height.
///
/// This example produces a switch combined with a transformation widget.
///
/// ```dart
/// Transform.scale(
///   scale: 0.8,
///   child: SdSwitch(
///   value: isEnabled,
///      onChanged: (value) { },
///    ),
///   ),
/// ```
///
/// See also:
///   * [SwitchListTile], a switch with a label
///   * [SdToggleButton], a custom witch more labels
///   * [SdStepperWidget], use to display the history of an orders.

class SdSwitch extends StatelessWidget {
  /// Use to switch between on or off.
  final bool value;

  /// Called when the user toggles with switch on or off.
  final ValueChanged<bool>? onChanged;

  /// The color to use for the track when the switch is on.
  final bool isActiveColorPrimary;

  const SdSwitch({
    required this.value,
    required this.onChanged,
    this.isActiveColorPrimary = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: isActiveColorPrimary
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.tertiary,
      value: value,
      onChanged: onChanged,
    );
  }
}
