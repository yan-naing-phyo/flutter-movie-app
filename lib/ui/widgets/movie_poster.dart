import 'package:flutter/material.dart';

import 'app_network_image.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.posterImageUrl,
    this.width,
    this.height,
  });

  static const double _posterAspectRatio = 2 / 3;

  final String posterImageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AspectRatio(
        aspectRatio: _posterAspectRatio,
        // child: Image.asset('assets/images/moanaposter.jpg'),
        child: AppNetworkImage(imageUrl: posterImageUrl),
      ),
    );
  }
}
