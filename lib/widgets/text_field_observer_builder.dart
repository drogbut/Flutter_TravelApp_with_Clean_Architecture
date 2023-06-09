import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

/// [TextFieldObserverBuilder] exposes a [TextEditingController] to the child,
/// which allows us to bind any [TextField] to a [mobx.Observable] value.
///
/// If the observable field returned by [getText] is updated, the consuming
/// [TextField] will also be updated via [TextEditingController]. If the
/// ancestor is rebuilt, the composition state will not be lost, as is usually
/// the case.
///
/// ```dart
/// TextFieldObserverBuilder(
///   getText: () => vm.name,
///   builder: (context, controller) {
///     return TextField(
///       controller: controller,
///       onChanged: (value) => vm.name = text,
///     );
///   },
/// );
/// ```
///
/// See also:
///   * [TextField] A Material Design text field.
///   * [TextFormField], which integrates with the [Form] widget.
///   * Cookbook: [Focus and text fields](https://flutter.dev/docs/cookbook/forms/focus)

class TextFieldObserverBuilder extends StatefulWidget {
  /// The getter for the [mobx.Observable] value to be displayed
  final ValueGetter<String?> getText;

  /// The builder which exposes the [TextEditingController] to the child
  final Widget Function(BuildContext context, TextEditingController controller)
      builder;

  const TextFieldObserverBuilder({
    required this.getText,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFieldObserverBuilder> createState() =>
      _TextFieldObserverBuilderState();
}

class _TextFieldObserverBuilderState extends State<TextFieldObserverBuilder> {
  /// A controller for an editable text field.
  late TextEditingController controller;

  /// A callable class that is used to dispose a [reaction], [autorun] or [when]
  late ReactionDisposer _reactionDisposer;

  @override
  void initState() {
    controller = TextEditingController(text: widget.getText());
    _reactionDisposer = _createReaction(false);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TextFieldObserverBuilder oldWidget) {
    if (oldWidget.getText != widget.getText) {
      _reactionDisposer();
      _reactionDisposer = _createReaction(true);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _reactionDisposer();
    controller.dispose();
    super.dispose();
  }

  ReactionDisposer _createReaction(bool fireImmediately) =>
      reaction<String?>((_) => widget.getText(), (value) {
        if (value == null || value.isEmpty) {
          controller.clear();
          return;
        }

        controller.value = controller.value.copyWith(text: value);
      }, fireImmediately: fireImmediately);

  @override
  Widget build(BuildContext context) => widget.builder(context, controller);
}
