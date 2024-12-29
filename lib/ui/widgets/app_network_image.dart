import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'image_placeholder.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => ImagePlaceholder(),
      errorWidget: (context, url, error) => ImagePlaceholder(),
    );
  }
}
