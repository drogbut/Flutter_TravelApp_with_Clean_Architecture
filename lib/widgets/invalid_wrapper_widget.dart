import 'package:flutter/material.dart';

class InvalidWrapperWidget extends StatelessWidget {
  final Widget child;
  final bool invalidating;

  const InvalidWrapperWidget({
    Key? key,
    required this.child,
    this.invalidating = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!invalidating) {
      return child;
    }

    return AbsorbPointer(
      child: Container(
        foregroundDecoration: const BoxDecoration(
          color: Colors.white,
          backgroundBlendMode: BlendMode.hue,
        ),
        child: child,
      ),
    );
  }
}
