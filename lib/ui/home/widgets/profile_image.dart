import 'package:flutter/material.dart';
import 'package:flutter_movie_app/ui/home/home.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, required this.imageUrl});

  static const double _aspectRatio = 2 / 3;

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // return Image.asset('assets/images/profile.jpg');
    return AspectRatio(
      aspectRatio: _aspectRatio,
      child: AppNetworkImage(imageUrl: imageUrl),
    );
  }
}
