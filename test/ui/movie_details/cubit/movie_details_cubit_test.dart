import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';
import 'package:flutter_movie_app/ui/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
import 'movie_details_cubit_test.mocks.dart';

final fakeMovieDetails = MovieDetails(
  backdropImageUrl: 'backdropImageUrl',
  budget: 10000,
  genres: [],
  homepage: 'homepage',
  id: 123,
  imdbId: 'imdbId',
  originCountry: [],
  originalLanguage: 'originalLanguage',
  originalTitle: 'originalTitle',
  overview: 'overview',
  popularity: 100.0,
  posterImageUrl: 'posterImageUrl',
  productionCompanies: [],
  productionCountries: [],
  releaseDate: DateTime(2024),
  revenue: 20000,
  runtime: 145,
  spokenLanguages: 'spokenLanguages',
  status: 'status',
  tagline: 'tagline',
  title: 'title',
  voteAverage: 12.0,
  voteCount: 100,
);

final fakeCasts = [
  Cast(
    gender: Gender.male,
    id: 123,
    knownForDepartment: 'knownForDepartment',
    name: 'name',
    popularity: 100.0,
    profileImageUrl: 'profileImageUrl',
    castId: 456,
    character: 'character',
    creditId: 'creditId',
    order: 0,
  ),
];

void main() {
  late MockMovieRepository repository;
  late MovieDetailsCubit movieDetailsCubit;

  setUp(() {
    repository = MockMovieRepository();
    movieDetailsCubit = MovieDetailsCubit(movieRepository: repository);
  });

  group('MovieDetailsCubit', () {
    test('initial state is Loading', () {
      expect(MovieDetailsCubit(movieRepository: repository).state,
          MovieDetailsLoading());
    });

    group('fetchData', () {
      const movieId = '123';

      blocTest<MovieDetailsCubit, MovieDetailsState>(
        'emits Failure when getMovieDetails from repository fails',
        setUp: () {
          when(repository.getMovieDetails(movieId))
              .thenThrow(Exception('fails'));
        },
        build: () => movieDetailsCubit,
        act: (bloc) => bloc.fetchData(movieId),
        expect: () => [
          isA<MovieDetailsFailure>()
              .having((s) => s.error, 'error', isA<Exception>()),
        ],
        verify: (_) {
          verify(repository.getMovieDetails(movieId)).called(1);
        },
      );

      blocTest<MovieDetailsCubit, MovieDetailsState>(
        'emits Success',
        setUp: () {
          when(repository.getMovieDetails(movieId))
              .thenAnswer((_) async => fakeMovieDetails);
          when(repository.getMovieCasts(movieId))
              .thenAnswer((_) async => fakeCasts);
        },
        build: () => movieDetailsCubit,
        act: (bloc) => bloc.fetchData(movieId),
        expect: () => [
          MovieDetailsSuccess(movieDetails: fakeMovieDetails, casts: fakeCasts),
        ],
        verify: (_) {
          verify(repository.getMovieDetails(movieId)).called(1);
          verify(repository.getMovieCasts(movieId)).called(1);
        },
      );
    });
  });
}
