import 'package:flutter/material.dart';
import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/screens/movie_details/movie_details_screen.dart';

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
          child: Image.network(
            
            widget.movie.mediumImage,
            fit: BoxFit.cover,),
        ),
      ),
    );
  }
}

//Navigator.push(context,MaterialPageRoute(
//builder: (context) => MovieDetails()
//));