import 'package:flutter/material.dart';
import 'package:kalco_flutter/domain/models/section.dart';
import 'package:kalco_flutter/screens/movie_details/widget/movie_details_screen.dart';

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
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 16
          ),
          child: Text(
            widget.section.sectionName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
//          style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Container(
          height: 180.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.section.movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                  right: 4
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MovieDetails(id: widget.section.movies[index].id,)
                    ));
                  },
                  child: Container(
                    width: 120.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child:  Image.network(
                            widget.section.movies[index].mediumImage, fit: BoxFit.cover,
                        ),
                      ),
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