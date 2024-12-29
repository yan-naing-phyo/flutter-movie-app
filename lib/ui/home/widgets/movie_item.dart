import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/models/movie.dart';

import 'package:flutter_movie_app/ui/widgets/widgets.dart';

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
          child: MovieRating(voteAverage: movie.voteAverage),
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
