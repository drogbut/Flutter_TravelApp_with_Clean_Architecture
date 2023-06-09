import 'package:flutter/material.dart';

/// [CouponPainter], is a painter of CustomPainter widget. CouponPainter paints
/// before the children.
///
/// When asked to paint, [CustomPaint] first asks its [painter] to paint on the
/// current canvas, then it paints its child, and then, after painting its
/// child, it asks its [foregroundPainter] to paint. The coordinate system of the
/// canvas matches the coordinate system of the [CustomPaint] object. The
/// painters are expected to paint within a rectangle starting at the origin and
/// encompassing a region of the given size. (If the painters paint outside
/// those bounds, there might be insufficient memory allocated to rasterize the
/// painting commands and the resulting behavior is undefined.) To enforce
/// painting within those bounds, consider wrapping this [CustomPaint] with a
/// [ClipRect] widget.
///
/// Painters are implemented by subclassing [CustomPainter].
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=kp14Y4uHpHs}
///
/// This example shows how the sample custom painter shown at [CustomPainter]
/// could be used in a [CustomPaint] widget to display a background to some
/// text.
///
/// ```dart
/// CustomPaint(
///   painter: Sky(),
///   child: const Center(
///     child: Text(
///       'Once upon a time...',
///       style: TextStyle(
///         fontSize: 40.0,
///         fontWeight: FontWeight.w900,
///         color: Color(0xFFFFFFFF),
///       ),
///     ),
///   ),
/// )
///
/// See also:
///
///  * [CouponPainter], a widget that draw during the painting phase.
///  * [CustomPainter], the class to extend when creating custom painters.
///  * [Canvas], the class that a custom painter uses to paint.
class CouponPainter extends CustomPainter {
  CouponPainter({
    required this.leftColor2,
    required this.leftColor1,
    required this.rightColor1,
    required this.rightColor2,
    required this.strokeColor,
    this.begin1 = Alignment.centerLeft,
    this.end1 = Alignment.centerRight,
    this.begin2 = Alignment.centerLeft,
    this.end2 = Alignment.centerRight,
    this.strokeWidth = 2,
  });

  final Color leftColor1;
  final Color rightColor1;
  final Alignment begin1;
  final Alignment end1;

  final Color leftColor2;
  final Color rightColor2;
  final Alignment begin2;
  final Alignment end2;
  final double strokeWidth;

  final Color strokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    Paint paint1 = Paint()
      ..shader = LinearGradient(
          begin: begin1,
          end: end1,
          colors: [leftColor1, rightColor1]).createShader(rect)
      ..style = PaintingStyle.fill;

    Paint paint2 = Paint()
      ..shader = LinearGradient(
          begin: begin2,
          end: end2,
          colors: [leftColor2, rightColor2]).createShader(rect)
      ..style = PaintingStyle.fill;

    Paint paint3 = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Path path1 = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.35)
      ..arcToPoint(Offset(0, size.height * 0.70),
          radius: const Radius.circular(10.0), clockwise: true)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.75, size.height)
      ..lineTo(size.width * 0.75, 0)
      ..close();
    canvas
      ..drawShadow(path1, Colors.black, 5, true)
      ..drawPath(path1, paint1);

    Path path2 = Path()
      ..moveTo(size.width * 0.75, 0)
      ..lineTo(size.width * 0.75, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.70)
      ..arcToPoint(Offset(size.width, size.height * 0.35),
          radius: const Radius.circular(10.0), clockwise: true)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.75, 0)
      ..close();
    canvas.drawPath(path2, paint2);
    Path path3 = Path()
      ..moveTo(size.width * 0.75, 0)
      ..lineTo(size.width * 0.75, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.70)
      ..arcToPoint(Offset(size.width, size.height * 0.35),
          radius: const Radius.circular(10.0), clockwise: true)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.75, 0)
      ..close();
    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
