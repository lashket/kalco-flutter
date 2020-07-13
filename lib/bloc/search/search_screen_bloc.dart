import 'package:vix/bloc/search/search_screen_event.dart';
import 'package:vix/bloc/search/search_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vix/domain/data/network/search_screen_remote_service.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {

  final _repository = SearchScreenRemoteService();

  @override
  SearchScreenState get initialState => SearchScreenInitial();

  @override
  Stream<SearchScreenState> mapEventToState(SearchScreenEvent event) async* {
    if(event is LoadFilmsByQuery) {
      print(event.query);
      final list = await _repository.getMoviesByQuery(event.query);
      yield MoviesLoaded(movies: list);
    }
  }
}