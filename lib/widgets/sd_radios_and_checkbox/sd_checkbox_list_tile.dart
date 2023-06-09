import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

/// [SdCheckboxListTile] is a checkbox with a label and error handling.
///
/// Using of [Inkwell] is interactive: tapping anywhere in the tile selects the
/// radio button. It is better to use Transform.scale() to manage the size of
/// the checkbox. Flutter does not have a property to change it. As scale makes
/// the checkbox large [ref. 2022].
///
/// To validate a checkbox, embed it in a FormField<T> widget and use the state
/// to customise the error box and style.
///
/// This sample produces the checkbox for contactless delivery.
///
/// ```dart
/// class ContactLessDelivery extends StatelessWidget {
///   final bool? isContactlessDelivery;
///   const ContactLessDelivery({
///     super.key,
///     required this.isContactlessDelivery,
///   });
///
///   @override
///   Widget build(BuildContext context) {
///     final theme = Theme.of(context);
///
///     return  SdCheckboxListTile(
///             title: Column(
///               crossAxisAlignment: CrossAxisAlignment.start,
///               children: [
///                 Padding(
///                   padding: const EdgeInsets.only(top: sdPaddingSmall),
///                   child: Text('Contactless Delivery'),
///                 ),
///                 Text('description', style: theme.textTheme.labelSmall),
///               ],
///             ),
///             controlAffinity: ListTileControlAffinity.leading,
///             value: isContactlessDelivery,
///             onChanged: (_){},
///     );
///   }
/// }
/// ```
///
/// See also:
///
///   * [SdRadioListTile], a SIDES list tile with radio.
///   * [CheckboxListTile] A flutter ListTile with a Checkbox.
///   * material.io/design/components/selection-controls.html#radio-buttons

class SdCheckboxListTile extends StatelessWidget {
  /// Whether this checkbox is checked.
  final bool? value;

  final bool? isRequired;

  /// Called when the value of the checkbox should change.
  final ValueChanged<bool?>? onChanged;

  /// The primary content of the list tile.
  final Widget? title;

  /// The outside padding
  final EdgeInsetsGeometry padding;

  /// Where to place the control relative to the text.
  final ListTileControlAffinity controlAffinity;

  /// An optional method to call with the final value when the form is saved via
  /// [FormState.save].
  final FormFieldSetter<bool?>? onSaved;

  /// An optional method that validates an input. Returns an error string to
  /// display if the input is invalid, or null otherwise.
  final FormFieldValidator<bool?>? validator;

  /// An optional value to initialize the form field to, or null otherwise.
  final bool initialValue;

  /// Used to configure the auto validation of [FormField] and [Form] widgets.
  final AutovalidateMode? autovalidateMode;

  const SdCheckboxListTile({
    Key? key,
    required this.value,
    required this.onChanged,
    this.title,
    this.padding = EdgeInsets.zero,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.onSaved,
    this.validator,
    this.initialValue = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormField<bool>(
      builder: (state) {
        /// the custom checkbox
        final Widget sdCheckBox = Transform.scale(
          scale: 0.5,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            side: BorderSide(
              color: state.errorText != null || isRequired == true
                  ? theme.colorScheme.error
                  : theme.colorScheme.outline,
              width: 2,
            ),
          ),
        );

        /// The error container widget
        final Widget errorBox = Row(
          children: [
            const RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.info_outline_rounded,
                size: sdIconSizeMedium,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: sdPaddingXSmall),
            Text('labelMandatoryField',
                style: theme.textTheme.labelMedium!
                    .copyWith(color: theme.colorScheme.error))
          ],
        );

        return InkWell(
          onTap: () => onChanged?.call(value),
          child: Column(
            children: [
              Padding(
                padding: padding,
                child: Row(
                  children: [
                    if (controlAffinity == ListTileControlAffinity.leading)
                      sdCheckBox,
                    if (controlAffinity == ListTileControlAffinity.leading)
                      const SizedBox(width: sdPaddingSmall),
                    Expanded(child: Container(child: title)),
                    if (controlAffinity == ListTileControlAffinity.platform ||
                        controlAffinity == ListTileControlAffinity.trailing)
                      sdCheckBox,
                  ],
                ),
              ),
              if (state.errorText == null)
                const SizedBox(height: sdPaddingSmall),
              //display error in matching theme
              if (state.errorText != null) errorBox
            ],
          ),
        );
      },
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
    );
  }
}
