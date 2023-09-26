import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'navigation_helper.dart';

class DevScreensPage extends StatelessWidget {
  const DevScreensPage({Key? key}) : super(key: key);

  void _goToRootWithBody(BuildContext context, Widget body) {
    /// TODO(Alissa): use a better approach here
    ///
    /// The current approach: we have a special route where we can send
    /// any Widget as the body.
    /// What's wrong with it: navigation (the router) should not contain
    /// development/testing logic + the screens are not part of their
    /// real app flow (the behavior might be weird, for example, if you
    /// go to the profile settings screen when you're not logged in).
    ///
    /// The better approach: for every dev screen tile, first do the
    /// setup necessary for that screen (for example: log in/out the
    /// user, configure article tiles, etc), and then navigate to the
    /// screen the same way you would in the normal app flow (for
    /// example, use `context.go(AppRoutes.articles)`, or use a function
    /// from NavigationHelper if one is available).
    /// Why it's better: the navigation/router is clean (it has only the
    /// usual business logic), and the screens we navigate to should
    /// behave the normal way, given that we do the setup correctly.
    context.go('/dev_preview', extra: body);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /* DevScreenTile(
          label: 'DB view',
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => Theme(
                      data: ThemeData.light(),
                      child: DriftDbViewer(DI.getIt.get<AppDatabase>()))),
            );
          },
        ),*/
        DevScreenTile(
          label: 'Toppings View',
          color: Colors.teal[300]!,
          onPressed: () {
            /*NavigationHelper.goToArticleToppings(
              context,
              CartArticle(
                article: Mocks.articleForToppingView,
                commodityGroupId: 0,
              ),
            );*/
          },
        ),
        DevScreenTile(
          label: 'Favorite View - Login',
          color: Colors.teal,
          onPressed: () {
            //_goToRootWithBody(context, const UserFavoriteArticlesLoginPage());
          },
        ),
        DevScreenTile(
          label: 'Favorite View - Vertical',
          color: Colors.teal,
          onPressed: () {
            //goToRootWithBody(context, const UserFavoriteArticlesPage());
          },
        ),
        DevScreenTile(
          label: 'Favorite View - Horizontal',
          color: Colors.teal,
          onPressed: () {
            //goToRootWithBody(context, const UserFavoriteArticlesPage());
          },
        ),
        DevScreenTile(
          label: 'Favorite View - Text',
          color: Colors.teal,
          onPressed: () {
            //goToRootWithBody(context, const UserFavoriteArticlesPage());
          },
        ),
        DevScreenTile(
          label: 'Favorite View - Register',
          color: Colors.teal,
          onPressed: () {
            //_goToRootWithBody(context, const UserFavoriteArticlesRegisterPage());
          },
        ),
        DevScreenTile(
          label: 'Coupons view - Image',
          color: Colors.purple[200]!,
          onPressed: () {
            //_goToRootWithBody(context, const CouponsPage(isCouponWithImage: true));
          },
        ),
        DevScreenTile(
          label: 'Coupons view - text',
          color: Colors.purple[200]!,
          onPressed: () {
            //_goToRootWithBody(context, const CouponsPage(isCouponWithImage: false));
          },
        ),
        DevScreenTile(
          label: 'Profile View - Login',
          color: Colors.cyan,
          onPressed: () {
            //goToRootWithBody(context, const LoginRegisterPage());
          },
        ),
        DevScreenTile(
          label: 'Profile View - Home',
          color: Colors.cyan,
          onPressed: () {
            //goToRootWithBody(context, const ProfilePageHome());
          },
        ),
        DevScreenTile(
          label: 'Profile View - Settings',
          color: Colors.cyan,
          onPressed: () {
            //context.pushNamed(AppRoutes.profileSettings);
          },
        ),
        DevScreenTile(
          label: 'Fehler bei deiner Bestellung',
          color: Colors.purple[400]!,
          onPressed: () {
            //goToRootWithBody(context, const OrderNotFoundPage());
          },
        ),
        DevScreenTile(
          label: 'Passwort vergessen?',
          color: Colors.purple[400]!,
          onPressed: () {
            //goToRootWithBody(context, ForgotPasswordPage());
          },
        ),
        DevScreenTile(
          label: 'Passwort zurücksetzen?',
          color: Colors.purple[400]!,
          onPressed: () {
            //_goToRootWithBody(context, const RegistrationSuccessfulPage(email: ''));
          },
        ),
        DevScreenTile(
          label: 'Seite nicht gefunden',
          color: Colors.purple[400]!,
          onPressed: () {
            //goToRootWithBody(context, const PageNotFoundPage());
          },
        ),
        DevScreenTile(
          label: 'Checkout View',
          color: Colors.teal[400]!,
          onPressed: () {
            NavigationHelper.goToCheckout(context);
          },
        ),
        DevScreenTile(
          label: 'Shopping Cart',
          color: Colors.teal[400]!,
          onPressed: () {
            NavigationHelper.goToShoppingCart(context);
          },
        ),
        DevScreenTile(
          label: 'HomeScreen',
          color: Colors.teal[400]!,
          onPressed: () {
            NavigationHelper.goToHomeScreen(context);
          },
        ),
        DevScreenTile(
          label: 'Order completion view',
          color: Colors.blue,
          onPressed: () {
            NavigationHelper.goToOrderState(GoRouter.of(context), '');
          },
        ),
        DevScreenTile(
          label: 'Store auswählen',
          color: Colors.purple[200]!,
          onPressed: () {
            NavigationHelper.goToStoreFinder(context);
          },
        ),
      ],
    );
  }
}

class DevScreenTile extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const DevScreenTile({
    required this.label,
    required this.color,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListTile(
        tileColor: color,
        title: Text(label),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // we pop the dev screens modal first
          Navigator.of(context).pop();
          onPressed();
        },
      ),
    );
  }
}
