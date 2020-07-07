import 'package:equatable/equatable.dart';

abstract class PlayerScreenEvent extends Equatable {

  const PlayerScreenEvent();

  @override
  List<Object> get props => [];

}

class StartPlayingVideoEvent extends PlayerScreenEvent {

  final String link;

  const StartPlayingVideoEvent({this.link});

  @override
  List<Object> get props => [
    link
  ];

}