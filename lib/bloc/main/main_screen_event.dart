import 'package:equatable/equatable.dart';

abstract class MainScreenEvent extends Equatable {

  const MainScreenEvent();

  @override

  List<Object> get props => [];


}

class LoadHeaderSerials extends MainScreenEvent {

  const LoadHeaderSerials();

  @override

  List<Object> get props => [];

}

class LoadSectionsEvent extends MainScreenEvent {

  const LoadSectionsEvent();

  @override

  List<Object> get props => [];

}

class LoadingInfo extends MainScreenEvent {

  const LoadingInfo();

}