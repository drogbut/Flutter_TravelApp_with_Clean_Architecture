import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/my_constant.dart';

class TravelAppbar extends StatelessWidget {
  const TravelAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Text(
        MyConstants.appName,
        style: theme.textTheme.headlineSmall
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {},
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.person_crop_circle_fill)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
      ],
    );
  }
}
