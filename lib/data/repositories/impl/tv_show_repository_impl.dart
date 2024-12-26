import 'package:flutter_movie_app/data/models/tv_show.dart';
import 'package:flutter_movie_app/data/remote/tv_show_remote_datasource.dart';
import 'package:flutter_movie_app/data/repositories/tv_show_repository.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  const TvShowRepositoryImpl({required this.remoteDatasource});

  final TvShowRemoteDatasource remoteDatasource;

  @override
  Future<List<TvShow>> getPopularTvShows() {
    return remoteDatasource.getPopularTvShows();
  }
}
