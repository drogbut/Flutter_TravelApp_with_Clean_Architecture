import 'package:flutter/material.dart';

/// Displays a badge with a number that will be automatically aligned to the top
/// right. A custom [size] can be set. If the [count] is greater than
/// [maxCount], then `${number}+` will be displayed.
///
/// Example use:
/// ```dart
/// Stack(
///   children: [
///     YourWidget(),
///     CounterBadge(count: _badgeNumber),
///   ],
/// )
/// ```
///
/// See also:
/// * [SdFloatingActionButton], where this component is used.
/// * [FiltersButton], where this component is used.
class CounterBadge extends StatelessWidget {
  /// The number displayed in the badge (up to [maxCount]).
  final int count;

  /// The width and height of the badge. The text inside will be scaled to fit.
  final double size;

  /// The maximum count that will be displayed. Aything above will be displayed
  /// as `${max}+`.
  final int maxCount;

  final showBadgeBorder;

  const CounterBadge({
    required this.count,
    this.size = 35,
    this.maxCount = 99,
    this.showBadgeBorder = true,
    Key? key,
  }) : super(key: key);

  String get _displayCount {
    if (count > maxCount) {
      return '$maxCount+';
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (count == 0) {
      return const SizedBox();
    }
    return Positioned(
      top: 3,
      right: 10,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          // TODO(Alissa): use colors from theme once they are integrated
          border: Border.all(
              color: theme.scaffoldBackgroundColor,
              width: showBadgeBorder ? size * 0.12 : 0.0),
          shape: BoxShape.circle,
          color: theme.colorScheme.error,
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              _displayCount,
              style: TextStyle(
                fontSize: size * 0.46,
                color: theme.colorScheme.onError,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
