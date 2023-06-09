import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/widgets/buttons/sd_primary_button.dart';
import 'package:travel_app/widgets/buttons/sd_tertiary_button.dart';

class SdCardHeadlineLeft extends StatefulWidget {
  final String cardHeadline;
  final String? cardSubheadline;
  final Widget headlineLeftBodyCard;
  final bool isExpandable;
  final bool hasButtonRight;
  final String? buttonRightText;
  final bool extraLineBeforeExpanded;
  final bool? isPrimaryButton;
  final VoidCallback? onPressedRightButton;
  final double marginTop;
  final bool initiallyExpanded;
  final bool isTileDescendantsAreFocusable;
  final bool isTileFocusable;
  final Widget? trailingWidget;

  const SdCardHeadlineLeft({
    super.key,
    required this.cardHeadline,
    required this.headlineLeftBodyCard,
    required this.isExpandable,
    required this.hasButtonRight,
    required this.extraLineBeforeExpanded,
    this.cardSubheadline,
    this.buttonRightText,
    this.onPressedRightButton,
    this.marginTop = sdPaddingLarge,
    this.isPrimaryButton = false,
    this.initiallyExpanded = false,
    this.trailingWidget,
    this.isTileDescendantsAreFocusable = true,
    this.isTileFocusable = true,
  });

  @override
  State<SdCardHeadlineLeft> createState() => _SdCardHeadlineLeftState();
}

class _SdCardHeadlineLeftState extends State<SdCardHeadlineLeft> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.hardEdge,
      // TODO: remove marginTop (margins should be set from the parent of this
      // widget, only when needed)
      margin: EdgeInsets.only(top: widget.marginTop),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: widget.isExpandable
          ? Focus(
              descendantsAreFocusable: widget.isTileDescendantsAreFocusable,
              canRequestFocus: widget.isTileFocusable,
              child: ExpansionTile(
                tilePadding:
                    const EdgeInsets.symmetric(horizontal: sdPaddingMedium),
                initiallyExpanded: widget.initiallyExpanded,
                iconColor: theme.colorScheme.outline,
                collapsedIconColor: theme.colorScheme.outline,
                title: Text(
                  widget.cardHeadline,
                  style: theme.textTheme.titleMedium,
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: sdPaddingMedium,
                    ),
                    child: widget.headlineLeftBodyCard,
                  )
                ],
                onExpansionChanged: (expanding) =>
                    setState(() => isExpanded = expanding),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(sdPaddingMedium),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  widget.hasButtonRight
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.cardHeadline,
                                    style: theme.textTheme.titleMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    widget.cardSubheadline ?? '',
                                    style: theme.textTheme.labelMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            widget.isPrimaryButton!
                                ? SdPrimaryButton(
                                    title: widget.buttonRightText ?? '',
                                    onPressed: widget.onPressedRightButton)
                                : SdTertiaryButton(
                                    title: widget.buttonRightText ?? '',
                                    onPressed: widget.onPressedRightButton),
                          ],
                        )
                      : Text(widget.cardHeadline,
                          style: theme.textTheme.titleMedium),
                  widget.cardSubheadline != null
                      ? const SizedBox(height: sdPaddingSmall * 0.8)
                      : const SizedBox(height: sdPaddingSmall),
                  if (!widget.hasButtonRight && widget.cardSubheadline != null)
                    SizedBox(
                      height: sdPaddingSmall * 3.5,
                      width: sdWidth * 30,
                      child: Text(
                        widget.cardSubheadline ?? '',
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.headlineLeftBodyCard,
                      ])
                ],
              ),
            ),
    );
  }
}
