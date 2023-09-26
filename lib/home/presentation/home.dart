import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:travel_app/styleguide/responsive_layout.dart';
import 'package:travel_app/styleguide/sd_constants.dart';
import 'package:travel_app/styleguide/tv_constants.dart';
import 'package:travel_app/widgets/apps/root.dart';
import 'package:travel_app/widgets/apps/sd_appbar/store_logo_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Root(
      customAppbar: const HomeAppbar(),
      bodyBuilder: (context, constraints, sidePadding) {
        return SafeArea(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize {
    return const Size.fromHeight(80);
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        ResponsiveLayout.isTablet(context) || ResponsiveLayout.isPhone(context);
    ThemeData theme = Theme.of(context);
    final isPhone = ResponsiveLayout.isPhone(context);
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
      return SafeArea(
        child: Container(
          color: theme.colorScheme.onBackground,
          padding: EdgeInsets.symmetric(
              vertical: isSmallScreen ? 0 : TvConstants.paddingXXLarge),
          child: AppBar(
            backgroundColor: theme.colorScheme.onBackground,
            leadingWidth: isPhone
                ? StoreLogoButton.logoSize
                : sidePadding + StoreLogoButton.logoSize,
            leading: leftPanel(context, sidePadding),
            actions: [rightPanel(context, sidePadding)],
          ),
        ),
      );
    });
  }

  /// The left sd_appbar panel
  Widget leftPanel(BuildContext context, final double padding) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: padding),
        ElevatedButton.icon(
          onPressed: () {},
          style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith<double?>(
              (states) => 0,
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return Colors.transparent;
            }),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return Colors.transparent;
            }),
            shadowColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return theme.colorScheme.primary;
            }),
          ),
          icon: const Icon(Icons.travel_explore_rounded),
          label: Text(
            TvConstants.appName,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ),
      ],
    );
  }

  /// The right sd_appbar panel
  Widget rightPanel(BuildContext context, final double padding) {
    ThemeData theme = Theme.of(context);
    var appLocalisation = AppLocalizations.of(context)!;

    final isSmallScreen =
        ResponsiveLayout.isTablet(context) || ResponsiveLayout.isPhone(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: TvConstants.paddingMedium),
        isSmallScreen
            ? IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
            : IconButton(
                onPressed: () async {
                  final locale = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text(appLocalisation.labelChooseLanguage),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.language),
              ),
        const SizedBox(width: TvConstants.paddingMedium),
        ElevatedButton.icon(
          style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith<double?>(
              (states) => 0,
            ),
            shadowColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              return theme.colorScheme.onBackground;
            }),
          ),
          onPressed: () {},
          icon: const Icon(Icons.person_outline_rounded),
          label: Text(appLocalisation.btnLogin),
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
