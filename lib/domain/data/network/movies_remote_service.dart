import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vix/domain/models/movie.dart';
import 'package:vix/utils/constants.dart';

class MoviesRemoteService {

  Future<Movie> getMovieById(int id) async {
    final response = await http.get('${BASE_URL}videos/$id');
    if(response.statusCode != 200) {
      throw('Error when loading video');
    }
    return Movie.fromJson(jsonDecode(response.body));
  }


}