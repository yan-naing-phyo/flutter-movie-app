import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/ui/widgets/widgets.dart';
import 'package:flutter_movie_app/ui/movie_details/movie_details.dart';
import 'package:flutter_movie_app/utils/runtime_util.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({
    super.key,
    required this.movieDetails,
  });

  static const _posterWidth = 100.0;
  static const _offsetY = -20.0;

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieBackdrop(imageUrl: movieDetails.backdropImageUrl),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black26],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 0.9],
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, _offsetY),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 16),
              MoviePoster(
                posterImageUrl: movieDetails.posterImageUrl,
                width: _posterWidth,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: _offsetY.abs() + 10, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _MovieTitle(
                        title: movieDetails.title,
                      ),
                      _MovieReleaseYearAndRuntime(
                        releaseYear: movieDetails.releaseYear,
                        runtime: movieDetails.runtime,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: _MovieGenres(
            genres: movieDetails.genres,
          ),
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
          .headlineSmall!
          .copyWith(fontWeight: FontWeight.w500),
    );
  }
}

class _MovieReleaseYearAndRuntime extends StatelessWidget {
  const _MovieReleaseYearAndRuntime({
    required this.releaseYear,
    required this.runtime,
  });

  final int? releaseYear;
  final int runtime;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (releaseYear != null)
          _MovieReleaseYear(
            releaseYear: releaseYear!,
          ),
        SizedBox(width: 10),
        _MovieRuntime(
          runtime: runtime,
        ),
      ],
    );
  }
}

class _MovieReleaseYear extends StatelessWidget {
  const _MovieReleaseYear({required this.releaseYear});

  final int releaseYear;

  @override
  Widget build(BuildContext context) {
    return Text(
      '($releaseYear)',
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class _MovieRuntime extends StatelessWidget {
  const _MovieRuntime({required this.runtime});

  final int runtime;

  @override
  Widget build(BuildContext context) {
    return Text(
      RuntimeUtil.runtimeString(runtime),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class _MovieGenres extends StatelessWidget {
  const _MovieGenres({required this.genres});

  final List<Genre> genres;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: genres
          .map(
            (genre) => Chip(
              label: Text(genre.name),
              labelPadding: EdgeInsets.zero,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            ),
          )
          .toList(),
    );
  }
}
