import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit({
    required this.movieRepository,
  }) : super(MovieDetailsLoading());

  final MovieRepository movieRepository;

  void fetchData(String movieId) async {
    try {
      final movieDetails = await movieRepository.getMovieDetails(movieId);
      final movieCasts = await movieRepository.getMovieCasts(movieId);
      final addedToWatchlist =
          (await movieRepository.findWatchlistMovieById(movieId) != null);

      emit(
        MovieDetailsSuccess(
          movieDetails: movieDetails,
          casts: movieCasts,
          addedToWatchlist: addedToWatchlist,
        ),
      );
    } catch (e) {
      emit(MovieDetailsFailure(e));
    }
  }

  void addMovieToWatchlist(MovieDetails movie) async {
    await movieRepository.addMovieToWatchlist(movie);
  }

  void removeMovieFromWatchlist(String movieId) async {
    await movieRepository.removeMovieFromWatchlist(movieId);
  }
}
