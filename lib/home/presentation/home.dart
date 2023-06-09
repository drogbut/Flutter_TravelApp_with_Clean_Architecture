import 'package:flutter/material.dart';
import 'package:travel_app/widgets/apps/root.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Root(bodyBuilder: (context, constraints, sidePadding) {
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
    });
  }
}
