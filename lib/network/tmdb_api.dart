import 'dart:convert';

import 'package:flutter_movie_app/network/request_builder.dart';
import 'package:http/http.dart' as http;

import 'response/response.dart';
import 'movie_api.dart';

const _apiBaseUrl = 'api.themoviedb.org';
const _apiKey = '826746b37a7f46691cf263c0827b9ab7';

class MovieRequestFailure implements Exception {}

class TvShowRequestFailure implements Exception {}

class PersonRequestFailure implements Exception {}

class TmdbApi implements MovieApi {
  TmdbApi({
    http.Client? httpClient,
    RequestBuilder? requestBuilder,
  })  : _httpClient = httpClient ?? http.Client(),
        _requestBuilder = requestBuilder ??
            RequestBuilder(
              apiBaseUrl: _apiBaseUrl,
              apiKey: _apiKey,
            );

  final http.Client _httpClient;
  final RequestBuilder _requestBuilder;

  @override
  Future<MovieListResponse> getNowPlayingMovies() async {
    final getNowPlayingMoviesRequest =
        _requestBuilder.buildGetNowPlayingMoviesRequest();

    return _getData(
      getNowPlayingMoviesRequest,
      onSuccess: (bodyJson) => MovieListResponse.fromJson(bodyJson),
      onFailure: () => MovieRequestFailure(),
    );
  }

  @override
  Future<MovieListResponse> getPopularMovies() async {
    final getPopularMoviesRequest =
        _requestBuilder.buildGetPopularMoviesRequest();

    return _getData(
      getPopularMoviesRequest,
      onSuccess: (bodyJson) => MovieListResponse.fromJson(bodyJson),
      onFailure: () => MovieRequestFailure(),
    );
  }

  @override
  Future<MovieListResponse> getTopRatedMovies() async {
    final getTopRatedMoviesRequest =
        _requestBuilder.buildGetTopRatedMoviesRequest();

    return _getData(
      getTopRatedMoviesRequest,
      onSuccess: (bodyJson) => MovieListResponse.fromJson(bodyJson),
      onFailure: () => MovieRequestFailure(),
    );
  }

  @override
  Future<MovieListResponse> getUpcomingMovies() async {
    final getUpcomingMoviesRequest =
        _requestBuilder.buildGetUpcomingMoviesRequest();

    return _getData(
      getUpcomingMoviesRequest,
      onSuccess: (bodyJson) => MovieListResponse.fromJson(bodyJson),
      onFailure: () => MovieRequestFailure(),
    );
  }

  @override
  Future<TvShowListResponse> getPopularTvShows() async {
    final getPopularTvShowsRequest =
        _requestBuilder.buildGetPopularTvShowsRequest();

    return _getData(
      getPopularTvShowsRequest,
      onSuccess: (bodyJson) => TvShowListResponse.fromJson(bodyJson),
      onFailure: () => TvShowRequestFailure(),
    );
  }

  @override
  Future<PersonListResponse> getPopularPeople() {
    final getPopularPeopleRequest =
        _requestBuilder.buildGetPopularPeopleRequest();

    return _getData(
      getPopularPeopleRequest,
      onSuccess: (bodyJson) => PersonListResponse.fromJson(bodyJson),
      onFailure: () => PersonRequestFailure(),
    );
  }

  Future<T> _getData<T>(
    Uri uri, {
    required T Function(Map<String, dynamic> bodyJson) onSuccess,
    required Exception Function() onFailure,
  }) async {
    /// Make network request.
    final response = await _httpClient.get(uri);

    if (response.statusCode == 200) {
      return onSuccess(jsonDecode(response.body));
    }

    throw onFailure();
  }
}
