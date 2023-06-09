import 'package:flutter/material.dart';

/// A Widget for the custom BottomAppBar
class SdBottomBar extends BottomAppBar {
  /// Use a list of icons to built the bottom navigation app
  SdBottomBar({
    required List<Widget> items,
    Key? key,
  }) : super(
          key: key,
          notchMargin: 7.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        );
}
