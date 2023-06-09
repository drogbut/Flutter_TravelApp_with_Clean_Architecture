import 'package:flutter/material.dart';

/// TODO: Please delete this file and use one of existing button in the code.
class SdAnimatedTabButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isActive;
  final IconData? icon;
  final String label;
  final double? btnWidth;

  const SdAnimatedTabButton({
    required this.onPressed,
    required this.isActive,
    required this.label,
    this.icon,
    this.btnWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.labelMedium;

    return SizedBox(
      width: btnWidth,
      height: 40,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive
                ? theme.colorScheme.tertiary
                : theme.colorScheme.outline,
            width: 2,
          ),
        ),
        duration: const Duration(milliseconds: 640),
        curve: Curves.ease,
        child: TextButton(
          onPressed: onPressed,
          child: FittedBox(
            child: icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        size: 20,
                        color: theme.colorScheme.onBackground,
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        label,
                        style: textStyle,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      label,
                      style: textStyle,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
