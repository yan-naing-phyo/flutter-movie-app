import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/network/models/models.dart';
import 'package:flutter_movie_app/network/movie_api.dart';

import '../utils/image_url_builder.dart';
import '../utils/date_parser.dart';

import '../movie_remote_datasource.dart';

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
}

extension on ApiMovie {
  Movie toDomainMovie() => Movie(
        backdropImageUrl:
            ImageUrlBuilder.buildBackdropImageUrl(backdropPath) ?? '',
        id: id,
        overview: overview,
        popularity: popularity,
        posterImageUrl: ImageUrlBuilder.buildPosterImageUrl(posterPath) ?? '',
        releaseDate: DateParser.parse(releaseDate),
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}

extension on List<ApiMovie> {
  List<Movie> toDomainMovies() => map(
        (apiMovie) => apiMovie.toDomainMovie(),
      ).toList();
}
