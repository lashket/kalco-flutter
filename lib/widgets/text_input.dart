import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {

  String hintText = "";

  TextInput({this.hintText});

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white
      ),
      cursorColor: Theme.of(context).accentColor,
        decoration: InputDecoration(
          labelText: widget.hintText,
          fillColor: Colors.white,
          labelStyle: TextStyle(
              color: Colors.white.withOpacity(0.5)
          ),
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(2.0),
            borderSide:
            new BorderSide(color: Colors.white.withOpacity(0.5)),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(2.0),
            borderSide:
            new BorderSide(color: Theme.of(context).accentColor),
          ),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(2.0),
            borderSide:
            new BorderSide(color: Theme.of(context).accentColor),
          ),
        ) //f
    );
  }
}