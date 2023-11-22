import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/routing/app_routes.dart';
import 'package:travel_app/features/app/presentation/pages/home_page.dart';

/// The route configuration.
class AppRouter {
  final router = GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,
    errorBuilder: (context, state) {
      return const Placeholder();
    },
    redirect: (context, state) {
      /// If the location doesn't exist navigate to home page
      if (state.name == '') return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: _AppRouterPaths.home,
        name: AppRoutes.home,
        pageBuilder: (_, state) => _noTransition(state, const HomePage()),
      ),
    ],
  );
}

class _AppRouterPaths {
  static const String home = '/home';
}

Page<void> _noTransition(GoRouterState state, Widget child) {
  return NoTransitionPage(child: child, key: state.pageKey);
}
