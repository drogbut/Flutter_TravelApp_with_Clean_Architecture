import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:travel_app/inline_cart_scaffold.dart';
import 'package:travel_app/styleguide/responsive_layout.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/widgets/apps/sd_appbar/store_logo_button.dart';
import 'package:travel_app/widgets/badges/sd_counter_badge.dart';
import 'package:travel_app/widgets/buttons/sd_icon_button.dart';
import 'package:travel_app/widgets/buttons/sd_tertiary_button.dart';

/// The [SdAppbar] is the custom appbar of webshop 2.0.
///
/// [SdAppbar] is separated into three panels: leftPanel contains the logo;
/// centerPanel contains an optional title, rightPanel which contains actions
/// and the Drawer menu.
///
/// [SdAppbar] are typically used in the [Scaffold.appBar] property, which places
/// the app bar as a fixed-height widget at the top of the screen. To constrain
/// [SdAppbar] to use the AppBar properties, [PreferredSizeWidget] interface mus
/// implemented.
///
/// The following code is a part of the widget-true at the base of webshop 2.0.
/// ```dart
/// Widget build(BuildContext context) {
///   return Scaffold(
///     appBar: const SdAppbar(),
///     endDrawer: const SdDrawer(),
///     endDrawer: const SdDrawer(),
///     body: SafeArea()
///   );
/// }
/// ```
///
/// See also:
///
///  * [AppBar], a material design app bar with fixed height.
///  * [SliverAppBar], a material design app bar that integrate custom effects.
///  * [CustomScrollView] a ScrollView with custom scroll effects using slivers.
class SdAppbar extends StatefulWidget implements PreferredSizeWidget {
  /// The appbar title
  final Widget? title;

  /// The callback when the shopping-cart icon is pressed
  final VoidCallback? onOpenShoppingCart;

  /// Displays the search icon or not
  final bool hideSearch;

  const SdAppbar({
    this.title,
    this.hideSearch = false,
    this.onOpenShoppingCart,
    Key? key,
  }) : super(key: key);

  static const ValueKey profileButtonKey = ValueKey('profile_button_key');

  @override
  State<SdAppbar> createState() => _SdAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SdAppbarState extends State<SdAppbar> {
  @override
  Widget build(BuildContext context) {
    final isPhone = ResponsiveLayout.isPhone(context);

    return LayoutBuilder(builder: (context, constraints) {
      final double sidePadding =
          constraints.maxWidth > ResponsiveLayout.largeTabletLimit
              ? (constraints.maxWidth - ResponsiveLayout.largeTabletLimit) / 2
              : sdPaddingMedium;
      return AppBar(
        leadingWidth: isPhone
            ? StoreLogoButton.logoSize
            : sidePadding + StoreLogoButton.logoSize,
        leading: Padding(
          padding: EdgeInsets.only(
              left: sidePadding, top: sdPaddingSmall, bottom: sdPaddingSmall),
          child: const StoreLogoButton(),
        ),
        title: widget.title,
        actions: [rightPanel(context, sidePadding)],
      );
    });
  }

  /// The right sd_appbar panel
  Widget rightPanel(BuildContext context, final double padding) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = ResponsiveLayout.isTablet(context);

    if (ResponsiveLayout.isPhone(context) || isTablet) {
      return Row(
        children: [
          StoreLocationWidget(),
          StoreSelectButton(
            isStoreSelected: () {
              //return viewModel.hasStoreSelected;
            },
          ),
          if (ResponsiveLayout.isTablet(context)) ...[
            SdIconButton(
              padding: EdgeInsets.zero,
              icon: Icons.add,
              iconSize: 16,
              onPressed: () {
                /*if (!viewModel.isLoggedIn) {
                  //LoginRegisterPage.show(context);
                } else {
                  //NavigationHelper.goToFavScreen(context);
                }*/
              },
            ),
            SdIconButton(
              padding: EdgeInsets.zero,
              key: SdAppbar.profileButtonKey,
              onPressed: () {
                /* if (viewModel.isLoggedIn) {
                  //NavigationHelper.goToProfile(context);
                } else {
                  //LoginRegisterPage.show(context);
                }*/
              },
              icon: Icons.person_off,
              iconSize: 36,
            ),
            Stack(
              children: [
                SdIconButton(
                  padding: EdgeInsets.zero,
                  icon: Icons.add,
                  iconSize: 36,
                  onPressed: () {
                    //NavigationHelper.goToShoppingCart(context);
                  },
                ),
                Observer(
                  builder: (context) => const CounterBadge(
                    count: 9,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
          if (!widget.hideSearch)
            SdIconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                //NavigationHelper.goToSearch(context);
              },
              icon: Icons.search,
              iconSize: 16,
            ),
          SdIconButton(
            padding: EdgeInsets.zero,
            iconSize: 16,
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            icon: Icons.add,
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StoreLocationWidget(/*() => viewModel.selectedStore*/),
        StoreSelectButton(
          isStoreSelected: () {
            //return viewModel.hasStoreSelected;
          },
        ),
        //if (!widget.hideSearch) const SDSearchComponent(),
        SdIconButton(
          padding: EdgeInsets.zero,
          icon: Icons.add,
          iconSize: 16,
          onPressed: () {
            /*if (!viewModel.isLoggedIn) {
              //LoginRegisterPage.show(context);
            } else {
              //NavigationHelper.goToFavScreen(context);
            }*/
          },
        ),
        if (screenHeight < InlineCartScaffold.minScreenHeightForInlineCart)
          Stack(
            children: [
              SdIconButton(
                icon: Icons.add,
                iconSize: 16,
                onPressed: () {
                  //NavigationHelper.goToShoppingCart(context);
                },
              ),
              Observer(
                builder: (context) => const CounterBadge(
                  count: 7,
                  size: 20,
                ),
              ),
            ],
          ),
        SdIconButton(
          padding: EdgeInsets.zero,
          key: SdAppbar.profileButtonKey,
          onPressed: () {
            /*if (viewModel.isLoggedIn) {
              //NavigationHelper.goToProfile(context);
            } else {
              //LoginRegisterPage.show(context);
            }*/
          },
          icon: Icons.person,
          iconSize: 16,
        ),
        Stack(
          children: [
            SdIconButton(
              icon: Icons.add,
              onPressed: widget.onOpenShoppingCart?.call,
            ),
            Observer(
              builder: (context) => CounterBadge(
                count: 7,
                size: 20,
              ),
            ),
          ],
        ),
        SdIconButton(
          padding: EdgeInsets.zero,
          iconSize: 16,
          onPressed: Scaffold.of(context).openEndDrawer,
          icon: Icons.add,
        ),
        SizedBox(
          width: padding,
        )
      ],
    );
  }
}

class StoreLocationWidget extends StatelessWidget {
  const StoreLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPhone = ResponsiveLayout.isPhone(context);
    return Observer(builder: (context) {
      //final MandantStore? customerStoreModel = customerStore();

      //final String storeName = customerStoreModel?.name ?? '';
      final button = SdTertiaryButton.icon(
        title: 'storeName',
        textMaxLines: 1,
        textOverflow: TextOverflow.ellipsis,
        icon: Icons.add,
        textColor: Theme.of(context).colorScheme.onBackground,
        onPressed: () {
          /* StoreDetailsPage.show(
          context,
        );*/
        },
      );

      return ConstrainedBox(
        ///TODO fix and organize all appbar, drawer in
        ///scaffold, treat all cases etc
        constraints: const BoxConstraints(maxWidth: 110),
        child: button,
      );
    });
  }
}

class StoreSelectButton extends StatelessWidget {
  final Function() isStoreSelected;

  const StoreSelectButton({
    required this.isStoreSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPhone = ResponsiveLayout.isPhone(context);

    return Observer(builder: (context) {
      return InkWell(
        onTap: () {
          //NavigationHelper.goToStoreFinder(context);
        },
        child: Container(
          width: isPhone ? 100 : 200,
          height: 35,
          color: theme.colorScheme.primary,
          padding: const EdgeInsets.all(sdPaddingSmall),
          alignment: Alignment.center,
          child: SelectionContainer.disabled(
            child: Text(
              'labelStoreSelect',
              style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onBackground,
                  fontSize: 16,
                  overflow:
                      isPhone ? TextOverflow.ellipsis : TextOverflow.visible),
            ),
          ),
        ),
      );
    });
  }
}
