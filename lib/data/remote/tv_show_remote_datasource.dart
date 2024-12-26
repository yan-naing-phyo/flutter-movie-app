import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/network/movie_api.dart';

import 'impl/tv_show_remote_datasource_impl.dart';

abstract class TvShowRemoteDatasource {
  factory TvShowRemoteDatasource(MovieApi movieApi) =>
      TvShowRemoteDatasourceImpl(movieApi: movieApi);

  Future<List<TvShow>> getPopularTvShows();
}
