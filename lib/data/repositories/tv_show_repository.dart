import 'package:flutter_movie_app/data/models/tv_show.dart';
import 'package:flutter_movie_app/data/remote/tv_show_remote_datasource.dart';
import 'package:flutter_movie_app/data/repositories/impl/tv_show_repository_impl.dart';

abstract class TvShowRepository {
  factory TvShowRepository(TvShowRemoteDatasource remoteDatasource) =>
      TvShowRepositoryImpl(remoteDatasource: remoteDatasource);

  Future<List<TvShow>> getPopularTvShows();
}
