import 'package:flutter/material.dart';

import '../../../../core/colors/my_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 80.0),
      child: CircularProgressIndicator.adaptive(
        backgroundColor: MyColors.background,
      ),
    );
  }
}
