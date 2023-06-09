import 'package:flutter/material.dart';
import 'package:travel_app/widgets/buttons/sd_floating_action_button.dart';

class SdFloatingButton extends StatelessWidget {
  final int badgeCount;

  const SdFloatingButton({
    required this.badgeCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SdFloatingActionButton(
      iconData: Icons.shopping_cart,
      isSelected: false,
      primaryColor: Theme.of(context).primaryColor,
      badgeCount: badgeCount,
      onPressed: () {
        //NavigationHelper.goToShoppingCart(context);
      },
    );
  }
}
