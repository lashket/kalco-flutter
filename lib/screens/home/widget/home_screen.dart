import 'package:flutter/material.dart';
import 'package:kalco_flutter/base/bloc_provider.dart';
import 'package:kalco_flutter/screens/home/bloc/main_screen_bloc.dart';
import 'package:kalco_flutter/screens/home/widget/header_slider.dart';
import 'package:kalco_flutter/screens/home/widget/section_list.dart';

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
          backgroundColor: Theme.of(context).primaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[HeaderSlider(bloc), SectionsList(bloc)],
            ),
          ),
        ));
  }
}
