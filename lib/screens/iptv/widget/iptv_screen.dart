import 'package:flutter/material.dart';

class IPTVScreen extends StatefulWidget {

  @override
  _IPTVScreenState createState() => _IPTVScreenState();
}

class _IPTVScreenState extends State<IPTVScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IPTV screen'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor:Theme.of(context).primaryColor,
      body: Container(
        child: Text('IPTV screen'),
      ),
    );
  }
}