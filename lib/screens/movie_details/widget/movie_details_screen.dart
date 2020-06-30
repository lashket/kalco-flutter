

import 'package:flutter/material.dart';
import 'package:vix/base/bloc_provider.dart';
import 'package:vix/domain/models/api_response.dart';
import 'package:vix/domain/models/movie.dart';
import 'package:vix/screens/movie_details/bloc/movie_details_screen_bloc.dart';
import 'package:vix/screens/movie_details/widget/body.dart';
import 'package:vix/screens/movie_details/widget/header.dart';
import 'package:vix/widgets/full_screen_view.dart';

class MovieDetails extends StatefulWidget {

  int id;

  MovieDetails({this.id});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  MovieDetailsBloc bloc;

  @override
  void initState() {
    bloc = MovieDetailsBloc();
    bloc.getMovie(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      bloc: bloc,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _buildPage(),
      )
    );
  }

  Widget _buildPage() {
    return StreamBuilder<ApiResponse<Movie>>(
      stream: bloc.movieStream,
      builder: (context, snapshot){
        if(snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return FullScreenErrorView(text: snapshot.data.message,);
              break;
            case Status.COMPLETED:
              return _buildPageView(snapshot.data.data);
              break;
            case Status.ERROR:
              return FullScreenErrorView(text: snapshot.data.message,);
              break;
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildPageView(Movie movie) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "play_btn",
        child: Icon(Icons.play_arrow, color: Colors.white,),
        onPressed: () {

        },
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            MovieDetailsHeader(
              name: movie.name,
              photoUrl: movie.mediumImage,
            ),
          ];
        },
        body: Body(movie: movie,),
      ),
    );
  }

}