import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/data/models/movie.dart';
import 'package:flutter_movie_app/data/models/person.dart';
import 'package:flutter_movie_app/data/models/tv_show.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';
import 'package:flutter_movie_app/data/repositories/person_repository.dart';
import 'package:flutter_movie_app/data/repositories/tv_show_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.movieRepository,
    required this.tvShowRepository,
    required this.personRepository,
  }) : super(HomeLoading());

  final MovieRepository movieRepository;
  final TvShowRepository tvShowRepository;
  final PersonRepository personRepository;

  void fetchHomeData() async {
    try {
      /// Fetch movies from movie repository.
      final nowPlayingMovies = await movieRepository.getNowPlayingMovies();
      final popularMovies = await movieRepository.getPopularMovies();
      final topRatedMovies = await movieRepository.getTopRatedMovies();
      final upcomingMovies = await movieRepository.getUpcomingMovies();

      /// Fetch tv-shows from tv-show repository.
      final popularTvShows = await tvShowRepository.getPopularTvShows();

      /// Fetch popular people from person repository.
      final popularPeople = await personRepository.getPopularPeople();

      final state = HomeSuccess(
        nowPlayingMovies: nowPlayingMovies,
        popularMovies: popularMovies,
        topRatedMovies: topRatedMovies,
        upcomingMovies: upcomingMovies,
        popularTvShows: popularTvShows,
        popularPeople: popularPeople,
      );

      emit(state);
    } catch (_) {
      emit(HomeFailure());
    }
  }
}
