import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:travel_app/styleguide/responsive_layout.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/styleguide/tv_constants.dart';
import 'package:travel_app/widgets/apps/sd_appbar/store_logo_button.dart';
import 'package:travel_app/widgets/badges/sd_counter_badge.dart';
import 'package:travel_app/widgets/buttons/sd_icon_button.dart';
import 'package:travel_app/widgets/buttons/sd_tertiary_button.dart';

/// The [CustomAppbar] is the custom appbar for travel App.
///
/// [CustomAppbar] is separated into three panels: leftPanel contains the logo;
/// centerPanel contains an optional title, rightPanel which contains actions
/// and the Drawer menu.
///
/// [CustomAppbar] are typically used in the [Scaffold.appBar] property, which places
/// the app bar as a fixed-height widget at the top of the screen. To constrain
/// [CustomAppbar] to use the AppBar properties, [PreferredSizeWidget] interface mus
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
class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  /// The appbar title
  final Widget? title;

  /// The callback when the shopping-cart icon is pressed
  final VoidCallback? onOpenShoppingCart;

  /// Displays the search icon or not
  final bool hideSearch;

  const CustomAppbar.customAppbar({
    this.title,
    this.hideSearch = false,
    this.onOpenShoppingCart,
    Key? key,
  }) : super(key: key);

  static const ValueKey profileButtonKey = ValueKey('profile_button_key');

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(400);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    final isPhone = ResponsiveLayout.isPhone(context);
    const int tabsCount = 3;
    List<String> titles = <String>[
      'Flights',
      'hotels',
      'Car Hire',
    ];

    return LayoutBuilder(builder: (context, constraints) {
      final double sidePadding =
          constraints.maxWidth > ResponsiveLayout.largeTabletLimit
              ? (constraints.maxWidth - ResponsiveLayout.largeTabletLimit) / 2
              : sdPaddingLarge;
      return DefaultTabController(
        length: tabsCount,
        child: SafeArea(
          child: Container(
            color: const Color(0xFF05203c),
            padding: const EdgeInsets.only(top: TvConstants.paddingXXLarge),
            child: AppBar(
              backgroundColor: const Color(0xFF05203c),
              notificationPredicate: (ScrollNotification notification) {
                return notification.depth == 0;
              },
              leadingWidth: isPhone
                  ? StoreLogoButton.logoSize
                  : sidePadding + StoreLogoButton.logoSize,
              leading: leftPanel(context, sidePadding),
              title: widget.title,
              actions: [rightPanel(context, sidePadding)],
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: titles[0],
                  ),
                  Tab(
                    text: titles[1],
                  ),
                  Tab(
                    text: titles[2],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget leftPanel(BuildContext context, final double padding) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: padding),
        IconButton(
          onPressed: () {},
          iconSize: 28,
          icon: const Icon(Icons.travel_explore_rounded),
        ),
        const SizedBox(width: TvConstants.paddingSmall),
        Text('Travel App',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white))
      ],
    );
  }

  /// The right sd_appbar panel
  Widget rightPanel(BuildContext context, final double padding) {
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
              key: CustomAppbar.profileButtonKey,
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
        const SizedBox(width: TvConstants.paddingMedium),
        IconButton(onPressed: () {}, icon: const Icon(Icons.language)),
        const SizedBox(width: TvConstants.paddingMedium),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.person_outline_rounded),
          label: Text('Log in'),
        ),
        const SizedBox(width: TvConstants.paddingMedium),
        IconButton(
          onPressed: Scaffold.of(context).openEndDrawer,
          icon: const Icon(Icons.menu),
        ),
        SizedBox(width: padding)
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
