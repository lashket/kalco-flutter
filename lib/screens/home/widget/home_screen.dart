import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalco_flutter/bloc/main/main_screen_bloc.dart';
import 'package:kalco_flutter/bloc/main/main_screen_event.dart';
import 'package:kalco_flutter/bloc/main/main_screen_state.dart';
import 'package:kalco_flutter/screens/home/widget/header_slider.dart';
import 'package:kalco_flutter/screens/home/widget/section_list.dart';
import 'package:kalco_flutter/screens/search/widget/search_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kalco_flutter/screens/search/widget/search_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "search_screen_btn",
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchScreen()));
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: _body());
  }

  Widget _body() {
    return  BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          if(state is MainScreenInitial) {
            BlocProvider.of<MainScreenBloc>(context).add(LoadingInfo());
          }
          if(state is ItemsLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[HeaderSlider(
                  movies: state.movies,
                ), SectionsList(
                  sections: state.sectionItems,
                )],
              ),
            );
          }
          return Container();
        },
      );
  }
}
