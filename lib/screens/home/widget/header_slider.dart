import 'package:flutter/material.dart';
import 'package:kalco_flutter/bloc/main/main_screen_bloc.dart';
import 'package:kalco_flutter/bloc/main/main_screen_event.dart';
import 'package:kalco_flutter/bloc/main/main_screen_state.dart';
import 'package:kalco_flutter/domain/models/api_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/screens/home/widget/header_slide.dart';

class HeaderSlider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      child: _buildSlider(context),
    );
  }

  Widget _buildSlider(BuildContext context) {
    BlocProvider.of<MainScreenBloc>(context).add(LoadHeaderSerials());
    return BlocListener<MainScreenBloc, MainScreenState> (
      listener: (context, state) {

      },
      child: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          if(state is MainScreenInitial) {

          }
          if(state is HeaderItemsLoaded) {
            return _buildSliderView(state.headerItems);
          }
          return Container();
        },
      ),
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