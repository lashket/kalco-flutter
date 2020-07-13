import 'package:equatable/equatable.dart';

abstract class SearchScreenEvent extends Equatable {

  const SearchScreenEvent();

  @override
  List<Object> get props {

  }
}

class LoadFilmsByQuery extends SearchScreenEvent {

  final String query;

  const LoadFilmsByQuery({this.query});

  @override
  List<Object> get props => [
    query
  ];

}