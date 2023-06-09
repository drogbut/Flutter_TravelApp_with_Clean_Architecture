import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/widgets/buttons/sd_floating_action_button.dart';
import 'package:travel_app/widgets/buttons/sd_primary_button.dart';
import 'package:travel_app/widgets/buttons/sd_secondary_button.dart';


class SdShowBottomSheetDialog {
  /// one actions
  static void showOneActionMBS(BuildContext context,
      String title, {
        String? okBtnText,
        String subTitle = '',
        Widget? leadingWidget,
        Widget? trailingWidget,
        Alignment titleAlignment = Alignment.centerLeft,
        Alignment trailingAlignment = Alignment.center,
        Widget? bodyView,
        double paddingLeft = 20,
        double paddingRight = 20,
        bool enableDragging = true,
        VoidCallback? onPressedOkBtn,
        double Function()? getWidthFactor,
      }) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: enableDragging,
        isScrollControlled: true,
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        builder: (_) {
          return FractionallySizedBox(
            widthFactor: getWidthFactor?.call(),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  leadingWidget == null
                      ? const SizedBox.shrink()
                      : Container(
                    alignment: Alignment.topRight,
                    child: leadingWidget,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: paddingLeft,
                      right: paddingRight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        title == ''
                            ? const SizedBox.shrink()
                            : Container(
                          margin: (leadingWidget == null)
                              ? const EdgeInsets.only(top: 40)
                              : const EdgeInsets.only(top: 0),
                          alignment: titleAlignment,
                          child: Text(
                            title,
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .headlineSmall,
                          ),
                        ),
                        Container(
                          margin: (subTitle.isEmpty)
                              ? EdgeInsets.zero
                              : const EdgeInsets.only(top: 10, bottom: 10),
                          alignment: titleAlignment,
                          child: Text(subTitle,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .labelSmall),
                        ),
                        if (bodyView != null) bodyView,
                        const SizedBox(height: sdPaddingXLarge),
                        SdPrimaryButton(
                          onPressed: onPressedOkBtn,
                          title: 'okBtnText',
                        ),
                        (trailingWidget != null)
                            ? const SizedBox(height: sdPaddingSmall)
                            : const SizedBox(height: sdPaddingXLarge),
                        Container(
                          alignment: trailingAlignment,
                          child: trailingWidget,
                        ),
                        (trailingWidget != null)
                            ? const SizedBox(height: sdPaddingSmall)
                            : const SizedBox.shrink(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  /// two actions
  static void showTwoActionsMBS(BuildContext context, String title,
      {String? okBtnText,
        String? cancelBtnText,
        String subTitle = '',
        Widget? leadingWidget,
        Widget? trailingWidget,
        Alignment titleAlignment = Alignment.centerLeft,
        Alignment trailingAlignment = Alignment.center,
        Widget? bodyView,
        double paddingLeft = 20,
        double paddingRight = 20,
        double paddingTop = 20,
        double paddingBottom = 20,
        VoidCallback? onPressedCancelBtn,
        VoidCallback? onPressedOkBtn}) {
    final double mainSheetWidth = MediaQuery
        .of(context)
        .size
        .width;

    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        builder: (_) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: leadingWidget,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: paddingLeft,
                      right: paddingRight,
                      bottom: paddingBottom,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: (leadingWidget == null)
                              ? const EdgeInsets.only(top: 40)
                              : const EdgeInsets.only(top: 0),
                          alignment: titleAlignment,
                          child: Text(
                            title,
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineSmall,
                          ),
                        ),
                        Container(
                          margin: (subTitle.isEmpty)
                              ? const EdgeInsets.only(top: 0)
                              : const EdgeInsets.only(top: 10, bottom: 10),
                          alignment: titleAlignment,
                          child: Text(subTitle,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall),
                        ),
                        Container(child: bodyView),
                        const SizedBox(height: sdPaddingXLarge),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: mainSheetWidth / 2.3,
                              child: SdSecondaryButton(
                                onPressed: onPressedCancelBtn,
                                title: 'cancelBtnText',
                              ),
                            ),
                            SizedBox(
                              width: mainSheetWidth / 2.3,
                              child: SdPrimaryButton(
                                onPressed: onPressedOkBtn,
                                title: 'okBtnText',
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: sdPaddingSmall),
                        Container(
                          alignment: trailingAlignment,
                          child: trailingWidget,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  /// one actions
  static void showFloatingActionMBS(BuildContext context, String title,
      {String subTitle = '',
        EdgeInsets? titlePadding,
        Widget? leadingWidget,
        Widget? trailingWidget,
        Alignment titleAlignment = Alignment.centerLeft,
        Alignment trailingAlignment = Alignment.center,
        Widget? bodyView,
        double paddingLeft = 20,
        double paddingRight = 20,
        double paddingBtnLeft = 20,
        double paddingBtnRight = 20,
        Color? titleBgColor,
        VoidCallback? onPressedFloatingBtn}) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .onSecondary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        builder: (context) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: leadingWidget,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: (leadingWidget == null)
                                ? const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20)
                                : const EdgeInsets.only(top: 0),
                            alignment: titleAlignment,
                            color: titleBgColor,
                            child: Text(title,
                                style:
                                Theme
                                    .of(context)
                                    .textTheme
                                    .headlineMedium),
                          ),
                          Container(
                            margin: (subTitle.isEmpty)
                                ? const EdgeInsets.only(top: 0)
                                : const EdgeInsets.only(top: 10, bottom: 10),
                            alignment: titleAlignment,
                            child: Text(subTitle,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .labelSmall),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: paddingLeft,
                                right: paddingRight,
                              ),
                              child: bodyView,
                            ),
                          ),
                          Container(
                            alignment: trailingAlignment,
                            child: trailingWidget,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: (MediaQuery
                    .of(context)
                    .size
                    .width / 2) -
                    (paddingBtnLeft + paddingBtnRight),
                child: SdFloatingActionButton(
                  iconData: Icons.close,
                  onPressed: onPressedFloatingBtn,
                  isSelected: false,
                  primaryColor: Theme
                      .of(context)
                      .colorScheme
                      .secondary,
                  iconSize: 25,
                  radius: 80,
                  padding: 4,
                ),
              )
            ],
          );
        });
  }

  ///No action
  static void showNoActionMBS(BuildContext context,
      String title, {
        String subTitle = '',
        EdgeInsets? titlePadding,
        Widget? leadingWidget,
        Widget? trailingWidget,
        Alignment titleAlignment = Alignment.centerLeft,
        Alignment leadingAlignment = Alignment.center,
        Alignment trailingAlignment = Alignment.center,
        required Widget bodyView,
        double padding = sdPaddingLarge,
        Color? titleBgColor,
        CrossAxisAlignment bodyWidgetAlignment = CrossAxisAlignment.start,
        bool unShowTitle = false,
      }) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .background,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: bodyWidgetAlignment,
              children: [
                if (unShowTitle) ...[
                  Align(alignment: leadingAlignment, child: leadingWidget),
                  bodyView
                ] else
                  ...[
                    Align(alignment: leadingAlignment, child: leadingWidget),
                    Container(
                      padding: (leadingWidget == null)
                          ? EdgeInsets.symmetric(
                        vertical: padding,
                        horizontal: 8,
                      )
                          : EdgeInsets.symmetric(
                          horizontal: 8),
                      alignment: titleAlignment,
                      color: titleBgColor,
                      child: Text(title,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineMedium),
                    ),
                    Container(
                      margin: (subTitle.isEmpty)
                          ? const EdgeInsets.only(top: 0)
                          : EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8),
                      alignment: titleAlignment,
                      child: Text(subTitle,
                          style: Theme
                              .of(context)
                              .textTheme
                              .labelSmall),
                    ),
                    bodyView,
                    Container(
                        alignment: trailingAlignment, child: trailingWidget)
                  ]
              ],
            ),
          );
        });
  }
}
