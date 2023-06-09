import 'package:flutter/material.dart';

/// [SdImageButton] is a custom button with an image
///
/// [assetRoot] Give the path of the image. Having an image inside a [IconButton]
/// might not fit all requirements like that padding. Build a custom widget to
/// have full control on the button( even a simple Container with a custom
/// BoxDecoration to display the image ) and wrap it with a a simple tap
/// recognizer to handle user interactions. The simplest implementation would
/// use a GestureDetector, but there are also other widgets, like InkWell that
/// renders a material design ripple over the tappable widget surface on tap.
///
/// /// This sample produces a image button in the footer component.
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return SdImageButton(
///      assetRoot: 'assets/images/playstore.webp',
///      onTap: () => launch(ThemeConfig.playStoreLink),
///     );
///  }
///
///  ```
/// See also:
///
/// * [IconButton] a Material Design icon button.
/// * [SdTertiaryButton], a simple text button without a shadow.
/// * <https://flutter.dev/assets-and-images/>, an introduction to assets in Flutter.

class SdImageButton extends StatelessWidget {
  /// Give the asset root of the image.
  final String assetRoot;

  /// The size of the image inside the container.
  /// nit to 100 but can be edit if necessary
  final double iconSize;

  /// The callback that is called when the button is tapped or otherwise activated.
  /// If this is set to null, the button will be disabled.
  final Function()? onTap;

  const SdImageButton({
    required this.assetRoot,
    required this.onTap,
    this.iconSize = 100,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        assetRoot,
        width: iconSize,
      ),
    );
  }
}
