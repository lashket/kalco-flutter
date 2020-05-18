import 'package:flutter/material.dart';
import 'package:kalco_flutter/domain/models/movie.dart';

class HeaderSlide extends StatefulWidget {

  final Movie movie;

  HeaderSlide(this.movie);

  @override
  _HeaderSlideState createState() => _HeaderSlideState();
}

class _HeaderSlideState extends State<HeaderSlide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.movie.mediumImage),
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
    );
  }
}

//Navigator.push(context,MaterialPageRoute(
//builder: (context) => MovieDetails()
//));