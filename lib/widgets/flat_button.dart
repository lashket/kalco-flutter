import 'package:flutter/material.dart';

class DefaultFlatButton extends StatelessWidget {
  String text;

  DefaultFlatButton({this.text});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){},
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
        ),
      ),
      textColor: Theme.of(context).accentColor,
    );
  }
}
