import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// [SdCachedNetworkImage] SdCachedNetworkImage is a class which extends the
/// CachedNetworkImage which  is a Flutter library that provides a widget for
/// displaying images and cache them for future usage.
///
/// It is designed to handle all the difficulties and complexities that come
///     * with downloading and displaying images such as:
///     * Loading images from the network.
///     * Caching images for faster load times.
///     * Handling exceptions and errors during image loading and so on.
///
/// See also:
///
///  * [CachedNetworkImage], A flutter library to show images from the netowrk
/// and keep them in the cache directory.

class SdCachedNetworkImage extends CachedNetworkImage {
  SdCachedNetworkImage(
      {Key? key,
      required String imageUrl,
      Widget? placeholder,
      Widget? errorWidget,
      BoxFit? fit,
      double? height,
      double? width,
      ImageWidgetBuilder? imageBuilder,
      e})
      : super(
          key: key,
          // TODO: use dynamic size instead of 500 (to save even more data
          // when images are displayed smaller than this) – 500 is currently
          // the value of the largest article tile
          imageUrl:
              'https://sd-images.simplydelivery.io/cdn-cgi/image/width=500,fit=cover/$imageUrl',
          placeholder: (context, url) => placeholder ?? const SizedBox(),
          imageBuilder: imageBuilder,
          errorWidget: (context, url, error) => Stack(
            children: [
              errorWidget ?? const SizedBox(),
              if (kDebugMode) Text(error.toString()),
            ],
          ),
          fadeInDuration: Duration.zero,
          fadeOutDuration: Duration.zero,
        );
}
