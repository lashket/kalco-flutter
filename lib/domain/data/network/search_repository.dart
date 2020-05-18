import 'package:kalco_flutter/domain/data/network/kalco_remote_service.dart';
import 'package:kalco_flutter/domain/data/parsers/response_to_list_converters.dart';
import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/utils/helpers.dart';

class SearchRepository {

  final kalcoRemoteService = KalcoRemoteService();

  Future<List<Movie>> fetchMoviesByParameters(Map<String, String> requestMap) async {
    final response  = await kalcoRemoteService.get("videos/" + Helpers.instance.convertMapToQueryString(requestMap));
    ResponseToListConverters.instance.parseMovies(response);
  }

}