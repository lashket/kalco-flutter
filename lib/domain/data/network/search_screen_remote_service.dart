import 'dart:convert';

import 'package:vix/domain/models/movie.dart';
import 'package:vix/domain/models/section.dart';
import 'package:vix/utils/constants.dart';
import 'package:http/http.dart' as http;

class SearchScreenRemoteService {

  Future<List<Movie>> getMoviesByQuery(String query) async {
    final response = await http.get('${BASE_URL}videos?name=$query');
    if(response.statusCode != 200) {
      throw('Error when loading header items');
    }
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

}