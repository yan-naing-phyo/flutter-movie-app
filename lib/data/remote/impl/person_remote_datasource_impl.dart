import 'package:flutter_movie_app/data/models/person.dart';
import 'package:flutter_movie_app/data/remote/person_remote_datasource.dart';
import 'package:flutter_movie_app/data/remote/utils/gender_converter.dart';
import 'package:flutter_movie_app/data/remote/utils/image_url_builder.dart';
import 'package:flutter_movie_app/network/models/api_person.dart';
import 'package:flutter_movie_app/network/movie_api.dart';

class PersonRemoteDatasourceImpl implements PersonRemoteDatasource {
  const PersonRemoteDatasourceImpl({required this.movieApi});

  final MovieApi movieApi;

  @override
  Future<List<Person>> getPopularPeople() async {
    final response = await movieApi.getPopularPeople();

    return response.results.toDomainPeople();
  }
}

extension on ApiPerson {
  Person toDomainPerson() => Person(
        gender: GenderConverter.convert(gender),
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        popularity: popularity,
        profileImageUrl:
            ImageUrlBuilder.buildProfileImageUrl(profilePath) ?? '',
      );
}

extension on List<ApiPerson> {
  List<Person> toDomainPeople() => map(
        (apiPerson) => apiPerson.toDomainPerson(),
      ).toList();
}
