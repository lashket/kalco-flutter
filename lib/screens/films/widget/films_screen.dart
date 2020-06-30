import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vix/widgets/under_construction.dart';

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
      body: UnderConstruction()
    );
  }
}