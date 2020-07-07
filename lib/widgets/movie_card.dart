import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vix/domain/models/movie.dart';
import 'package:vix/screens/movie_details/widget/movie_details_screen.dart';

class MovieCard extends StatelessWidget {

  final Movie movie;

  const MovieCard({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MovieDetails(
                      id: movie.id,
                    )));
          },
          child: Column(
            children: [
              Container(
                width: 120.0,
                height: 180,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      movie.mediumImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  alignment: Alignment(-1, -1),
                  child: RatingBar(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 12,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  alignment: Alignment(-1, -1),
                  child: Text(
                    movie.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
