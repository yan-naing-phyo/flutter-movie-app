import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';
import 'package:flutter_movie_app/ui/movie_details/cubit/movie_details_cubit.dart';

import 'movie_details_view.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    super.key,
    required this.movieId,
  });

  static route(String movieId) => MaterialPageRoute(
        builder: (context) => MovieDetailsPage(movieId: movieId),
      );

  final String movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(
        movieRepository: context.read<MovieRepository>(),
      )..fetchData(movieId),
      child: MovieDetailsView(),
    );
  }
}
