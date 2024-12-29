import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';
import 'package:flutter_movie_app/data/repositories/person_repository.dart';
import 'package:flutter_movie_app/data/repositories/tv_show_repository.dart';
import 'package:flutter_movie_app/ui/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<MovieRepository>(),
  MockSpec<TvShowRepository>(),
  MockSpec<PersonRepository>()
])
import 'home_cubit_test.mocks.dart';

final _fakeMovies = [
  Movie(
    backdropImageUrl: 'backdrop',
    id: 123,
    overview: 'overview',
    popularity: 100.0,
    posterImageUrl: 'poster',
    releaseDate: DateTime.now(),
    title: 'title',
    voteAverage: 123.0,
    voteCount: 12,
  )
];

final _fakeTvShows = [
  TvShow(
    backdropImageUrl: 'backdrop',
    id: 1234,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 100.0,
    posterImageUrl: 'poster',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 100.0,
    voteCount: 100,
  ),
];

final _fakePeople = [
  Person(
    gender: Gender.female,
    id: 123,
    knownForDepartment: 'knownForDepartment',
    name: 'name',
    popularity: 100.0,
    profileImageUrl: 'profile',
  ),
];

void main() {
  late MockMovieRepository movieRepository;
  late MockTvShowRepository tvShowRepository;
  late MockPersonRepository personRepository;

  late HomeCubit homeCubit;

  setUp(() {
    movieRepository = MockMovieRepository();
    tvShowRepository = MockTvShowRepository();
    personRepository = MockPersonRepository();

    homeCubit = HomeCubit(
      movieRepository: movieRepository,
      tvShowRepository: tvShowRepository,
      personRepository: personRepository,
    );
  });

  group('HomeCubit', () {
    test('initial state is HomeLoading', () {
      expect(
        homeCubit.state,
        HomeLoading(),
      );
    });

    group('fetchHomeData', () {
      blocTest<HomeCubit, HomeState>(
        'calls getNowPlayingMovies from repository',
        build: () => homeCubit,
        act: (bloc) => bloc.fetchHomeData(),
        verify: (_) {
          verify(movieRepository.getNowPlayingMovies()).called(1);
        },
      );

      blocTest<HomeCubit, HomeState>(
        'emits HomeFailure when getNowPlayingMovies from repository fails',
        setUp: () {
          when(movieRepository.getNowPlayingMovies())
              .thenThrow(Exception('error'));
        },
        build: () => homeCubit,
        act: (bloc) => bloc.fetchHomeData(),
        expect: () => [
          HomeFailure(),
        ],
      );

      blocTest<HomeCubit, HomeState>(
        'emits HomeSuccess when getNowPlayingMovies from repository completes',
        setUp: () {
          when(movieRepository.getNowPlayingMovies())
              .thenAnswer((_) async => _fakeMovies);
        },
        build: () => homeCubit,
        act: (bloc) => bloc.fetchHomeData(),
        expect: () => [
          HomeSuccess(nowPlayingMovies: _fakeMovies),
        ],
      );
    });

    blocTest<HomeCubit, HomeState>(
      'calls getPopularMovies from repository',
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      verify: (_) {
        verify(movieRepository.getPopularMovies()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeFailure when getPopularMovies from repository fails',
      setUp: () {
        when(movieRepository.getPopularMovies()).thenThrow(Exception('error'));
      },
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      expect: () => [
        HomeFailure(),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeSuccess when getPopularMovies from repository success',
      setUp: () {
        when(movieRepository.getPopularMovies())
            .thenAnswer((_) async => _fakeMovies);
      },
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      expect: () => [
        HomeSuccess(popularMovies: _fakeMovies),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'calls getTopRatedMovies from repository',
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      verify: (_) {
        verify(movieRepository.getTopRatedMovies()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeFailure when getTopRatedMovies from repository fails',
      setUp: () {
        when(movieRepository.getTopRatedMovies()).thenThrow(Exception('error'));
      },
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      expect: () => [
        HomeFailure(),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeSuccess when getTopRatedMovies from repository success',
      setUp: () {
        when(movieRepository.getTopRatedMovies())
            .thenAnswer((_) async => _fakeMovies);
      },
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      expect: () => [
        HomeSuccess(topRatedMovies: _fakeMovies),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'calls getUpcomingMovies from repository',
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      verify: (_) {
        verify(movieRepository.getUpcomingMovies()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeFailure when getUpcomingMovies from repository fails',
      setUp: () {
        when(movieRepository.getUpcomingMovies()).thenThrow(Exception('error'));
      },
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      expect: () => [
        HomeFailure(),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeSuccess when getUpcomingMovies from repository success',
      setUp: () {
        when(movieRepository.getUpcomingMovies())
            .thenAnswer((_) async => _fakeMovies);
      },
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      expect: () => [
        HomeSuccess(upcomingMovies: _fakeMovies),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'calls getPopularTvShows from tv repository',
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      verify: (_) {
        verify(tvShowRepository.getPopularTvShows()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeFailure when getPopularTvShows from repository fails',
      setUp: () {
        when(tvShowRepository.getPopularTvShows())
            .thenThrow(Exception('fails'));
      },
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      expect: () => [
        HomeFailure(),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeSuccess when getPopularTvShows from repository success',
      setUp: () {
        when(tvShowRepository.getPopularTvShows())
            .thenAnswer((_) async => _fakeTvShows);
      },
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      expect: () => [
        HomeSuccess(
          popularTvShows: _fakeTvShows,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'calls getPopularPeople from repository',
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      verify: (_) {
        verify(personRepository.getPopularPeople()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeFailure when getPopularPeople from repository fails',
      setUp: () {
        when(personRepository.getPopularPeople()).thenThrow(Exception('fails'));
      },
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      expect: () => [
        HomeFailure(),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeSuccess when getPopularPeople from repository success',
      setUp: () {
        when(personRepository.getPopularPeople())
            .thenAnswer((_) async => _fakePeople);
      },
      build: () => homeCubit,
      act: (bloc) => bloc.fetchHomeData(),
      expect: () => [
        HomeSuccess(popularPeople: _fakePeople),
      ],
    );
  });
}
