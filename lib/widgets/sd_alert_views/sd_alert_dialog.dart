import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/widgets/buttons/sd_floating_action_button.dart';
import 'package:travel_app/widgets/buttons/sd_icon_button.dart';
import 'package:travel_app/widgets/buttons/sd_primary_button.dart';
import 'package:travel_app/widgets/buttons/sd_secondary_button.dart';

/// [SdShowAlertDialog] is a SIDES dialog.
///
/// SdHowDialog informs the user about situations that required acknowledgement.
/// [SdShowAlertDialog] has a CloseButton, an required title,  an optional sub-title,
/// a optional body view, a list of actions and an optional trailing.
///
/// The icon is an [CloseButton] with a 'close' icon align at the top right.
/// When pressed, the close button calls [Navigator.maybePop] to return to the
/// previous route.
///
/// The [title] is displayed below the close button, the subtitle below the title
/// the content below the subtitle, the actions below the content and the trailing
/// widget below the actions: close->title->subtitle->content->actions->trailing.
///
/// If the content is too large to fit on the screen vertically, the dialog will
/// display the title and the actions and let the content overflow, which is
/// rarely desired. Wrap the scrolling widget for [content] in a SizedBox with
/// fix height to fix the issue.
///
/// ```dart
/// void upgradeEmailAddress({required BuildContext contextDialog}) {
///     SdShowDialog.showTwoActionsDialog(
///       contextDialog,
///       'E-MAIL ADRESSE BESTÄTIGEN',
///       subTitle: 'Wir haben Ihnen einen Code an die von Ihnen '
///           'angegebene Adresse geschickt. Bitte geben Sie diesen Code hier ein.'
///           ' Erst dann wird die Änderung übernommen.',
///       bodyView: SizedBox(
///         width: MediaQuery.of(contextDialog).size.width,
///         child: ListView(
///           shrinkWrap: true,
///           physics: const NeverScrollableScrollPhysics(),
///           children: const [
///             SdTextField(hintText: 'Code ', isPassword: false),
///           ],
///         ),
///       ),
///     );
///   }
/// ```
///
/// See also:
///
///   * [CloseButton] <https://api.flutter.dev/flutter/material/CloseButton-class.html>
///   * [AlertDialog] <https://api.flutter.dev/flutter/material/AlertDialog-class.html>
///   * [ModalBottomSheet] <https://api.flutter.dev/flutter/material/showModalBottomSheet.html>
class SdShowAlertDialog {
  /// The [showOneActionDialog] method displays an alert dialog with:
  ///   * A leading: The closing icon is displayed at the top right.
  ///   * A title: The (required) text of the dialog is displayed below the leading.
  ///   * A sub-title: The (optional) text of the dialog is displayed below the title.
  ///   * A content: The (optional) body view of the dialog is displayed below the
  ///     title/sub-title.
  ///   * The actions: A primary button that is displayed below the body view.
  ///   * A trailing: The (optional) widget is displayed below the actions.
  static Future<void> showOneActionDialog(
    final BuildContext context,
    final String title, {
    final String okButtonTitle = '',
    final String subTitle = '',
    final Widget? trailingWidget,
    final double? okButtonWidth,
    final Widget? bodyView,
    final double? dialogWidth = 1,
    final double? dialogHeight = 1,
    final TextStyle? textStyle,
    final TextStyle? subTitleStyle,
    final MainAxisAlignment? okButtonAlignment,
    final VoidCallback? onPressedOkBtn,
    final EdgeInsetsGeometry iconPadding = const EdgeInsets.symmetric(
        horizontal: sdPaddingMedium, vertical: sdPaddingSmall),
    final EdgeInsetsGeometry titlePadding =
        const EdgeInsets.all(sdPaddingLarge),
  }) =>
      showDialog(
          context: context,
          //barrierColor: ThemeConfig.barrierDismissibleColor,
          barrierDismissible: false,
          builder: (_) {
            return FractionallySizedBox(
              widthFactor: dialogWidth,
              heightFactor: dialogHeight,
              child: AlertDialog(
                insetPadding:
                    const EdgeInsets.symmetric(horizontal: sdPaddingLarge),
                titlePadding: titlePadding,
                contentPadding: const EdgeInsets.all(sdPaddingSmall),
                actionsPadding: const EdgeInsets.only(bottom: sdPaddingLarge),
                icon: Align(
                    alignment: Alignment.topRight,
                    child: SdIconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icons.close,
                    )),
                iconPadding: iconPadding,
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title,
                        style: textStyle ??
                            Theme.of(context).textTheme.headlineSmall),
                    if (subTitle.isNotEmpty)
                      const SizedBox(height: sdPaddingSmall),
                    if (subTitle.isNotEmpty)
                      Text(subTitle,
                          style: subTitleStyle ??
                              Theme.of(context).textTheme.labelSmall),
                  ],
                ),
                content: bodyView,
                actionsAlignment: okButtonAlignment,
                actions: [
                  if (okButtonTitle.isNotEmpty)
                    SizedBox(
                      width: okButtonWidth,
                      child: SdPrimaryButton(
                        onPressed: onPressedOkBtn,
                        title: 'labelOkay',
                      ),
                    ),
                  SizedBox(
                    child: trailingWidget,
                  )
                ],
              ),
            );
          });

  /// The [showOneActionDialogDesktop] method displays an alert dialog with:
  ///   * A icon: The closing icon is displayed at the top right.
  ///   * A title: The (required) text of the dialog is displayed below the leading.
  ///   * A content: The (optional) body view of the dialog is displayed below the
  ///     title.
  ///   * Use BackdropFilter to apply image effect
  ///   * close-button in same row with title
  static void showOneActionDialogDesktop(
    final BuildContext context,
    final String title, {
    final Widget? bodyView,
    final double? dialogWidth = 1,
    final double? dialogHeight = 1,
    final EdgeInsetsGeometry? iconPadding = const EdgeInsets.symmetric(
        horizontal: sdPaddingMedium, vertical: sdPaddingSmall),
  }) {
    showDialog(
        context: context,
        //barrierColor: ThemeConfig.barrierDismissibleColor,
        barrierDismissible: false,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: FractionallySizedBox(
              widthFactor: dialogWidth,
              heightFactor: dialogHeight,
              child: AlertDialog(
                insetPadding:
                    const EdgeInsets.symmetric(horizontal: sdPaddingLarge),
                contentPadding: const EdgeInsets.only(bottom: sdPaddingMedium),
                titlePadding: const EdgeInsets.all(sdPaddingSmall),
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(title,
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        const CloseButton()
                      ],
                    )
                  ],
                ),
                content: bodyView,
              ),
            ),
          );
        });
  }

  /// The [showTwoActionsDialog] method displays an alert dialog with:
  ///   * dialogWidth and dialogHeight are given as a percent relative to the context size
  ///   * A icon: The closing icon is displayed at the top right.
  ///   * A title: The (required) text of the dialog is displayed below the leading.
  ///   * A sub-title: The (optional) text of the dialog is displayed below the title.
  ///   * A bodyView: The (optional) content of the dialog is displayed below the
  ///     title/sub-title.
  ///   * The actions: One primary button and one secondary button that are displayed
  ///     at the bottom of the dialog.
  ///   * A trailing: The (optional) widget is displayed below the actions.
  static void showTwoActionsDialog(
    final BuildContext context,
    final String title, {
    final String? okBtnText,
    final String? cancelBtnText,
    final String subTitle = '',
    final TextStyle? subTitleStyle,
    final Widget? trailingWidget,
    final bool showBackButton = false,
    final Widget? bodyView,
    final double? cancelBtnWidth = 150,
    final double? okBtnWidth = 150,
    final Widget? controller,
    final double? dialogWidth = 1,
    final double? dialogHeight = 1,
    final MainAxisAlignment actionsButtonAlignment = MainAxisAlignment.center,
    final VoidCallback? onPressedCancelBtn,
    final VoidCallback? onBackBtn,
    final VoidCallback? onCloseBtn,
    final VoidCallback? onPressedOkBtn,
    final EdgeInsetsGeometry? iconPadding = EdgeInsets.zero,
  }) {
    showDialog(
        context: context,
        //barrierColor: ThemeConfig.barrierDismissibleColor,
        barrierDismissible: false,
        builder: (_) {
          return FractionallySizedBox(
            widthFactor: dialogWidth,
            heightFactor: dialogHeight,
            child: AlertDialog(
              insetPadding:
                  const EdgeInsets.symmetric(horizontal: sdPaddingLarge),
              contentPadding: EdgeInsets.zero,
              icon: showBackButton
                  ? GestureDetector(
                      onTap: onBackBtn,
                      child: ListTile(
                        minLeadingWidth: 0,
                        horizontalTitleGap: 0,
                        title: Text(
                          'labelBack',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.errorContainer),
                        ),
                        leading: SizedBox(
                            height: double.infinity,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color:
                                  Theme.of(context).colorScheme.errorContainer,
                              size: 20,
                            )),
                      ),
                    )
                  : Align(
                      alignment: Alignment.topRight,
                      child: SdIconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icons.close,
                      )),
              iconPadding: iconPadding,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headlineSmall),
                  if (subTitle.isNotEmpty)
                    const SizedBox(height: sdPaddingSmall),
                  if (subTitle.isNotEmpty)
                    Text(subTitle,
                        style: subTitleStyle ??
                            Theme.of(context).textTheme.labelSmall),
                ],
              ),
              content: bodyView,
              actionsPadding:
                  const EdgeInsets.symmetric(vertical: sdPaddingSmall),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: actionsButtonAlignment,
                  children: [
                    SizedBox(
                      width: cancelBtnWidth,
                      child: SdSecondaryButton(
                          onPressed: onPressedCancelBtn,
                          title: 'cancelBtnText'),
                    ),
                    const SizedBox(width: sdPaddingSmall),
                    SizedBox(
                      width: okBtnWidth,
                      child: SdPrimaryButton(
                          onPressed: onPressedOkBtn, title: 'okBtnText'),
                    ),
                  ],
                ),
                const SizedBox(height: sdPaddingSmall),
                Container(child: trailingWidget)
              ],
            ),
          );
        });
  }

  /// The [showFloatingDialog] method displays an alert dialog with:
  ///   * A icon: The closing icon is displayed at the top right.
  ///   * A title: The (required) text of the dialog is displayed below the leading.
  ///   * A sub-title: The (optional) text of the dialog is displayed below the title.
  ///   * A bodyView: The (optional) content of the dialog is displayed below the
  ///     title/sub-title.
  ///   * The actions: A floating button that is displayed below actions.
  ///   * A trailing: The (optional) widget is displayed below the actions.
  static void showFloatingDialog(
    final BuildContext context,
    final String title, {
    final String subTitle = '',
    final Widget? trailingWidget,
    final Widget? bodyView,
    final VoidCallback? onPressedFloatingBtn,
    final double? dialogWidth = 1,
    final double? dialogHeight = 1,
    bool noActionButton = false,
  }) {
    showDialog(
        context: context,
        //barrierColor: ThemeConfig.barrierDismissibleColor,
        barrierDismissible: false,
        builder: (_) {
          return FractionallySizedBox(
              widthFactor: dialogWidth,
              heightFactor: dialogHeight,
              child: AlertDialog(
                insetPadding:
                    const EdgeInsets.symmetric(horizontal: sdPaddingLarge),
                titlePadding: const EdgeInsets.all(sdPaddingLarge),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                contentPadding: const EdgeInsets.all(sdPaddingLarge),
                title: Column(
                  children: [
                    Align(alignment: Alignment.topRight, child: trailingWidget),
                    Column(
                      children: [
                        Text(title,
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: sdPaddingSmall),
                        Text(subTitle,
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                  ],
                ),
                content: bodyView,
                actionsPadding: const EdgeInsets.all(sdPaddingLarge),
                actions: <Widget>[
                  if (!noActionButton) ...[
                    Center(
                      child: SdFloatingActionButton(
                        iconData: Icons.close,
                        onPressed: onPressedFloatingBtn,
                        isSelected: false,
                        primaryColor: Theme.of(context).colorScheme.tertiary,
                        radius: 80,
                        padding: 4,
                      ),
                    ),
                    const SizedBox(height: sdPaddingSmall),
                  ]
                ],
              ));
        });
  }

  static void showNotificationDialog({
    required final BuildContext context,
    required final Widget content,
    final double? dialogWidth = 1,
    final double? dialogHeight = 1,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            widthFactor: dialogWidth,
            heightFactor: dialogHeight,
            child: AlertDialog(
              content: Column(
                children: [
                  Expanded(child: content),
                  SdPrimaryButton(
                      title: 'btnApply',
                      onPressed: () {
                        Navigator.maybePop(context);
                      })
                ],
              ),
            ),
          );
        });
  }

  /// This method displays a dialogue box with a fully customised body.
  /// Example when the onPressed behaviour interacts with the content part
  /// information, it is a good approach to manage all this in the same class.
  /// Exposing the parameters through the constructor often makes code difficult
  /// to read and to test.
  static Future<T?> showBasicDialog<T>({
    required final BuildContext context,
    final Widget? content,
    final String? title,
    final bool showCloseIcon = true,
    final bool scrollable = false,
    final Widget? firstRowWidget,
    final double insetPadding = 0.0,
    final bool barrierDismissible = true,
    final TextAlign? titleAlignment = TextAlign.center,
    final EdgeInsetsGeometry? iconPadding =
        const EdgeInsets.all(sdPaddingSmall),
    final EdgeInsetsGeometry? contentPadding = EdgeInsets.zero,
    final EdgeInsetsGeometry? titlePadding =
        const EdgeInsets.symmetric(horizontal: sdPaddingMedium),
  }) =>
      showDialog<T>(
          context: context,
          barrierDismissible: barrierDismissible,
          //barrierColor: ThemeConfig.barrierDismissibleColor,
          builder: (context) {
            return AlertDialog(
              insetPadding: EdgeInsets.all(insetPadding),
              scrollable: scrollable,
              icon: showCloseIcon
                  ? Align(
                      alignment: Alignment.topRight,
                      child: SdIconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icons.close,
                      ))
                  : const SizedBox.shrink(),
              iconPadding: showCloseIcon ? iconPadding : EdgeInsets.zero,
              titleTextStyle: Theme.of(context).textTheme.headlineLarge,
              titlePadding: titlePadding,
              title: title != null
                  ? Text(
                      title,
                      textAlign: titleAlignment,
                    )
                  : const SizedBox.shrink(),
              contentPadding: contentPadding,
              actionsPadding: const EdgeInsets.all(sdPaddingMedium),
              content: content,
            );
          });
}
