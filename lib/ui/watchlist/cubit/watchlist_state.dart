part of 'watchlist_cubit.dart';

sealed class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object?> get props => [];
}

class WatchlistInitial extends WatchlistState {
  const WatchlistInitial();
}

class WatchlistEmpty extends WatchlistState {
  const WatchlistEmpty();
}

class WatchlistHasMovies extends WatchlistState {
  const WatchlistHasMovies({
    required this.movies,
  });

  final List<MovieDetails> movies;

  @override
  List<Object?> get props => [movies];
}

class WatchlistFailure extends WatchlistState {
  const WatchlistFailure();
}
