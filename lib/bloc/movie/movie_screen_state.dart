import 'package:equatable/equatable.dart';
import 'package:vix/domain/models/movie.dart';

abstract class MovieScreenState extends Equatable {

  const MovieScreenState();

  @override
  List<Object> get props => [];

}

class MovieInitial extends MovieScreenState {}

class MovieLoading extends MovieScreenState {}

class MovieLoaded extends MovieScreenState {

  final Movie movie;

  const MovieLoaded({this.movie});

  @override
  List<Object> get props => [
    movie
  ];

}

class MovieLoadingError extends MovieScreenState {}

