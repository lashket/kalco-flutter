import 'package:flutter/material.dart';
import 'package:vix/bloc/movie/movie_screen_bloc.dart';
import 'package:vix/bloc/movie/movie_screen_event.dart';
import 'package:vix/bloc/movie/movie_screen_state.dart';
import 'package:vix/domain/models/api_response.dart';
import 'package:vix/domain/models/movie.dart';
import 'package:vix/screens/movie_details/widget/body.dart';
import 'package:vix/screens/movie_details/widget/header.dart';
import 'package:vix/widgets/full_screen_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetails extends StatelessWidget {

  final int id;

  MovieDetails({this.id});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MovieScreenBloc>(context).add(LoadMovie(id: id));
    return  Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return BlocBuilder<MovieScreenBloc, MovieScreenState> (
      builder: (context, state) {
        if(state is MovieInitial) {

        }
        if(state is MovieLoaded) {
          return _buildPageView(state.movie, context);
        }
        if(state is MovieLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Container();
      },
    );
  }

  Widget _buildPageView(Movie movie, BuildContext context) {
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