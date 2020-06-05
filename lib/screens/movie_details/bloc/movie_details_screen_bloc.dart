import 'dart:async';

import 'package:kalco_flutter/base/bloc.dart';
import 'package:kalco_flutter/domain/data/network/movies_repository.dart';
import 'package:kalco_flutter/domain/models/api_response.dart';
import 'package:kalco_flutter/domain/models/movie.dart';

class MovieDetailsBloc implements Bloc {

  final _repository = MoviesRepository();

  final _movieController = StreamController<ApiResponse<Movie>>.broadcast();

  Stream<ApiResponse<Movie>> get movieStream => _movieController.stream;

  StreamSink<ApiResponse<Movie>> get _movieStreamSink => _movieController.sink;

  void getMovie(int id) async {
      _movieStreamSink.add(ApiResponse.loading('Загрузка контента'));
      try {
        Movie movie = await _repository.getMovieById(id);
        _movieStreamSink.add(ApiResponse.completed(movie));
      } catch(e) {
        _movieStreamSink.add(ApiResponse.error(e.toString()));
      }
  }


  @override
  void dispose() {
    _movieController.close();
  }
}