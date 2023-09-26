import 'package:flutter/material.dart';
import 'package:travel_app/config/routes/navigation_helper.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

/// [PageTitleBar] displays the title and the button for navigating back to the
/// previous page.
class PageTitleBar extends StatelessWidget {
  /// The page title.
  final String title;

  /// The callback when the back button is pressed.
  final VoidCallback? onBackPressed;

  /// TODO: can be deleted and refactoring the code.
  final Widget? trailingWidget;

  /// A flag to display the back button or not.
  final bool showBackArrow;

  const PageTitleBar({
    required this.title,
    this.onBackPressed,
    this.trailingWidget,
    this.showBackArrow = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: sdPaddingSmall),
      child: ListTile(
        minLeadingWidth: showBackArrow ? sdIconSizeMedium : 0.0,
        leading: showBackArrow
            ? InkWell(
                onTap: onBackPressed ??
                    () => NavigationHelper.goBackOrHome(context),
                child: CircleAvatar(
                  radius: sdIconSizeMedium,
                  backgroundColor: theme.colorScheme.background,
                  child: RotatedBox(
                      quarterTurns: 2,
                      child: Icon(Icons.arrow_drop_up,
                          color: theme.colorScheme.tertiary)),
                ),
              )
            : const SizedBox.shrink(),
        horizontalTitleGap: showBackArrow ? sdPaddingSmall : 0.0,
        contentPadding: EdgeInsets.zero,
        title: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.displaySmall?.copyWith(
              color: theme.colorScheme.tertiary,
            ),
          ),
        ),
        trailing: (trailingWidget == null && showBackArrow == false)
            ? null
            : const SizedBox(width: sdIconSizeMedium),
      ),
    );
  }
}
