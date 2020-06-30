import 'package:vix/domain/data/network/kalco_remote_service.dart';
import 'package:vix/domain/data/parsers/response_to_list_converters.dart';
import 'package:vix/domain/models/movie.dart';
import 'package:vix/utils/helpers.dart';

class SearchRepository {

  final kalcoRemoteService = KalcoRemoteService();

  Future<List<Movie>> fetchMoviesByParameters(Map<String, String> requestMap) async {
    final response  = await kalcoRemoteService.get("videos/" + Helpers.instance.convertMapToQueryString(requestMap));
    ResponseToListConverters.instance.parseMovies(response);
  }

}