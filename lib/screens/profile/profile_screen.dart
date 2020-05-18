import 'package:flutter/material.dart';
import 'package:kalco_flutter/screens/auth_screen.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthScreen();
  }
}