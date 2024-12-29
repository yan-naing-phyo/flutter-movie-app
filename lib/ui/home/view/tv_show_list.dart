import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/models/tv_show.dart';
import 'package:flutter_movie_app/ui/widgets/widgets.dart';

class TvShowList extends StatelessWidget {
  const TvShowList({super.key, required this.tvShows});

  static const double _listViewHeight = 250.0;

  final List<TvShow> tvShows;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListHeader(headerText: 'TV Shows', onPressedSeeAll: () {}),
        Container(
          height: _listViewHeight,
          child: _TvShowListView(tvShows: tvShows),
        ),
      ],
    );
  }
}

class _TvShowListView extends StatelessWidget {
  const _TvShowListView({required this.tvShows});

  static const double _itemWidth = 300;

  final List<TvShow> tvShows;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          _buildTvShowItem(context, tvShow: tvShows[index]),
      separatorBuilder: (context, index) => SizedBox(width: 12.0),
      itemCount: tvShows.length,
    );
  }

  Widget _buildTvShowItem(BuildContext context, {required TvShow tvShow}) =>
      Container(
        width: _itemWidth,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: _TvShowItem(tvShow: tvShow),
      );
}

class _TvShowItem extends StatelessWidget {
  const _TvShowItem({required this.tvShow});

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            _TvBackdrop(backdropImageUrl: tvShow.backdropImageUrl),
            _PlayButton(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _TvShowName(name: tvShow.name),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _FirstAirDate(firstAirDate: tvShow.firstAirDate),
        ),
      ],
    );
  }
}

class _TvBackdrop extends StatelessWidget {
  const _TvBackdrop({required this.backdropImageUrl});

  static const double _aspectRatio = 16 / 9;

  final String backdropImageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _aspectRatio,
      // child: Image.asset('assets/images/tv_backdrop.jpg'),
      child: AppNetworkImage(imageUrl: backdropImageUrl),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton.outlined(
      onPressed: () {},
      icon: Icon(
        Icons.play_arrow,
        color: colorScheme.onPrimaryContainer,
      ),
      style: IconButton.styleFrom(
        side: BorderSide(width: 3.0, color: colorScheme.onPrimaryContainer),
      ),
    );
  }
}

class _TvShowName extends StatelessWidget {
  const _TvShowName({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.w600),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _FirstAirDate extends StatelessWidget {
  const _FirstAirDate({required this.firstAirDate});

  final String firstAirDate;

  @override
  Widget build(BuildContext context) {
    return Text(
      firstAirDate,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
