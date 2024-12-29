import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/network/movie_api.dart';
import '../movie_remote_datasource.dart';
import 'api_movie_converter.dart';

class MovieRemoteDatasourceImpl implements MovieRemoteDatasource {
  const MovieRemoteDatasourceImpl({required this.movieApi});

  final MovieApi movieApi;

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final movieListResponse = await movieApi.getNowPlayingMovies();

    return movieListResponse.results.toDomainMovies();
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    final movieListResponse = await movieApi.getPopularMovies();

    return movieListResponse.results.toDomainMovies();
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final movieListResponse = await movieApi.getTopRatedMovies();

    return movieListResponse.results.toDomainMovies();
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    final movieListResponse = await movieApi.getUpcomingMovies();

    return movieListResponse.results.toDomainMovies();
  }

  @override
  Future<List<Cast>> getMovieCasts(String movieId) async {
    final movieCreditsResponse = await movieApi.getMovieCredits(movieId);

    return movieCreditsResponse.cast
        .map(
          (apiCast) => apiCast.toDomainCast(),
        )
        .toList();
  }

  @override
  Future<MovieDetails> getMovieDetails(String movieId) async {
    final response = await movieApi.getMovieDetails(movieId);

    return response.toDomainMovieDetails();
  }
}
