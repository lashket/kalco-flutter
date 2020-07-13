import 'package:flutter/material.dart';
import 'package:vix/bloc/search/search_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vix/bloc/search/search_screen_event.dart';

class SearchInput extends StatefulWidget {
  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0
      ),
      onChanged: (text) {
        if(text.length > 2) {
          BlocProvider.of<SearchScreenBloc>(context)
              .add(LoadFilmsByQuery(query: text));
        }
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
          fillColor: Colors.white.withOpacity(0.5),
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5)
          ),
          hintText: 'Введите название сериала',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey.withOpacity(0.5),
          ),
      ),
    );
  }
}