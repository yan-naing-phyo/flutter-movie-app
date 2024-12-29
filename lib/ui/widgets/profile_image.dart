import 'package:flutter/material.dart';

import 'app_network_image.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.imageUrl});

  static const double _aspectRatio = 2 / 3;

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _aspectRatio,
      child: AppNetworkImage(imageUrl: imageUrl),
      // child: Image.asset('assets/images/profile.jpg'),
    );
  }
}
