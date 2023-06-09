import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/responsive_layout.dart';

class SdStoreNotification extends StatelessWidget {
  final String? title;
  final String body;

  const SdStoreNotification({
    required this.body,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPhone = ResponsiveLayout.isPhone(context);

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.transparent,
      elevation: 0,
      color: Colors.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        title: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            title!,
            textAlign: TextAlign.center,
            style: isPhone
                ? theme.textTheme.titleLarge
                    ?.copyWith(color: theme.colorScheme.surface)
                : theme.textTheme.headlineSmall
                    ?.copyWith(color: theme.colorScheme.surface),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            body,
            textAlign: TextAlign.center,
            style: isPhone
                ? theme.textTheme.labelMedium
                : theme.textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
