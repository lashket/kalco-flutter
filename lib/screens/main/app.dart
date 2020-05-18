import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalco_flutter/navigation/destination.dart';
import 'package:kalco_flutter/screens/auth_screen.dart';
import 'package:kalco_flutter/screens/films/widget/films_screen.dart';
import 'package:kalco_flutter/screens/home/widget/home_screen.dart';
import 'package:kalco_flutter/screens/iptv/widget/iptv_screen.dart';
import 'package:kalco_flutter/screens/profile/profile_screen.dart';
import 'package:kalco_flutter/screens/search/widget/search_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
          primaryColor: Color(0xff182837),
          primaryColorDark: Color(0xff182837),
          accentColor: Color(0xffF29E2E),
          canvasColor: Colors.transparent,
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: <Widget>[HomeScreen(),FilmsScreen(), IPTVScreen(), ProfileScreen()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Color(0x40979797),
        type: BottomNavigationBarType.fixed,
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
