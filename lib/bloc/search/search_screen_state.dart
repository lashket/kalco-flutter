import 'package:equatable/equatable.dart';
import 'package:vix/domain/models/movie.dart';

abstract class SearchScreenState  {

  const SearchScreenState();


}

class SearchScreenInitial extends SearchScreenState {}

class MoviesLoaded extends SearchScreenState {

  final List<Movie> movies;

  const MoviesLoaded({this.movies});


}