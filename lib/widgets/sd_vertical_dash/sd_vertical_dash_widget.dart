import 'package:flutter/material.dart';

/// The helper class for [SdStepWidget]
/// TODO: Can be move in the same file
class SdVerticalDashWidget extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final int numOfSteps;

  const SdVerticalDashWidget({
    required this.color,
    required this.width,
    required this.height,
    this.numOfSteps = 3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          numOfSteps,
          (index) => Container(
            width: width,
            height: height / (numOfSteps + numOfSteps - 1),
            color: color,
          ),
        ),
      ),
    );
  }
}
