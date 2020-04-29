import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile screen'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor:Theme.of(context).primaryColor,
      body: Container(
        child: Text('Profile screen'),
      ),
    );
  }
}