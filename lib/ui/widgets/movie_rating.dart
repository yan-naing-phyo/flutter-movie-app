import 'package:flutter/material.dart';
import 'package:flutter_movie_app/utils/decimal_util.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({super.key, required this.voteAverage});

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _StarIcon(),
        SizedBox(width: 4.0),
        _VoteAverage(voteAverage: voteAverage),
      ],
    );
  }
}

class _StarIcon extends StatelessWidget {
  const _StarIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rounded,
      color: Colors.orange,
    );
  }
}

class _VoteAverage extends StatelessWidget {
  const _VoteAverage({required this.voteAverage});

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Text(
      voteAverage.toStringWithFraction(1),
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.w500),
    );
  }
}
