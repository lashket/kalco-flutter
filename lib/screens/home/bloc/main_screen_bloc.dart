import 'dart:async';

import 'package:kalco_flutter/base/bloc.dart';
import 'package:kalco_flutter/domain/data/network/main_screen_repository.dart';
import 'package:kalco_flutter/domain/models/api_response.dart';
import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/domain/models/section.dart';

class MainScreenBloc implements Bloc {

  final _repository = MainScreenRepository();

  final _sectionsController = StreamController<ApiResponse<List<Section>>>.broadcast();
  final _moviesController = StreamController<ApiResponse<List<Movie>>>.broadcast();

  Stream<ApiResponse<List<Section>>> get sectionsStream => _sectionsController.stream;
  Stream<ApiResponse<List<Movie>>> get moviesStream => _moviesController.stream;

  StreamSink<ApiResponse<List<Section>>> get sectionsSinkStream => _sectionsController.sink;
  StreamSink<ApiResponse<List<Movie>>> get moviesSinkStream => _moviesController.sink;

  void getSections() async {
    sectionsSinkStream.add(ApiResponse.loading("Fetching sections"));
    try {
      List<Section> sections = await _repository.fetchSections();
      sectionsSinkStream.add(ApiResponse.completed(sections));
    } catch(e) {
      sectionsSinkStream.add(ApiResponse.error(e.toString()));
    }
  }

  void getHeaderMovies() async {
    moviesSinkStream.add(ApiResponse.loading("Fetching sections"));
    try {
      List<Movie> movies = await _repository.fetchHeaderMovies();
      moviesSinkStream.add(ApiResponse.completed(movies));
    } catch(e) {
      moviesSinkStream.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _moviesController.close();
    _sectionsController.close();
  }


}