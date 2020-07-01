import 'package:flutter/material.dart';
import 'package:vix/domain/models/season.dart';

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
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Text(
            '${season.number} сезон',
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
