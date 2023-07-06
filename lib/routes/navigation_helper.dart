import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/routes/app_routes.dart';
import 'package:travel_app/styleguide/responsive_layout.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/widgets/sd_alert_views/sd_alert_dialog.dart';

/// A class that contains the routing logic for navigating to specific screens.
class NavigationHelper {
  /// Navigates to the root homescreen, discarding all screens pushed on top.
  static Future<void> goToHomeScreen(BuildContext context) async {
    // obtain go router instance before async gap
    final goRouter = GoRouter.of(context);
    // close dialogs if any are open
    await Navigator.of(context).maybePop();
    goRouter.go('/home');
  }

  /// Pops the current screen if a stack is available; if not, then it navigates
  /// to the home screen. This is useful for the web version, where the user can
  /// refresh the page, which resets the push stack and so we no longer have
  /// access to it (`context.pop()` will not work).
  static void goBackOrHome(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      goToHomeScreen(context);
    }
  }

  /// Navigates to the fav screen.
  static void goToFavScreen(BuildContext context) {
    context.goNamed(AppRoutes.favorites);
  }

  /// Navigates to the store details screen.
  static void goStoreDetailsScreen(BuildContext context) {
    if (!GoRouter.of(context).location.contains(AppRoutes.storeDetails)) {
      context.goNamed(AppRoutes.storeDetails);
    }
  }

  /// Navigates to the loyalty route.
  static void goToLoyaltyScreen(BuildContext context) {
    context.goNamed(AppRoutes.loyalty);
  }

  /// Navigate to a loyalty route onto the page stack
  static void pushToLoyaltyScreen(BuildContext context) {
    context.pushNamed(AppRoutes.loyalty);
  }

  /// Opens a bottom sheet with the list of dev screens.
  static void goToDevScreens(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.75,
          maxChildSize: 0.75,
          minChildSize: 0.75,
          expand: false,
          builder: (context, _) {
            return Container();
          }),
    );
  }

  /// Navigates to the articles screen, with the given [commodityGroup]
  /// preselected.
  static void goToArticles(
    BuildContext context, {
    int? commodityGroup,
  }) {
    context.goNamed(AppRoutes.articles, queryParameters: {
      if (commodityGroup != null) 'commodity_id': commodityGroup.toString(),
    });
  }

  static void goToArticlesRouter(
    GoRouter router, {
    int? commodityGroup,
  }) {
    router.goNamed(AppRoutes.articles, queryParameters: {
      if (commodityGroup != null) 'commodity_id': commodityGroup.toString(),
    });
  }

  /// On large screens, it displays a dialog for editing an article's toppings.
  /// On phones, it navigates to a screen for editing an article's toppings.
  /*static void goToArticleToppings(
    final BuildContext context,
    final CartArticle cartArticle, {
    final bool isFromMenu = false,
  }) {
    context.pushNamed(AppRoutes.toppings, extra: cartArticle);
  }*/

  /// Navigates to the store selection screen with an optional param which is
  /// used for showing the map first (before the list, in case a a tabbed
  /// interface is used).
  /*static void goToStoreSelection(
    BuildContext context, {
    bool showMapFirst = false,
    final List<MandantStoreBasic> availableStores = const <MandantStoreBasic>[],
    bool storeNotificationMessage = false,
  }) {
    context.pushNamed(
      AppRoutes.storeSelect,
      queryParameters: {
        'showMapFirst': '$showMapFirst',
        'storeNotificationMessage': storeNotificationMessage.toString(),
      },
      extra: availableStores,
    );
  }*/

  /// Navigated to the profile screen (which redirects to login if the user
  /// is not logged in).
  static void goToProfile(BuildContext context) {
    context.goNamed(AppRoutes.profile);
  }

  /// Navigates to the shopping cart screen.
  static void goToShoppingCart(BuildContext context) {
    context.goNamed(AppRoutes.shoppingCart);
  }

  /// Navigates to the checkout screen.
  static void goToCheckout(BuildContext context, {String? errorMessage}) {
    context.goNamed(
      AppRoutes.checkout,
      queryParameters: {if (errorMessage != null) 'errorMessage': errorMessage},
    );
  }

  /// Navigates to create order complete screen
  static void goToCreateOrderComplete(BuildContext context,
      {required String orderStateUrl}) {
    context.goNamed(AppRoutes.createOrderComplete,
        queryParameters: {'orderStateUrl': orderStateUrl});
  }

  /// Navigates to the search screen
  static void goToSearch(BuildContext context, {final String? searchQuery}) {
    context.goNamed(AppRoutes.search, queryParameters: {
      if (searchQuery != null) 'search_query': searchQuery
    });
  }

  /// Navigates to the order state screen
  static void goToOrderState(GoRouter router, String orderIdCrypted) {
    router.goNamed(AppRoutes.orderState, queryParameters: {
      'id': orderIdCrypted,
    });
  }

  static void goToPayment(BuildContext context, {required String paymentUrl}) {
    context.goNamed(AppRoutes.initiatePayment, extra: paymentUrl);
  }

  static void goToProcessingPayment(
      BuildContext context, String appPaymentUniqId) {
    context.goNamed(AppRoutes.processingPayment,
        queryParameters: {'appPaymentUniqId': appPaymentUniqId});
  }

  static void goToOrderNotFound(BuildContext context) {
    context.goNamed(AppRoutes.orderNotFound);
  }

  /// Navigates to the past orders screen
  static void goToPastOrders(BuildContext context, {int? selectedOrderId}) {
    context.goNamed(AppRoutes.pastOrders, queryParameters: {
      if (selectedOrderId != null) 'order_id': selectedOrderId.toString(),
    });
  }

  /// Naviates to the store finder component dialog
  static Future<void> goToStoreFinder(BuildContext context,
          {int? initialAddressId}) =>
      SdShowAlertDialog.showBasicDialog(
        insetPadding: sdPaddingMedium,
        context: context,
        content: SizedBox(
          width: ResponsiveLayout.isMobilePlatform
              ? double.maxFinite
              : dialogWidthLarge,
          child: Container(),
        ),
      );

  /// Checks if the current router location matches a specific app route from
  /// [AppRoutes]
  static bool currentPathMatches(
    BuildContext context,
    String appRoute, {
    int? params,
  }) {
    final goRouter = GoRouter.of(context);

    if (params != null) {
      return goRouter.location ==
          goRouter.namedLocation(appRoute,
              queryParameters: {'commodity_id': params.toString()});
    }

    return goRouter.location == goRouter.namedLocation(appRoute);
  }

  /// Navigates to the store selection screen with an optional param which is
  /// used for showing the map first (before the list, in case a a tabbed
  /// interface is used).
/*static void goToArticleMenu(
    BuildContext context,
    CartMenu menu,
  ) {
    context.pushNamed(AppRoutes.menu, extra: menu);
  }*/
}
