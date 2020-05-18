import 'package:flutter/material.dart';

class DefaultRaisedButton extends StatelessWidget {
  String text;

  DefaultRaisedButton({this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
        ),
      ),
      textColor: Colors.white,
      color: Theme.of(context).accentColor,
    );
  }
}
