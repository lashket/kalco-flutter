import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalco_flutter/base/bloc_provider.dart';
import 'package:kalco_flutter/screens/home/bloc/main_screen_bloc.dart';
import 'package:kalco_flutter/screens/home/widget/header_slider.dart';
import 'package:kalco_flutter/screens/home/widget/section_list.dart';
import 'package:kalco_flutter/screens/movie_details/movie_details_screen.dart';
import 'package:kalco_flutter/screens/search/widget/search_input.dart';
import 'package:kalco_flutter/screens/search/widget/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainScreenBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = MainScreenBloc();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenBloc>(
        bloc: bloc,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              heroTag: "search_screen_btn",
              child: Icon(Icons.search, color: Colors.white,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SearchScreen()
                ));
              },
            ),
          backgroundColor: Theme.of(context).primaryColor,
          body: _body()
        ));
  }


  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderSlider(bloc),
          SectionsList(bloc)
        ],
      ),
    );
  }

}
