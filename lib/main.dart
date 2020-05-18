import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalco_flutter/screens/main/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff182837),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

