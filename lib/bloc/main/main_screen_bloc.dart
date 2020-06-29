import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalco_flutter/bloc/main/main_screen_event.dart';
import 'package:kalco_flutter/bloc/main/main_screen_state.dart';
import 'package:kalco_flutter/domain/repository/main_screen_repository.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {

  final _repository = MainScreenRepository();

  @override
  MainScreenState get initialState => MainScreenInitial();

  @override
  Stream<MainScreenState> mapEventToState(MainScreenEvent event) async* {

    if(event is LoadHeaderSerials) {
      yield HeaderItemsLoading();
      final _headerSerials = await _repository.fetchHeaderMovies();
      print('header serials loaded');
      yield HeaderItemsLoaded(headerItems: _headerSerials);
    }

    if(event is LoadSectionsEvent) {
      yield SectionsLoading();
      final _sections = await _repository.fetchSections();
      print('sections loaded');
      yield SectionsLoaded(sectionItems: _sections);
    }
  }
}