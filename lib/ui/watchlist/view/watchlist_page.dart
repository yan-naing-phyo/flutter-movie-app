import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/data/models/movie_details.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';
import 'package:flutter_movie_app/ui/home/home.dart';
import 'package:flutter_movie_app/ui/movie_details/view/movie_details_page.dart';
import 'package:flutter_movie_app/ui/watchlist/cubit/watchlist_cubit.dart';
import 'package:flutter_movie_app/ui/widgets/widgets.dart';
import 'package:flutter_movie_app/utils/runtime_util.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WatchlistCubit(movieRepository: context.read<MovieRepository>()),
      child: WatchlistView(),
    );
  }
}

class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: SafeArea(child: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          switch (state) {
            case WatchlistInitial():
              return LoadingIndicator();

            case WatchlistEmpty():
              return Center(
                child: Text(
                  'Your watchlist is empty',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );

            case WatchlistHasMovies():
              return WatchlistMoviesListView(movies: state.movies);

            case WatchlistFailure():
              return Center(
                child: Text('Something went wrong'),
              );
          }
        },
      )),
    );
  }
}

class WatchlistMoviesListView extends StatelessWidget {
  const WatchlistMoviesListView({super.key, required this.movies});

  final List<MovieDetails> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          // Go to movie details screen.
          Navigator.of(context).push(
            MovieDetailsPage.route(movies[index].id.toString()),
          );
        },
        child: WatchlistMovieItem(movieDetails: movies[index]),
      ),
      itemCount: movies.length,
      separatorBuilder: (context, index) => Divider(),
    );
  }
}

class WatchlistMovieItem extends StatelessWidget {
  const WatchlistMovieItem({super.key, required this.movieDetails});

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviePoster(
            posterImageUrl: movieDetails.posterImageUrl,
            width: 100,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: MovieInfo(movieDetails: movieDetails),
          ),
        ],
      ),
    );
  }
}

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key, required this.movieDetails});

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieDetails.title,
          style: textTheme.titleMedium,
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Text(
              '${movieDetails.releaseYear}',
              style:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 16.0),
            Text(
              '${RuntimeUtil.runtimeString(movieDetails.runtime)}',
              style:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        MovieRating(voteAverage: movieDetails.voteAverage),
      ],
    );
  }
}
