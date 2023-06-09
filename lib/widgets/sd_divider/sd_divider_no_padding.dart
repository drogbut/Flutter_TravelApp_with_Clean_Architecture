import 'package:flutter/material.dart';

/// [SdDividerNoPadding] is for cards that are not based on a ListViewer and/or if the line should go to
/// the edge of the card. Not always a ListView.separated can be used. Not giving the card an InnerPadding
/// and setting it at every single element was seen as the bad approach.
///
/// example: [OrderTypeComponent]
///
/// TODO If this ends up being used only 1-2, please delete and write directly to the respective file.
class SdDividerNoPadding extends Container {
  final double positionTop;

  SdDividerNoPadding({
    required this.positionTop,
    Key? key,
  }) : super(
          key: key,
          constraints: BoxConstraints.loose(const Size.fromHeight(10.0)),
          child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: positionTop,
                  left: -20.0,
                  right: -20.0,
                  child: const Divider(
                    thickness: 2,
                  ),
                )
              ]),
        );
}
