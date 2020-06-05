import 'package:flutter/material.dart';

class FullScreenErrorView extends StatelessWidget {

  String text;

  FullScreenErrorView({this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Text(text, style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}