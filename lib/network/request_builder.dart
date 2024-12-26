const _paramApiKey = 'api_key';

const _getNowPlayingMoviesPath = '/3/movie/now_playing';
const _getPopularMoviesPath = '/3/movie/popular';
const _getTopRatedMoviesPath = '/3/movie/top_rated';
const _getUpcomingMoviesPath = '/3/movie/upcoming';
const _getPopularTvShowsPath = '/3/tv/popular';
const _getPopularPeoplePath = '/3/person/popular';

class RequestBuilder {
  const RequestBuilder({
    required this.apiBaseUrl,
    required this.apiKey,
  });

  final String apiBaseUrl;
  final String apiKey;

  Uri buildGetNowPlayingMoviesRequest() =>
      _buildRequest(_getNowPlayingMoviesPath);

  Uri buildGetPopularMoviesRequest() => _buildRequest(_getPopularMoviesPath);

  Uri buildGetTopRatedMoviesRequest() => _buildRequest(_getTopRatedMoviesPath);

  Uri buildGetUpcomingMoviesRequest() => _buildRequest(_getUpcomingMoviesPath);

  Uri buildGetPopularTvShowsRequest() => _buildRequest(_getPopularTvShowsPath);

  Uri buildGetPopularPeopleRequest() => _buildRequest(_getPopularPeoplePath);

  Uri _buildRequest(String path) => Uri.https(
        apiBaseUrl,
        path,
        {
          _paramApiKey: apiKey,
        },
      );
}
