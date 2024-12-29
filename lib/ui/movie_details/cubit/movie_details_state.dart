part of 'movie_details_cubit.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();

  @override
  List<Object?> get props => [];
}

class MovieDetailsSuccess extends MovieDetailsState {
  const MovieDetailsSuccess({
    required this.movieDetails,
    required this.casts,
  });

  final MovieDetails movieDetails;
  final List<Cast> casts;

  @override
  List<Object?> get props => [movieDetails, casts];
}

class MovieDetailsFailure extends MovieDetailsState {
  const MovieDetailsFailure([this.error]);

  final dynamic error;

  @override
  List<Object?> get props => [error];
}
