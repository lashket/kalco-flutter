import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor:Theme.of(context).primaryColor,
      body: Container(
      child: Text('Home screen'),
    ),
    );
  }
}
