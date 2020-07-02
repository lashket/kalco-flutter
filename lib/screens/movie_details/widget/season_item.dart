import 'package:flutter/material.dart';
import 'package:vix/domain/models/season.dart';
import 'package:vix/screens/movie_details/widget/episodes_bottom_sheet.dart';

class SeasonItem extends StatelessWidget {
  final Season season;

  const SeasonItem({this.season});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _seasonGridView(season, context),
    );
  }

  Widget _seasonGridView(Season season, BuildContext context) {
    return Container(
      child: Card(
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                isDismissible: true,
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return EpisodesBottomSheet(
                    episodes: season.episodes,
                  );
                });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.deepPurpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Center(
                child: Text(
              '${season.number} сезон',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
