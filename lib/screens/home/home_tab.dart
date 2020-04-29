import 'package:flutter/material.dart';
import 'package:kalco_flutter/screens/home/widget/home_screen.dart';
import 'package:kalco_flutter/screens/movie_details/movie_details_screen.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                print(settings.name);
                return HomeScreen();
              case '/details':
                print(settings.name);
                return MovieDetails();
            }
          },
        );
      },
    );
  }


}
