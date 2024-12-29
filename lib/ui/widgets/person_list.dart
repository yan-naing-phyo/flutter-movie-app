import 'package:flutter/material.dart';
import 'package:flutter_movie_app/data/models/models.dart';
import 'package:flutter_movie_app/ui/widgets/list_header.dart';

import 'profile_image.dart';

class PersonList extends StatelessWidget {
  const PersonList({super.key, required this.header, required this.people});

  static const double _listViewHeight = 320;

  final String header;
  final List<Person> people;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListHeader(
          headerText: header,
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
      itemBuilder: (context, index) => _buildItem(
        context,
        person: people[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 12.0,
      ),
      itemCount: people.length,
    );
  }

  Widget _buildItem(BuildContext context, {required Person person}) {
    return Container(
      width: _itemWidth,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: person is Cast
          ? CastItem(cast: person)
          : PopularCelebrityItem(person: person),
    );
  }
}

class CastItem extends StatelessWidget {
  const CastItem({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ProfileImage(imageUrl: cast.profileImageUrl),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: _PersonName(name: cast.name),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: _CharacterName(characterName: cast.character),
        ),
      ],
    );
  }
}

class _CharacterName extends StatelessWidget {
  const _CharacterName({required this.characterName});

  final String characterName;

  @override
  Widget build(BuildContext context) {
    return Text(
      characterName,
      maxLines: 2,
      overflow: TextOverflow.clip,
    );
  }
}

class PopularCelebrityItem extends StatelessWidget {
  const PopularCelebrityItem({super.key, required this.person});

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
