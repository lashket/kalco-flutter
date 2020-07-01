import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vix/bloc/movie/movie_screen_event.dart';
import 'package:vix/bloc/movie/movie_screen_state.dart';
import 'package:vix/domain/repository/movies_repository.dart';

class MovieScreenBloc extends Bloc<MovieScreenEvent, MovieScreenState> {

  final _repository = MoviesRepository();

  @override
  MovieScreenState get initialState => MovieInitial();

  @override
  Stream<MovieScreenState> mapEventToState(MovieScreenEvent event) async* {
    if(event is LoadMovie) {
      yield MovieLoading();
      final movie = await _repository.getMovieById(event.id);
      yield MovieLoaded(movie: movie);
    }
  }
}