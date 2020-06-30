import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vix/bloc/delegate/simple_bloc_delegate.dart';
import 'package:vix/screens/main/app.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff182837),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

