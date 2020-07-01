import 'package:vix/domain/data/network/kalco_remote_service.dart';
import 'package:vix/domain/data/network/movies_remote_service.dart';
import 'package:vix/domain/models/movie.dart';

class MoviesRepository {

  final _moviesRemoteService = MoviesRemoteService();

  Future<Movie> getMovieById(int id) async {
    final response = await _moviesRemoteService.getMovieById(id);
    return response;
  }

}