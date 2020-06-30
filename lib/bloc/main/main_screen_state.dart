import 'package:equatable/equatable.dart';
import 'package:vix/domain/models/movie.dart';
import 'package:vix/domain/models/section.dart';

abstract class MainScreenState extends Equatable {

  const MainScreenState();

  @override
  List<Object> get props => [];

}

class HeaderItemsLoading extends MainScreenState {

}

class SectionsLoading extends MainScreenState {

}

class MainScreenInitial extends MainScreenState {}

class HeaderItemsLoaded  extends MainScreenState {

  final List<Movie> headerItems;

  const HeaderItemsLoaded({this.headerItems});

  @override
  List<Object> get props => [
    headerItems
  ];

}

class SectionsLoaded extends MainScreenState {

  final List<Section> sectionItems;

  const SectionsLoaded({this.sectionItems});

  @override
  List<Object> get props => [
    sectionItems
  ];

}

class ItemsLoaded extends MainScreenState {

  final List<Section> sectionItems;
  final List<Movie> movies;
  const ItemsLoaded({this.sectionItems, this.movies});

  @override
  List<Object> get props => [
    sectionItems,
    movies
  ];

}

class SectionLoadingError extends MainScreenState {}

class HeaderItemsLoadingError extends MainScreenState {}