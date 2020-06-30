import 'dart:async';

import 'package:vix/base/bloc.dart';
import 'package:vix/domain/data/network/search_repository.dart';
import 'package:vix/domain/models/api_response.dart';
import 'package:vix/domain/models/movie.dart';

class SearchScreenBloc implements Bloc {

  final SearchRepository _repository = SearchRepository();

  final _moviesController = StreamController<ApiResponse<List<Movie>>>.broadcast();

  Stream<ApiResponse<List<Movie>>> get moviesStream => _moviesController.stream;

  StreamSink<ApiResponse<List<Movie>>> get moviesSinkStream => _moviesController.sink;

  void fetchMoviesByParameters(Map<String, String> map) async {
    moviesSinkStream.add(ApiResponse.loading("Fetching sections"));
    try {
      List<Movie> movies = await _repository.fetchMoviesByParameters(map);
      moviesSinkStream.add(ApiResponse.completed(movies));
    } catch(e) {
      print('Header movies loading error $e');
      moviesSinkStream.add(ApiResponse.error("Error"));
    }
  }

  @override
  void dispose() {
    _moviesController.close();
  }
}