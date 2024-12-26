import 'package:flutter_movie_app/data/models/person.dart';
import 'package:flutter_movie_app/data/remote/person_remote_datasource.dart';
import 'package:flutter_movie_app/data/repositories/impl/person_repository_impl.dart';

abstract class PersonRepository {
  factory PersonRepository(PersonRemoteDatasource remoteDatasource) =>
      PersonRepositoryImpl(remoteDatasource: remoteDatasource);

  Future<List<Person>> getPopularPeople();
}
