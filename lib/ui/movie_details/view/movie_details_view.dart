import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/ui/home/home.dart';
import 'package:flutter_movie_app/ui/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_movie_app/ui/movie_details/movie_details.dart';
import 'package:flutter_movie_app/utils/currency_formatter.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            switch (state) {
              case MovieDetailsLoading():
                return LoadingIndicator();

              case MovieDetailsSuccess():
                return _MovieDetailsSuccessView(
                  movieDetails: state.movieDetails,
                  casts: state.casts,
                  addedToWatchlist: state.addedToWatchlist,
                );

              case MovieDetailsFailure():
                return Center(
                  child: Text(
                    'Something went wrong',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class _MovieDetailsSuccessView extends StatefulWidget {
  const _MovieDetailsSuccessView({
    required this.movieDetails,
    required this.casts,
    required this.addedToWatchlist,
  });

  final MovieDetails movieDetails;
  final List<Cast> casts;
  final bool addedToWatchlist;

  @override
  State<_MovieDetailsSuccessView> createState() =>
      _MovieDetailsSuccessViewState();
}

class _MovieDetailsSuccessViewState extends State<_MovieDetailsSuccessView> {
  bool _addedToWatchlist = false;

  @override
  void initState() {
    super.initState();

    _addedToWatchlist = widget.addedToWatchlist;
  }

  void _showMovieAddedSnackbar() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            _addedToWatchlist
                ? 'Movie added to watchlist'
                : 'Movie removed from watchlist',
          ),
          duration: Duration(seconds: 1),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 24),
      children: [
        MovieDetailsHeader(movieDetails: widget.movieDetails),
        Padding(
          padding: const EdgeInsets.all(16),
          child: _addedToWatchlist
              ? _RemoveFromWatchlistButton(
                  onPressed: () {
                    // Remove movie from watchlist.
                    context.read<MovieDetailsCubit>().removeMovieFromWatchlist(
                          widget.movieDetails.id.toString(),
                        );
                    setState(() {
                      _addedToWatchlist = false;
                    });
                    _showMovieAddedSnackbar();
                  },
                )
              : _AddToWatchlistButton(
                  onPressed: () {
                    // Add movie to watchlist.
                    context
                        .read<MovieDetailsCubit>()
                        .addMovieToWatchlist(widget.movieDetails);
                    setState(() {
                      _addedToWatchlist = true;
                    });
                    _showMovieAddedSnackbar();
                  },
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _MovieOverview(
            overview: widget.movieDetails.overview,
          ),
        ),
        Divider(),
        PersonList(
          header: 'Top Billed Cast',
          people: widget.casts,
        ),
        SizedBox(height: 24),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _MovieDetails(
            movieDetails: widget.movieDetails,
          ),
        ),
      ],
    );
  }
}

class _AddToWatchlistButton extends StatelessWidget {
  const _AddToWatchlistButton({
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      icon: Icon(Icons.add),
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(),
      ),
      label: Text('Add to watchlist'),
    );
  }
}

class _RemoveFromWatchlistButton extends StatelessWidget {
  const _RemoveFromWatchlistButton({super.key, required this.onPressed});

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: Icon(Icons.bookmark_added),
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(),
      ),
      label: Text('Remove from watchlist'),
    );
  }
}

class _MovieOverview extends StatelessWidget {
  const _MovieOverview({required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        Text(
          overview,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _MovieDetails extends StatelessWidget {
  const _MovieDetails({required this.movieDetails});

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    final details = [
      Detail(heading: 'Status', value: movieDetails.status),
      Detail(
        heading: 'Spoken Languages',
        value: movieDetails.spokenLanguages,
      ),
      Detail(
        heading: 'Budget',
        value: CurrencyFormatter.format(movieDetails.budget),
      ),
      Detail(
        heading: 'Revenue',
        value: CurrencyFormatter.format(movieDetails.revenue),
      ),
      Detail(heading: 'Tagline', value: movieDetails.tagline),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => _DetailItem(
        heading: details[index].heading,
        value: details[index].value,
      ),
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: details.length,
    );
  }
}

class _DetailItem extends StatelessWidget {
  const _DetailItem({
    required this.heading,
    required this.value,
  });

  final String heading;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: textTheme.titleMedium,
        ),
        Text(
          value,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
