import 'package:equatable/equatable.dart';

abstract class MovieScreenEvent extends Equatable {

  const MovieScreenEvent();

  @override
  List<Object> get props => [];

}

class LoadMovie extends MovieScreenEvent {

  final int id;

  const LoadMovie({this.id});

  @override
  List<Object> get props => [
    id
  ];

}