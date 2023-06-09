import 'package:flutter/material.dart';
import 'package:travel_app/router/navigation_helper.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/widgets/buttons/sd_primary_button.dart';

/// [OrderNotFoundPage], A page that appears when the search time has expired.
///
/// [OrderNotFoundPage] is a group of containers ordered in a Stack: background
/// image, title, sub-title, description and send button.
///
/// See also:
///
///  * [ForgotPasswordView], A simple forgot password screen.
///  * [PageNotFoundView], A page that shows a 404 error.
///  * <https://flutter.dev/docs/development/ui/layout>
class OrderNotFoundPage extends StatefulWidget {
  const OrderNotFoundPage({Key? key}) : super(key: key);

  @override
  State<OrderNotFoundPage> createState() => _OrderNotFoundPageState();
}

class _OrderNotFoundPageState extends State<OrderNotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
            image: AssetImage('assets/images/article_not_found.png'),
            fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                Text(
                  'labelOrderError',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'labelTimeOutError',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: sdPaddingLarge),
                SdPrimaryButton(
                  title: 'labelReEnterOrder',
                  onPressed: () => NavigationHelper.goToHomeScreen(context),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
