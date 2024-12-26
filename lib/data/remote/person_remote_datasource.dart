import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/remote/impl/person_remote_datasource_impl.dart';
import 'package:flutter_movie_app/network/movie_api.dart';

abstract class PersonRemoteDatasource {
  factory PersonRemoteDatasource(MovieApi movieApi) =>
      PersonRemoteDatasourceImpl(movieApi: movieApi);

  Future<List<Person>> getPopularPeople();
}
