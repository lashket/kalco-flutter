import 'package:flutter/material.dart';
import 'package:kalco_flutter/navigation/destination.dart';
import 'package:kalco_flutter/screens/home/widget/home_screen.dart';
import 'package:kalco_flutter/screens/profile/profile_screen.dart';
import 'package:kalco_flutter/screens/search/search_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
          accentColor: Color(0xff007AFF),
          textTheme: TextTheme(
              headline1: TextStyle(
            fontSize: 18.0,
            color: Color(0xff000000),
          ))),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with TickerProviderStateMixin<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: <Widget>[HomeScreen(), SearchScreen(), ProfileScreen()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: Icon(destination.icon), title: Text(destination.title));
        }).toList(),
      ),
    );
  }
}
