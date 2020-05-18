import 'package:flutter/material.dart';

class FilmsScreen extends StatefulWidget {

  @override
  _FilmsScreenState createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search, color: Colors.white,),
        onPressed: () {

        },
      ),
      appBar: AppBar(
        title: Text('Films screen'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor:Theme.of(context).primaryColor,
      body: Container(
        child: Text('Films screen'),
      ),
    );
  }
}