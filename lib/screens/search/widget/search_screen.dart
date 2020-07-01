import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vix/screens/search/widget/filter_bottom_sheet.dart';
import 'package:vix/screens/search/widget/search_input.dart';

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
        ));
  }
}
