import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

enum NotificationType {
  success(Icons.gps_off_outlined),
  error(Icons.add),
  info(Icons.add);

  final IconData iconData;

  const NotificationType(this.iconData);
}

class SdNotification extends StatelessWidget {
  final String? title;
  final String body;
  final IconData? leftIcon;

  final NotificationType notificationType;

  const SdNotification({
    required this.body,
    required this.notificationType,
    this.title,
    this.leftIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      color: GetNotificationTypeColor.getColor(notificationType, context)
          .withOpacity(0.2),
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        leading: SizedBox(
          height: double.infinity,
          child: Icon(
            notificationType.iconData,
            color: GetNotificationTypeColor.getColor(notificationType, context),
            size: 34,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(sdPaddingXSmall),
          child: Text(
            body,
            style: theme.textTheme.labelMedium?.copyWith(
                color: GetNotificationTypeColor.getColor(
                    notificationType, context)),
          ),
        ),
      ),
    );
  }
}

class GetNotificationTypeColor {
  static Color getColor(NotificationType type, BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    switch (type) {
      case NotificationType.error:
        return theme.error;

      case NotificationType.success:
        return theme.primary;
      default:
    }

    //TODO infotype color?

    return Colors.yellow;
  }
}
