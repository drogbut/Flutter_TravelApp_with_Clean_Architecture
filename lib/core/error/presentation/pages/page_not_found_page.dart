import 'package:flutter/material.dart';
import 'package:travel_app/config/routes/navigation_helper.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/widgets/buttons/sd_primary_button.dart';

/// [PageNotFoundPage], A page that shows a 404 error.
///
/// [PageNotFoundPage] is a group of containers ordered in a Stack: background
/// image, logo, title, description and send button.
///
/// See also:
///
///  * [ForgotPasswordPage], A simple forgot password screen.
///  * [NotFoundOrderPage], A page that appears when the search time has expired.
///  * <https://flutter.dev/docs/development/ui/layout>
class PageNotFoundPage extends StatelessWidget {
  const PageNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: Image(
            image: AssetImage('assets/images/Food_bg.webp'),
            fit: BoxFit.fitWidth,
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'labelPageError',
                textScaleFactor: 2,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: sdPaddingSmall),
              Text(
                'labelPageNotFound',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: sdPaddingSmall),
              Text(
                'labelPageNotExist',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: sdPaddingLarge),
              SdPrimaryButton(
                  title: 'labelBackToHomePage',
                  onPressed: () {
                    NavigationHelper.goToHomeScreen(context);
                  }),
            ],
          ),
        )
      ],
    );
  }
}
