import 'package:flutter_movie_app/data/models/person.dart';
import 'package:flutter_movie_app/data/remote/person_remote_datasource.dart';
import 'package:flutter_movie_app/data/repositories/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  const PersonRepositoryImpl({required this.remoteDatasource});

  final PersonRemoteDatasource remoteDatasource;

  @override
  Future<List<Person>> getPopularPeople() {
    return remoteDatasource.getPopularPeople();
  }
}
