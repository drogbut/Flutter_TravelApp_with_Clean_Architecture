import 'package:flutter/material.dart';

/// [SdRadioListTile] is a radio with a label.
///
/// This widget allows to choose between multiple mutually exclusive values.
/// When a radio button in a group is selected, the other radio buttons in the
/// group cease to be selected.
///
/// An unselected color can be set in the theme with unselectedWidgetColor param.
/// However, using fill color in RadioThemeData affects unselectedWidgetColor.
/// The best practice is to use unselectedWidgetColor in theme and
/// activeColor in the custom widget.
///
/// Using of [Inkwell] is interactive: tapping anywhere in the tile selects the
/// radio button. As Flutter does not provide a parameter for scaling the button
/// diameter, the transform widget is used to fix this.  For convenience, to
/// scale the child uniformly, instead of providing `scaleX` and `scaleY`, the
/// `scale` parameter is used. [ref. 2022].
///
/// In Webshop 2.0 this widget is used, for example, in forms to choose between
/// male, female or other genders.
///
/// ```dart
/// enum UserGender { Man, Women, Others }
///
/// @override
/// Widget build(BuildContext context) {
///   return SizedBox(
///     width: double.maxFinite / 3,
///     child: SdRadioListTile<UserGender?>(
///        visualDensity: const VisualDensity(horizontal: -1),
///        title: Text(radioLabel.toString()),
///        value: UserGender.Man,
///        groupValue: radioLabel,
///        onChanged: (value) {
///           setState(() {
///             radioLabel = value!;
///        });
///     },
///    ),
///   );
/// }
///
/// ```
///
///
/// See also:
///
///   * [SdCheckboxListTile], a SIDES list tile with checkbox.
///   * [RadioListTile] a flutter radio button with a label
///   * material.io/design/components/selection-controls.html#radio-buttons

class SdRadioListTile<T> extends StatelessWidget {
  /// The primary content of the list tile.
  final Widget? title;

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for this group of radio buttons.
  final T groupValue;

  /// Called when the user selects this radio button.
  final ValueChanged<T?>? onChanged;

  /// The amount of space by which to inset the child.
  final EdgeInsetsGeometry padding;

  /// Where to place the control relative to the text.
  final ListTileControlAffinity controlAffinity;

  ///  * [ThemeData.visualDensity], which specifies the [visualDensity] for all
  ///    widgets within a [Theme].
  final VisualDensity? visualDensity;

  /// The horizontal spacing
  final double horizontalSpacing;

  const SdRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.horizontalSpacing = 0.0,
    this.title,
    this.visualDensity,
    this.padding = EdgeInsets.zero,
    this.controlAffinity = ListTileControlAffinity.platform,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget control = Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: Transform.scale(
        scale: 0.5,
        child: IgnorePointer(
          child: Radio<T>(
            value: value,
            onChanged: null,
            groupValue: groupValue,
            visualDensity: visualDensity,
          ),
        ),
      ),
    );

    return InkWell(
      onTap: () => onChanged?.call(value),
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            if (controlAffinity == ListTileControlAffinity.platform ||
                controlAffinity == ListTileControlAffinity.leading)
              control,
            if ((controlAffinity == ListTileControlAffinity.leading) ||
                (controlAffinity == ListTileControlAffinity.platform))
              SizedBox(width: horizontalSpacing),
            Expanded(
                child: Container(
              child: title,
            )),
            if (controlAffinity == ListTileControlAffinity.trailing) control,
          ],
        ),
      ),
    );
  }
}
