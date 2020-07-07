import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vix/domain/models/section.dart';
import 'package:vix/screens/movie_details/widget/movie_details_screen.dart';
import 'package:vix/widgets/movie_card.dart';

class SectionView extends StatefulWidget {
  Section section;

  SectionView({this.section});

  @override
  _SectionViewState createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  @override
  Widget build(BuildContext context) {
    return getSection();
  }

  Widget getSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
          child: Text(
            widget.section.sectionName,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
//          style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Container(
          height: 220,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.section.movies.length,
            itemBuilder: (context, index) {
              return MovieCard(movie: widget.section.movies[index],);
            },
          ),
        )
      ],
    );
  }
}
