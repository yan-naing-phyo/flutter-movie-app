import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/models/person.dart';
import 'package:flutter_movie_app/ui/home/widgets/list_header.dart';
import 'package:flutter_movie_app/ui/home/widgets/profile_image.dart';

class PersonList extends StatelessWidget {
  const PersonList({super.key, required this.people});

  static const double _listViewHeight = 320;

  final List<Person> people;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListHeader(
          headerText: 'Popular Celebrities',
          onPressedSeeAll: () {},
        ),
        Container(
          height: _listViewHeight,
          child: _PersonListView(people: people),
        ),
      ],
    );
  }
}

class _PersonListView extends StatelessWidget {
  const _PersonListView({required this.people});

  static const double _itemWidth = 140;

  final List<Person> people;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemBuilder: (context, index) => _buildPersonItem(
        context,
        person: people[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 12.0,
      ),
      itemCount: people.length,
    );
  }

  Widget _buildPersonItem(BuildContext context, {required Person person}) =>
      Container(
        width: _itemWidth,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: _PersonItem(person: person),
      );
}

class _PersonItem extends StatelessWidget {
  const _PersonItem({required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ProfileImage(imageUrl: person.profileImageUrl),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _Popularity(popularity: person.popularity),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _PersonName(name: person.name),
        ),
      ],
    );
  }
}

class _PersonName extends StatelessWidget {
  const _PersonName({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.w600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _Popularity extends StatelessWidget {
  const _Popularity({required this.popularity});

  final double popularity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _UpvoteIcon(),
        _PopularityText(popularity: popularity.toString()),
      ],
    );
  }
}

class _UpvoteIcon extends StatelessWidget {
  const _UpvoteIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_drop_up,
      color: Colors.greenAccent,
    );
  }
}

class _PopularityText extends StatelessWidget {
  const _PopularityText({required this.popularity});

  final String popularity;

  @override
  Widget build(BuildContext context) {
    return Text(
      popularity,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.w500),
    );
  }
}
