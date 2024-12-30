import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app_bloc_observer.dart';
import 'package:flutter_movie_app/data/local/movie_local_datasource.dart';
import 'package:flutter_movie_app/data/remote/person_remote_datasource.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository.dart';
import 'package:flutter_movie_app/data/remote/movie_remote_datasource.dart';
import 'package:flutter_movie_app/data/remote/tv_show_remote_datasource.dart';
import 'package:flutter_movie_app/data/repositories/person_repository.dart';
import 'package:flutter_movie_app/data/repositories/tv_show_repository.dart';
import 'package:flutter_movie_app/network/movie_api.dart';
import 'package:flutter_movie_app/persistence/db_helper.dart';
import 'package:flutter_movie_app/ui/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  final movieApi = MovieApi();

  final DbHelper dbHelper = DbHelper.instance;
  await dbHelper.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        /// Provide [MovieRepository] to the widget tree.
        RepositoryProvider(
          create: (_) => MovieRepository(
            MovieRemoteDatasource(movieApi),
            MovieLocalDatasource(dbHelper.movieDao),
          ),
        ),

        /// Provide [TvShowRepository] to the widget tree.
        RepositoryProvider(
          create: (_) => TvShowRepository(TvShowRemoteDatasource(movieApi)),
        ),

        /// Provide [PersonRepository] to the widget tree.
        RepositoryProvider(
          create: (_) => PersonRepository(PersonRemoteDatasource(movieApi)),
        ),
      ],
      child: MovieApp(),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
