import 'package:vix/domain/data/network/search_screen_remote_service.dart';
import 'package:vix/domain/models/movie.dart';

class SearchScreenRepository {
  final  _remoteService = SearchScreenRemoteService();

  Future<List<Movie>> fetchMovies(String query) async {

    final response = await _remoteService.getMoviesByQuery(query);

    return response;

  }
  
}
