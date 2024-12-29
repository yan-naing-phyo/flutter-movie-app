import 'package:flutter/material.dart';

import 'package:flutter_movie_app/ui/widgets/widgets.dart';

class MovieBackdrop extends StatelessWidget {
  const MovieBackdrop({
    super.key,
    required this.imageUrl,
  });

  static const _imageAspectRatio = 16 / 9;

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _imageAspectRatio,
      child: AppNetworkImage(imageUrl: imageUrl),
      // child: Image.asset('assets/images/backdropmoana.jpg'),
    );
  }
}
