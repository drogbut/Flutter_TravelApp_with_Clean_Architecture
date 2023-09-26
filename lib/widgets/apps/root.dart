import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:travel_app/styleguide/responsive_layout.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/widgets/apps/sd_floating_action_button/sd_floating_button.dart';
import 'package:travel_app/widgets/sd_sidebar_modal/sd_sidebar_modal.dart';

/// Root is the customize scaffold for the app
///
/// See Also:
///   * [SdSidebarModalController] This widget is used to display sidebar modals
///   * [Scaffold] implements the basic Material Design visual layout structure
///   * [LayoutBuilder] builds a widget tree that can depend on the parent widget's size
class Root extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
    double sidePadding,
  ) bodyBuilder;

  final PreferredSizeWidget? customAppbar;
  final bool useNestedScrollView;
  final List<Widget> additionalAppBars;
  final Widget? customNavBar;
  final bool useNavBar;
  final bool displayFloatingAction;
  final bool useCustomNavBarPadding;
  final bool hideSearch;

  const Root({
    required this.customAppbar,
    super.key,
    required this.bodyBuilder,
    this.useNestedScrollView = false,
    this.additionalAppBars = const [],
    this.customNavBar,
    this.useNavBar = true,
    this.displayFloatingAction = true,
    this.useCustomNavBarPadding = false,
    this.hideSearch = false,
  });

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SdSidebarModalController(
        child: LayoutBuilder(builder: (context, constraints) {
          /// Responsive params
          final bool isComputer = ResponsiveLayout.isComputer(context);
          final bool isLargeTablet = ResponsiveLayout.isLargeTablet(context);
          final bool isTablet = ResponsiveLayout.isTablet(context);

          /// Scaling of app adding
          final double sidePadding = constraints.maxWidth >
                  ResponsiveLayout.largeTabletLimit
              ? (constraints.maxWidth - ResponsiveLayout.largeTabletLimit) / 2
              : sdPaddingLarge;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: widget.customAppbar,
            //endDrawer: const SdDrawer(),
            extendBody: true,
            /*bottomNavigationBar: Padding(
              padding: widget.useCustomNavBarPadding
                  ? EdgeInsets.symmetric(horizontal: sidePadding)
                  : EdgeInsets.zero,
              child: widget.customNavBar ??
                  ((isComputer || isLargeTablet || isTablet) ||
                          !widget.useNavBar
                      ? null
                      : const SdBottomNavigationBar()),
            ),*/
            floatingActionButton: (isComputer || isLargeTablet || isTablet) ||
                    !widget.displayFloatingAction
                ? null
                : Observer(builder: (context) {
                    return const SdFloatingButton(
                      badgeCount: 3,
                    );
                  }),
            floatingActionButtonLocation:
                (isComputer || isLargeTablet || isTablet)
                    ? null
                    : FloatingActionButtonLocation.centerDocked,
            body: SafeArea(
              bottom: false,
              child: widget.useNestedScrollView
                  ? NestedScrollView(
                      headerSliverBuilder: (_, __) => widget.additionalAppBars,
                      body:
                          widget.bodyBuilder(context, constraints, sidePadding),
                    )
                  : Column(
                      children: [
                        ...widget.additionalAppBars.map(
                          (e) => Container(
                            color: Theme.of(context).colorScheme.surface,
                            padding:
                                EdgeInsets.symmetric(horizontal: sidePadding),
                            child: e,
                          ),
                        ),
                        Flexible(
                          child: widget.bodyBuilder(
                            context,
                            constraints,
                            sidePadding,
                          ),
                        ),
                      ],
                    ),
            ),
          );
        }),
      ),
    );
  }
}
