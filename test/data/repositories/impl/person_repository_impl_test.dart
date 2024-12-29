import 'package:flutter_movie_app/data/remote/person_remote_datasource.dart';
import 'package:flutter_movie_app/data/repositories/impl/person_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_movie_app/data/models/models.dart';

@GenerateNiceMocks([MockSpec<PersonRemoteDatasource>()])
import 'person_repository_impl_test.mocks.dart';

const _person = Person(
  gender: Gender.female,
  id: 572043,
  knownForDepartment: 'Acting',
  name: 'Yang Mi',
  popularity: 209.663,
  profileImageUrl: 'profilePath',
);

void main() {
  group('PersonRepositoryImpl', () {
    group('getPopularPeople', () {
      test('calls getPopularPeople from remote datasource', () async {
        final personRemoteDatasource = MockPersonRemoteDatasource();
        final personRepository =
            PersonRepositoryImpl(remoteDatasource: personRemoteDatasource);
        when(personRemoteDatasource.getPopularPeople())
            .thenAnswer((_) async => [_person]);

        final result = await personRepository.getPopularPeople();

        expect(result, contains(_person));
        verify(personRemoteDatasource.getPopularPeople()).called(1);
      });

      test('throws when getPopularPeople from remote datasource fails',
          () async {
        final error = Exception('fail');
        final personRemoteDatasource = MockPersonRemoteDatasource();
        final personRepository =
            PersonRepositoryImpl(remoteDatasource: personRemoteDatasource);

        when(personRemoteDatasource.getPopularPeople()).thenThrow(error);

        expect(
          () async => personRepository.getPopularPeople(),
          throwsA(error),
        );
      });
    });
  });
}
