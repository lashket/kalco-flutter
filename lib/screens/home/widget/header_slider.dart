import 'package:flutter/material.dart';
import 'package:vix/bloc/main/main_screen_bloc.dart';
import 'package:vix/bloc/main/main_screen_event.dart';
import 'package:vix/bloc/main/main_screen_state.dart';
import 'package:vix/domain/models/api_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vix/domain/models/movie.dart';
import 'package:vix/screens/home/widget/header_slide.dart';

class HeaderSlider extends StatelessWidget {

  final List<Movie> movies;

  const HeaderSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      child: _buildSliderView(movies),
    );
  }



  Widget _buildSliderView(List<Movie> movies) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: PageView(
        controller: PageController(
            initialPage: 1,
        ),
        children: movies.map((Movie movie) => HeaderSlide(movie)).toList(),
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}