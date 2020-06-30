import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vix/widgets/flat_button.dart';
import 'package:vix/widgets/logo.dart';
import 'package:vix/widgets/raised_button.dart';
import 'package:vix/widgets/text_input.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Logo(
              width: 100,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextInput(hintText: 'Email',),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextInput(hintText: 'Пароль',),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: Container(
                width: double.infinity,
                child: DefaultRaisedButton(
                  text: "Войти",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: Container(
                width: double.infinity,
                child: DefaultFlatButton(
                  text: "Регистрация",
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
