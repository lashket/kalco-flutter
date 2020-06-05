import 'package:flutter/material.dart';

class MovieDetailsHeader extends StatelessWidget {

  String name;
  String photoUrl;

  MovieDetailsHeader({this.name, this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 3,
      floating: false,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
          stretchModes: [
            StretchMode.zoomBackground,
            StretchMode.fadeTitle
          ],
          centerTitle: true,
          title: Text(name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              )),
          background: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(photoUrl),
                )
            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Theme.of(context).primaryColor, Colors.transparent]
                  )
              ),
            ),
          )),
    );
  }

}