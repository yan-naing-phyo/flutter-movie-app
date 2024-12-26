import 'package:flutter_movie_app/data/models/tv_show.dart';
import 'package:flutter_movie_app/data/remote/utils/image_url_builder.dart';
import 'package:flutter_movie_app/data/remote/tv_show_remote_datasource.dart';
import 'package:flutter_movie_app/network/models/models.dart';
import 'package:flutter_movie_app/network/movie_api.dart';

class TvShowRemoteDatasourceImpl implements TvShowRemoteDatasource {
  const TvShowRemoteDatasourceImpl({required this.movieApi});

  final MovieApi movieApi;

  @override
  Future<List<TvShow>> getPopularTvShows() async {
    final response = await movieApi.getPopularTvShows();

    return response.results
        .map(
          (apiTvShow) => apiTvShow.toDomainModel(),
        )
        .toList();
  }
}

extension on ApiTvShow {
  TvShow toDomainModel() {
    return TvShow(
      backdropImageUrl:
          ImageUrlBuilder.buildBackdropImageUrl(backdropPath) ?? '',
      id: id,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterImageUrl: ImageUrlBuilder.buildPosterImageUrl(posterPath) ?? '',
      firstAirDate: firstAirDate,
      name: name,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
