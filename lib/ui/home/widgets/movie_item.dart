import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/models/movie.dart';
import 'package:flutter_movie_app/utils/decimal_util.dart';

import 'movie_poster.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        MoviePoster(posterImageUrl: movie.posterImageUrl),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _MovieRating(voteAverage: movie.voteAverage),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _MovieTitle(title: movie.title),
          ),
        ),
        if (movie.releaseYear != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
            child: _ReleaseYear(releaseYear: movie.releaseYear!),
          ),
      ],
    );
  }
}

class _MovieRating extends StatelessWidget {
  const _MovieRating({required this.voteAverage});

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

class _MovieTitle extends StatelessWidget {
  const _MovieTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.w600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ReleaseYear extends StatelessWidget {
  const _ReleaseYear({required this.releaseYear});

  final int releaseYear;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$releaseYear',
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
