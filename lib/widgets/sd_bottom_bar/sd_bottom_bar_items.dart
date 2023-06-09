import 'package:flutter/material.dart';

/// A bottom bar container with an icon and a title
class SdBottomBarItem extends StatelessWidget {
  /// Constructors
  const SdBottomBarItem({
    required this.icon,
    required this.onPressed,
    required this.isSelected,
    this.label,
    Key? key,
  }) : super(key: key);

  /// The icon to display inside the button.
  final IconData icon;

  final String? label;

  /// The callback that is called when the button is tapped.
  final VoidCallback onPressed;

  /// The helper variable to inform if the icon is clicked.
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isSelected ? theme.primaryColor : theme.iconTheme.color;
    return SizedBox(
      // TODO: set this so text size fits and is also good for any screen
      width: 64,
      height: kBottomNavigationBarHeight + 10,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            if (label != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                child: Text(
                  label!,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontWeight: FontWeight.bold, color: color),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
