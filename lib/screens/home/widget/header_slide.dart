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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
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
                  colors: [Theme.of(context).accentColor.withOpacity(0.5), Colors.transparent]
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Navigator.push(context,MaterialPageRoute(
//builder: (context) => MovieDetails()
//));