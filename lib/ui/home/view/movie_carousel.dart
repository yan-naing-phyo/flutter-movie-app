import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/models/movie.dart';
import 'package:flutter_movie_app/ui/movie_details/view/movie_details_page.dart';
import 'package:flutter_movie_app/ui/widgets/widgets.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({
    super.key,
    this.period,
    this.animationDuration,
    required this.movies,
  });

  final Duration? period;
  final Duration? animationDuration;
  final List<Movie> movies;

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  final PageController _pageController = PageController();
  late StreamSubscription _subscription;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();

    final itemCount = widget.movies.length;

    _subscription = Stream.periodic(Duration(seconds: 3)).listen(
      (event) {
        if (_pageController.hasClients && _pageIndex < (itemCount - 1)) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 700),
            curve: Curves.decelerate,
          );
          _pageIndex++;
        }
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _subscription.cancel();

    super.dispose();
  }

  void _goToMovieDetailsScreen(String movieId) {
    Navigator.of(context).push(
      MovieDetailsPage.route(movieId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) =>
            _buildCarouselItem(widget.movies[index]),
        itemCount: widget.movies.length,
      ),
    );
  }

  Widget _buildCarouselItem(Movie movie) {
    return InkWell(
      onTap: () {
        _goToMovieDetailsScreen(movie.id.toString());
      },
      child: _CarouselItem(
        movie: movie,
      ),
    );
  }
}

class _CarouselItem extends StatelessWidget {
  const _CarouselItem({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // return Image.asset('assets/images/backdropmoana.jpg');
    return Stack(
      children: [
        AppNetworkImage(imageUrl: movie.backdropImageUrl),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black26],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 0.9],
            ),
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 16.0,
          right: 16.0,
          child: Text(
            movie.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
