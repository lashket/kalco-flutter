import 'package:equatable/equatable.dart';

abstract class PlayerScreenState extends Equatable {

  const PlayerScreenState();

  @override
  List<Object> get props => [];

}

class PlayerInitial extends PlayerScreenState {}

class PlayVideo extends PlayerScreenState {

  final String link;

  const PlayVideo({this.link});

  @override
  List<Object> get props => [
    link
  ];

}