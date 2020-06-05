import 'package:flutter/material.dart';
import 'package:kalco_flutter/domain/models/movie.dart';

class Body extends StatefulWidget {

  Movie movie;

  Body({this.movie});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            widget.movie.description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14.0
            ),
          )
        ],
      ),
    );
  }
}