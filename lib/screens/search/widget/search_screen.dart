import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vix/bloc/search/search_screen_bloc.dart';
import 'package:vix/bloc/search/search_screen_event.dart';
import 'package:vix/bloc/search/search_screen_state.dart';
import 'package:vix/domain/models/movie.dart';
import 'package:vix/screens/movie_details/widget/movie_details_screen.dart';
import 'package:vix/screens/search/widget/filter_bottom_sheet.dart';
import 'package:vix/screens/search/widget/search_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vix/widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "fab",
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(
            Icons.filter_list,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext ctx) {
                  return FilterBottomSheet();
                });
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: SearchInput(),
                ),
              ),
            ),
            _body()
          ],
        ));
  }

  Widget _body() {
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
      builder: (context, state) {
        if (state is SearchScreenInitial) {
//          print('Loading movies by query');
//          BlocProvider.of<SearchScreenBloc>(context)
//              .add(LoadFilmsByQuery(query: "кр"));
        }
        if (state is MoviesLoaded) {
          print('Movies loaded ${state.movies.length}');
          return _moviesGridView(state.movies, context);
        }
        return SliverToBoxAdapter(child: Container());
      },
    );
  }

  Widget _moviesGridView(List<Movie> movies, BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.6,
          crossAxisCount: (MediaQuery.of(context).size.width / 120).round()),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(0),
            child:_movieItem(movies[index]),
          );
        },
        childCount: movies.length,
      ),
    );
  }

  Widget _movieItem(Movie movie) {
    return Container(
      height: 220,
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
