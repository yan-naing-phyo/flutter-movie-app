import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/data/models/movie.dart';
import 'package:flutter_movie_app/data/models/person.dart';
import 'package:flutter_movie_app/data/models/tv_show.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';
import 'package:flutter_movie_app/data/repositories/person_repository.dart';
import 'package:flutter_movie_app/data/repositories/tv_show_repository.dart';

import 'package:flutter_movie_app/ui/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (_) => HomeCubit(
            movieRepository: context.read<MovieRepository>(),
            tvShowRepository: context.read<TvShowRepository>(),
            personRepository: context.read<PersonRepository>(),
          )..fetchHomeData(),
          child: HomeView(),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state) {
          case HomeLoading():
            return LoadingIndicator();

          case HomeSuccess():
            return HomePopulated(
              nowPlayingMovies: state.nowPlayingMovies,
              popularMovies: state.popularMovies,
              topRatedMovies: state.topRatedMovies,
              upcomingMovies: state.upcomingMovies,
              popularTvShows: state.popularTvShows,
              popularCelebrities: state.popularPeople,
            );

          case HomeFailure():
            return Text('failure');
        }
      },
    );
  }
}

class HomePopulated extends StatelessWidget {
  const HomePopulated({
    super.key,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
    required this.popularTvShows,
    required this.popularCelebrities,
  });

  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;
  final List<TvShow> popularTvShows;
  final List<Person> popularCelebrities;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        MovieCarousel(
          movies: popularMovies,
        ),
        SizedBox(height: 24.0),
        MovieList(
          headerText: 'Now Playing Movies',
          movies: nowPlayingMovies,
        ),
        SizedBox(height: 24.0),
        MovieList(
          headerText: 'Top Rated Movies',
          movies: topRatedMovies,
        ),
        SizedBox(height: 24.0),
        MovieList(
          headerText: 'Upcoming Movies',
          movies: upcomingMovies,
        ),
        SizedBox(height: 24.0),
        TvShowList(tvShows: popularTvShows),
        SizedBox(height: 24.0),
        PersonList(people: popularCelebrities),
      ],
    );
  }
}
