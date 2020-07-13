import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vix/bloc/main/main_screen_bloc.dart';
import 'package:vix/bloc/movie/movie_screen_bloc.dart';
import 'package:vix/bloc/player/player_screen_bloc.dart';
import 'package:vix/bloc/search/search_screen_bloc.dart';
import 'package:vix/navigation/destination.dart';
import 'package:vix/screens/auth_screen.dart';
import 'package:vix/screens/films/widget/films_screen.dart';
import 'package:vix/screens/home/widget/home_screen.dart';
import 'package:vix/screens/iptv/widget/iptv_screen.dart';
import 'package:vix/screens/profile/profile_screen.dart';
import 'package:vix/screens/search/widget/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenBloc>(create: (context) => MainScreenBloc()),
        BlocProvider<MovieScreenBloc>(create: (context) => MovieScreenBloc()),
        BlocProvider<PlayerScreenBloc>(create: (context) => PlayerScreenBloc()),
        BlocProvider<SearchScreenBloc>(create: (context) => SearchScreenBloc()),
      ],
      child: MaterialApp(
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
      ),
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
