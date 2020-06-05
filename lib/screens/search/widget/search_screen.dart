import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalco_flutter/base/bloc_provider.dart';
import 'package:kalco_flutter/screens/search/bloc/search_screen_bloc.dart';
import 'package:kalco_flutter/screens/search/widget/filter_bottom_sheet.dart';
import 'package:kalco_flutter/screens/search/widget/search_input.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {

  SearchScreenBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SearchScreenBloc();
  }

  @override
  void dispose() {
    super.dispose();
    FocusScope.of(context).unfocus();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchScreenBloc> (
      bloc: bloc,
      child:  Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.filter_list, color: Colors.white,),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext ctx) {
                return FilterBottomSheet();
              });
        },
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 24),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SearchInput(),
          )
        ],
      )
    ));
  }

}
