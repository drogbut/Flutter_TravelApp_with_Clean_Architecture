import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/sd_constants.dart';

/// TODO
/// * (1) What do the class ? -> comment
/// * (2) What explain the class-name ? -> use intention revealing name
/// * (3) Shape, margins, elevation can be set in theme -> uniformity
/// * (4) Do we need SdCardWrapperWidget -> Set with SdCard and delete SdCardWrapperWidget?
class SdCardWrapperWidget extends StatelessWidget {
  final Widget child;

  const SdCardWrapperWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// TODO: manage shape globaly into theme file
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(sdPaddingLarge),
        child: child,
      ),
    );
  }
}
