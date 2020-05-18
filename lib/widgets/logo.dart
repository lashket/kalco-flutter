import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  double width;
  double height;

  Logo({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: Image.asset('assets/img/vix_logo_transparent.png'));
  }
}