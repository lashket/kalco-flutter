import 'package:flutter/material.dart';
import 'package:vix/domain/models/movie.dart';

class HeaderSlide extends StatefulWidget {
  final Movie movie;

  HeaderSlide(this.movie);

  @override
  _HeaderSlideState createState() => _HeaderSlideState();
}

class _HeaderSlideState extends State<HeaderSlide> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.movie.mediumImage),
            )),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).primaryColor.withOpacity(0.4)
                  ])),
        ),
      ),
    );
  }
}

//Navigator.push(context,MaterialPageRoute(
//builder: (context) => MovieDetails()
//));
