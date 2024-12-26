import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/models/movie.dart';
import 'package:flutter_movie_app/ui/home/home.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.movies,
    required this.headerText,
  });

  static const double _movieListViewHeight = 340;

  final List<Movie> movies;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ListHeader(
          headerText: headerText,
          onPressedSeeAll: () {},
        ),
        Container(
          height: _movieListViewHeight,
          child: _MovieListView(movies: movies),
        ),
      ],
    );
  }
}

class _MovieListView extends StatelessWidget {
  const _MovieListView({required this.movies});

  static const double _itemWidth = 140;

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) => _buildMovieItem(
        context,
        movie: movies[index],
      ),
      separatorBuilder: (context, index) => SizedBox(
        width: 12,
      ),
      itemCount: movies.length,
    );
  }

  Widget _buildMovieItem(BuildContext context, {required Movie movie}) =>
      Container(
        width: _itemWidth,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: MovieItem(movie: movie),
      );
}
