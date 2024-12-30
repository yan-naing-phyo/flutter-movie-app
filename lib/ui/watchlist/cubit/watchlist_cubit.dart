import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/data/models/movie_details.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit({required this.movieRepository}) : super(WatchlistInitial()) {
    _fetchMoviesFromWatchlist();
  }

  final MovieRepository movieRepository;
  late StreamSubscription? _subscription;

  void _fetchMoviesFromWatchlist() {
    _subscription =
        movieRepository.getAllMoviesFromWatchlist().listen((movies) {
      if (movies.isEmpty) {
        emit(WatchlistEmpty());
        return;
      }

      emit(WatchlistHasMovies(movies: movies));
    }, onError: (error) {
      emit(WatchlistFailure());
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _subscription = null;

    return super.close();
  }
}
