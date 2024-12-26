import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/network/models/models.dart';
import 'package:flutter_movie_app/network/response/response.dart';
import 'package:flutter_movie_app/network/movie_api.dart';
import 'package:flutter_movie_app/data/remote/impl/person_remote_datasource_impl.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<MovieApi>()])
import 'person_remote_datasource_impl_test.mocks.dart';

void main() {
  group('PersonRemoteDatasourceImpl', () {
    group('getPopularPeople', () {
      test('calls getPopularPeople from movie api', () async {
        final movieApi = MockMovieApi();
        final remoteDatasource = PersonRemoteDatasourceImpl(movieApi: movieApi);
        when(movieApi.getPopularPeople()).thenAnswer(
          (_) async => PersonListResponse(
            page: 1,
            results: [],
            totalPages: 10,
            totalResults: 100,
          ),
        );

        await remoteDatasource.getPopularPeople();

        verify(movieApi.getPopularPeople()).called(1);
      });

      test('throws when getPopularPeople from movie api fails', () async {
        final error = Exception('fail');
        final movieApi = MockMovieApi();
        final remoteDatasource = PersonRemoteDatasourceImpl(movieApi: movieApi);
        when(movieApi.getPopularPeople()).thenThrow(error);

        expect(() async => remoteDatasource.getPopularPeople(), throwsA(error));
      });

      test('returns List<Person> when getPopularPeople from movie api success',
          () async {
        final movieApi = MockMovieApi();
        final remoteDatasource = PersonRemoteDatasourceImpl(movieApi: movieApi);
        when(movieApi.getPopularPeople()).thenAnswer(
          (_) async => PersonListResponse(
            page: 1,
            results: [
              ApiPerson(
                adult: false,
                gender: 1,
                id: 1815065,
                knownForDepartment: 'Acting',
                name: 'Christa Taylor Brown',
                originalName: 'Christa Taylor Brown',
                popularity: 253.196,
                profilePath: '/uUgiI5y8aHA6bxYxzqzFQmgs6H6.jpg',
              ),
            ],
            totalPages: 10,
            totalResults: 100,
          ),
        );

        final result = await remoteDatasource.getPopularPeople();

        expect(
          result,
          contains(
            isA<Person>()
                .having((p) => p.gender, 'gender', Gender.female)
                .having((p) => p.id, 'id', 1815065)
                .having(
                    (p) => p.knownForDepartment, 'knownForDepartment', 'Acting')
                .having((p) => p.name, 'name', 'Christa Taylor Brown')
                .having((p) => p.popularity, 'popularity', 253.196)
                .having((p) => p.profileImageUrl, 'profileImageUrl',
                    contains('/uUgiI5y8aHA6bxYxzqzFQmgs6H6.jpg')),
          ),
        );
      });
    });
  });
}
