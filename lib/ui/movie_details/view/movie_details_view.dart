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

class _MovieDetailsSuccessView extends StatelessWidget {
  const _MovieDetailsSuccessView({
    required this.movieDetails,
    required this.casts,
  });

  final MovieDetails movieDetails;
  final List<Cast> casts;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 24),
      children: [
        MovieDetailsHeader(movieDetails: movieDetails),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _MovieOverview(
            overview: movieDetails.overview,
          ),
        ),
        Divider(),
        PersonList(
          header: 'Top Billed Cast',
          people: casts,
        ),
        SizedBox(height: 24),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _MovieDetails(
            movieDetails: movieDetails,
          ),
        ),
      ],
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
