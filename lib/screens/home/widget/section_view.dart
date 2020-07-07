import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vix/domain/models/section.dart';
import 'package:vix/screens/movie_details/widget/movie_details_screen.dart';

class SectionView extends StatefulWidget {
  Section section;

  SectionView({this.section});

  @override
  _SectionViewState createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  @override
  Widget build(BuildContext context) {
    return getSection();
  }

  Widget getSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
          child: Text(
            widget.section.sectionName,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
//          style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Container(
          height: 220,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.section.movies.length,
            itemBuilder: (context, index) {
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
                                    id: widget.section.movies[index].id,
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
                                widget.section.movies[index].mediumImage,
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
                              widget.section.movies[index].name,
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
            },
          ),
        )
      ],
    );
  }
}
