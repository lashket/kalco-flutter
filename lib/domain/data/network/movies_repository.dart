import 'package:kalco_flutter/domain/data/network/kalco_remote_service.dart';
import 'package:kalco_flutter/domain/models/movie.dart';

class MoviesRepository {

  final KalcoRemoteService service = KalcoRemoteService();

  Future<Movie> getMovieById(int id) async {
    final response = await service.get('videos/$id');
    print("Movie fetching response $response");
    return Movie.fromJson(response);
  }

}