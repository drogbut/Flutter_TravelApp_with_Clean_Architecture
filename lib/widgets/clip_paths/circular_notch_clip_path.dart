import 'package:flutter/material.dart';

/// Used to create a circular notch in components, like a cutout for a
/// [FloatingActionButton] inside a bottom navigation bar. The [extraPadding]
/// optional parameter can be used to adjust how far inside is the cutout.
///
/// In its implementation, this widget uses [CircularNotchedRectangle], which
/// is the same class used by Flutter to create a docked floating action button
/// in the [BottomNavigationBar].
///
/// For example, if you have a floating action button that is centered
/// horizontally in the screen and has a diameter of `fabDiameter`, and you
/// want `YourWidget` to have a cutout around it, you would use it like this:
/// ```dart
/// CircularNotchClipPath(
///   center: Offset(screenWidth / 2, 0),
///   radius: 0.5 * fabDiameter,
///   child: YourWidget(),
/// )
/// ```
///
/// See also:
/// * [ToppingExpandableBottomBarView], which uses this widget
class CircularNotchClipPath extends ClipPath {
  CircularNotchClipPath({
    required Offset center,
    required double radius,
    required Widget child,
    double extraPadding = 3,
    Key? key,
  }) : super(
          key: key,
          child: child,
          clipper: _CircularNotchClipper(
            circle: Rect.fromCircle(center: center, radius: radius),
            extraPadding: extraPadding,
          ),
        );
}

class _CircularNotchClipper extends CustomClipper<Path> {
  _CircularNotchClipper({required this.circle, required this.extraPadding});

  final Rect circle;
  final double extraPadding;

  final _shape = const CircularNotchedRectangle();

  @override
  Path getClip(Size size) {
    final paddedCircle = Rect.fromCircle(
        center: circle.center, radius: circle.width / 2 + extraPadding);
    return _shape.getOuterPath(Offset.zero & size, paddedCircle);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
