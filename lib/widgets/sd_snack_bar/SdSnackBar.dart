import 'package:flutter/material.dart';
import 'package:travel_app/widgets/sd_cards/sd_notification.dart';

/// [SdSnackBar] is a SIDES Snackbar .
///
/// A custom snackbar used with SIDES notification styles, comes with 3 methods
/// [success], [warning], [error], which follows same pattern as [SdNotification]

class SdSnackBar {
  static void success(
    BuildContext context,
    String data, {
    final double? elevation,
    final EdgeInsets? padding = EdgeInsets.zero,
    final double? width,
    final SnackBarBehavior? behavior = SnackBarBehavior.floating,
  }) {
    final snackBar = SnackBar(
        behavior: behavior,
        backgroundColor: GetNotificationTypeColor.getColor(
            NotificationType.success, context),
        padding: padding,
        width: width,
        elevation: elevation,
        content: SdNotification(
          body: data,
          notificationType: NotificationType.success,
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void warning(
    BuildContext context,
    String data, {
    final double? elevation,
    final EdgeInsets? padding = EdgeInsets.zero,
    final double? width,
    final SnackBarBehavior? behavior = SnackBarBehavior.floating,
  }) {
    final snackBar = SnackBar(
        behavior: behavior,
        backgroundColor:
            GetNotificationTypeColor.getColor(NotificationType.info, context),
        padding: padding,
        width: width,
        elevation: elevation,
        content: SdNotification(
          body: data,
          notificationType: NotificationType.info,
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void error(
    BuildContext context,
    String data, {
    final double? elevation,
    final EdgeInsets? margin,
    final EdgeInsets? padding = EdgeInsets.zero,
    final double? width,
    final SnackBarBehavior? behavior = SnackBarBehavior.floating,
  }) {
    final snackBar = SnackBar(
        behavior: behavior,
        backgroundColor:
            GetNotificationTypeColor.getColor(NotificationType.error, context),
        padding: padding,
        width: width,
        elevation: elevation,
        content: SdNotification(
          body: data,
          notificationType: NotificationType.error,
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
