import 'package:flutter/material.dart';
import 'package:vix/domain/models/movie.dart';
import 'package:vix/screens/movie_details/widget/season_item.dart';

class Body extends StatelessWidget {

  Movie movie;

  Body({this.movie});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: _movieDescription(movie)),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3
          ),
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: _gridItemsGeometry(index, 2),
                  child: SeasonItem(season: movie.seasons[index],),
                );
              },
            childCount: movie.seasons.length,
          ),
        )
      ],
    );
  }

  Widget _movieDescription(Movie movie) {
    return Text(
      movie.description,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontSize: 14.0
      ),
    );
  }

  EdgeInsetsGeometry _gridItemsGeometry(int index, int axisCount) {
    if(index % axisCount == 0) {
      return EdgeInsets.only(left: 16);
    }else {
      return EdgeInsets.only(right: 16);
    }
  }

}