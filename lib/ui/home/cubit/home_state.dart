part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  const HomeSuccess({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.upcomingMovies = const [],
    this.popularTvShows = const [],
    this.popularPeople = const [],
  });

  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;
  final List<TvShow> popularTvShows;
  final List<Person> popularPeople;

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        popularMovies,
        topRatedMovies,
        upcomingMovies,
        popularTvShows,
        popularPeople,
      ];
}

class HomeFailure extends HomeState {
  const HomeFailure([this.error]);

  final dynamic error;

  @override
  List<Object?> get props => [error];
}
