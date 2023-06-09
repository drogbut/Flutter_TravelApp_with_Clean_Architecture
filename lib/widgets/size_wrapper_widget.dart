import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// wrapper widget used to return the size of [child]
class SizeWrapperWidget extends StatelessWidget {
  final Widget child;
  final ValueSetter<Size> sizeCallback;

  ///if true the callback is triggered on screen resize
  final bool callOnResize;

  const SizeWrapperWidget({
    Key? key,
    required this.child,
    required this.sizeCallback,
    this.callOnResize = false,
  }) : super(key: key);

  @override
  StatelessElement createElement() => _SizeWrapperElement(this);

  @override
  Widget build(BuildContext context) => child;
}

class _SizeWrapperElement extends StatelessElement {
  _SizeWrapperElement(SizeWrapperWidget widget) : super(widget);

  SizeWrapperWidget get _sizeWrapperWidget => widget as SizeWrapperWidget;

  @override
  Widget build() {
    if (_sizeWrapperWidget.callOnResize) {
      _updateSize();
    }

    return super.build();
  }

  @override
  void mount(Element? parent, dynamic newSlot) {
    super.mount(parent, newSlot);
    _updateSize();
  }

  /// sometimes if the widget disappears fast enough the [size] inside
  /// [mount] is no longer valid so we try to get the size from [deactivate]
  @override
  void deactivate() {
    _updateSize();
    super.deactivate();
  }

  void _updateSize() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      try {
        final Size? currentSize = size;
        if (currentSize == null) {
          /*logger.e(
            '_SizeWrapperElement._updateSize developer error',
            BusinessException(
              message: 'Tried to update null size',
            ),
            null,
          );*/

          return;
        }

        _sizeWrapperWidget.sizeCallback.call(currentSize);
      } catch (_) {}
    });
  }
}
