import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/error_pages/presentation/page_not_found_page.dart';
import 'package:travel_app/home/presentation/home.dart';
import 'package:travel_app/router/app_routes.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AppRouter {
  final router = GoRouter(
    initialLocation: '/home',
    errorBuilder: (context, state) {
      return const PageNotFoundPage();
    },
    redirect: (context, state) {
      if (state.location == '') return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: _AppRouterPaths.home,
        name: AppRoutes.home,
        pageBuilder: (_, state) => _noTransition(state, const Home()),
      ),
      /*GoRoute(
        path: _AppRouterPaths.articles,
        name: AppRoutes.articles,
        pageBuilder: (_, state) {
          int? commodityId;
          if (state.queryParameters['commodity_id'] != null) {
            commodityId = int.tryParse(state.queryParameters['commodity_id']!);
          }
          return _noTransition(
            state,
            ArticlesPage(selectedCommodityId: commodityId),
          );
        },
      ),

      GoRoute(
        path: _AppRouterPaths.coupons,
        name: AppRoutes.coupons,
        pageBuilder: (_, state) =>
            _noTransition(state, const CouponsPage(isCouponWithImage: false)),
      ),
      GoRoute(
          path: _AppRouterPaths.favorites,
          name: AppRoutes.favorites,
          pageBuilder: (_, state) =>
              _noTransition(state, const UserFavoriteArticlesPage())),
      GoRoute(
          path: _AppRouterPaths.profile,
          name: AppRoutes.profile,
          pageBuilder: (_, state) =>
              _noTransition(state, const ProfilePageHome()),
          routes: [
            GoRoute(
                path: _AppRouterPaths.profileSettings,
                name: AppRoutes.profileSettings,
                builder: (_, state) => const ProfileSettingsPage()),
          ]),
      GoRoute(
          path: _AppRouterPaths.storeSelect,
          name: AppRoutes.storeSelect,
          builder: (context, state) {
            return StoreSelectAdaptivePage(
              showMapFirst: state.queryParameters['showMapFirst'] == 'true',
              onStoreSelected: (context) {
                NavigationHelper.goToArticles(context);
              },
              availableStores: state.extra == null
                  ? <MandantStoreBasic>[]
                  : state.extra as List<MandantStoreBasic>,
              storeNotificationMessage:
                  state.queryParameters['storeNotificationMessage'] == 'true',
            );
          }),

      GoRoute(
          path: _AppRouterPaths.initiatePayment,
          name: AppRoutes.initiatePayment,
          builder: (_, state) {
            return PaymentPage(
              paymentUrl: state.extra as String,
            );
          }),

      GoRoute(
          path: _AppRouterPaths.verifyAccount,
          name: AppRoutes.verifyAccount,
          builder: (_, state) {
            String? data = '';
            if (state.queryParameters['data'] != null) {
              data = state.queryParameters['data']!;
            }
            return VerifyUserAccount(
              data: data,
            );
          }),

      GoRoute(
          path: _AppRouterPaths.passwordReset,
          name: AppRoutes.passwordReset,
          builder: (_, state) {
            String? data = '';
            if (state.queryParameters['data'] != null) {
              data = state.queryParameters['data']!;
            }
            return PasswordResetUserAccount(
              data: data,
            );
          }),

      ///TODO use queryparam when want to move to specific page in shopping cart
      GoRoute(
        path: _AppRouterPaths.shoppingCart,
        name: AppRoutes.shoppingCart,
        builder: (_, __) => const ShoppingCartPage(
          initialPage: 0,
        ),
      ),
      GoRoute(
          path: _AppRouterPaths.checkout,
          name: AppRoutes.checkout,
          builder: (_, state) {
            String? errorMessage;
            if (state.queryParameters['errorMessage'] != null) {
              errorMessage = state.queryParameters['errorMessage']!;
            }
            return ShoppingCartPage(
              initialPage: 1,
              errorMessage: errorMessage,
            );
          }),
      GoRoute(
          path: _AppRouterPaths.menu,
          name: AppRoutes.menu,
          redirect: (context, state) {
            if (state.extra == null) {
              return state.namedLocation(AppRoutes.articles);
            }
            return null;
          },
          builder: (_, state) {
            final menu = state.extra as CartMenu;
            return ArticleMenuAdaptivePage(menu: menu);
          }),
      GoRoute(
        path: _AppRouterPaths.toppings,
        name: AppRoutes.toppings,
        redirect: (context, state) {
          if (state.extra == null) {
            return state.namedLocation(AppRoutes.articles);
          }
          return null;
        },
        builder: (_, state) {
          final cartArticle = state.extra as CartArticle;
          return ToppingsPage(cartArticle: cartArticle);
        },
      ),
      GoRoute(
        path: _AppRouterPaths.search,
        name: AppRoutes.search,
        builder: (_, state) => ArticleHistorySearchPage(
          searchQuery: state.queryParameters['search_query'],
        ),
      ),
      GoRoute(
        path: _AppRouterPaths.pastOrders,
        name: AppRoutes.pastOrders,
        builder: (_, state) {
          int? selectedOrderId;
          if (state.queryParameters['order_id'] != null) {
            selectedOrderId = int.tryParse(state.queryParameters['order_id']!);
          }
          return PastOrdersPage(selectedOrderId: selectedOrderId);
        },
      ),
      GoRoute(
          path: _AppRouterPaths.loyalty,
          name: AppRoutes.loyalty,
          builder: (_, __) {
            return const UserLoyaltyPage();
          }),

      GoRoute(
        path: _AppRouterPaths.storeDetails,
        name: AppRoutes.storeDetails,
        builder: (_, __) => StoreDetailsPage(),
      ),
      GoRoute(
        path: _AppRouterPaths.createOrderComplete,
        name: AppRoutes.createOrderComplete,
        redirect: (context, state) {
          // if we cannot parse needed params, go to articles as fallback
          final fallback = state.namedLocation(AppRoutes.articles);
          // TODO: talk to backend to send only uniqId instead of whole redirect URL
          // current redirect looks like:
          // -> /create_order_complete?orderStateUrl=https://webshop-bm-dev.sides-dev.com/#/orderState?uniqId=0b16f6ff5aa263f0ee0b79a7fd0f52cf
          // what we want is:
          // -> /create_order_complete?uniqId=0b16f6ff5aa263f0ee0b79a7fd0f52cf

          //If the parsing fails, we handle a fallback with catch directly
          //sending user back to articles page
          try {
            String rawPath =
                kIsWeb ? state.location : Uri.decodeComponent(state.location);

            if (rawPath.contains('#')) {
              // If the path contains as a param a Flutter link, which contains a '#',
              // but it is not properly escaped, so we have to escape it ourselves
              rawPath = rawPath.replaceAll('#', '%23');
            }

            final parsedUri = Uri.parse(rawPath);
            final orderStateUrl = parsedUri.queryParameters['orderStateUrl'];
            if (orderStateUrl == null || orderStateUrl.isEmpty) {
              return fallback;
            }
            final orderStateUri = Uri.parse(orderStateUrl);
            // we need to parse just the fragment as a uri due to the '#' in the
            // Flutter path
            final orderStateFragment = orderStateUri.fragment;
            if (orderStateFragment.isEmpty) {
              return fallback;
            }
            final appPaymentUniqId =
                Uri.parse(orderStateFragment).queryParameters['uniqId'];

            if (appPaymentUniqId == null) {
              logger.d('Order Payment Failure: Payment Id missing');
              return fallback;
            }
            return state.namedLocation(AppRoutes.processingPayment,
                queryParameters: {'appPaymentUniqId': appPaymentUniqId});
          } catch (ex) {
            logger.d(
                'Order Payment Failure: Parsing issue with status url ${state.location}');
            return fallback;
          }
        },
      ),
      GoRoute(
        path: _AppRouterPaths.processingPayment,
        name: AppRoutes.processingPayment,
        builder: (context, state) => PaymentSuccessPage(
            appPaymentUniqId: state.queryParameters['appPaymentUniqId']!),
      ),
      GoRoute(
        path: _AppRouterPaths.orderState,
        name: AppRoutes.orderState,
        redirect: (context, state) {
          final orderId = state.queryParameters['id'];
          if (orderId == null) {
            // we have no id to fetch order status, fallback to articles
            // TODO: better handling? show error?
            return state.namedLocation(AppRoutes.articles);
          }
          return null;
        },
        builder: (_, state) {
          final orderId = state.queryParameters['id']!;
          return OrderDeliveryAdaptivePage(
            orderIdCrypted: orderId,
          );
        },
      ),
      GoRoute(
        path: _AppRouterPaths.orderNotFound,
        name: AppRoutes.orderNotFound,
        builder: (_, state) => const OrderNotFoundPage(),
      ),
      GoRoute(
        path: _AppRouterPaths.storeListPage,
        name: AppRoutes.storeListPage,
        builder: (_, state) => const StoresPage(),
      ),
      GoRoute(
        path: '/dev_preview',
        builder: (context, state) => state.extra as Widget,
      ),*/
    ],
  );
}

class _AppRouterPaths {
  static const String home = '/home';
  static const String articles = '/articles';
  static const String coupons = '/coupons';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String profileSettings = 'profile_settings';
  static const String storeSelect = '/store_select';
  static const String shoppingCart = '/shopping_cart';
  static const String checkout = '/checkout';
  static const String search = '/search';
  static const String pastOrders = '/past_orders';
  static const String storeDetails = '/restaurant_details';
  static const String createOrderComplete = '/create_order_complete';
  static const String processingPayment = '/processing_payment';
  static const String initiatePayment = '/initiate_payment';
  static const String verifyAccount = '/verifyAccount';
  static const String passwordReset = '/passwordReset';
  static const String orderNotFound = '/order_not_found';
  static const String storeListPage = '/store_list_page';
  static const String loyalty = '/loyalty';
  static const String orderState = '/orderState';
  static const String menu = '/menu';
  static const String toppings = '/toppings';
}

Page<void> _noTransition(GoRouterState state, Widget child) {
  return NoTransitionPage(child: child, key: state.pageKey);
}
