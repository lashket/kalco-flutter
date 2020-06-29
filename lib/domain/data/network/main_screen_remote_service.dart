import 'dart:convert';

import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/domain/models/section.dart';
import 'package:kalco_flutter/utils/constants.dart';
import 'package:http/http.dart' as http;

class MainScreenRemoteService {

  Future<List<Section>> getSectionsList() async {
    final response = await http.get('${BASE_URL}main/sections');
    if(response.statusCode != 200) {
      throw('Error when loading sections');
    }
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Section>((json) => Section.fromJson(json)).toList();
  }

  Future<List<Movie>> getHeaderMovies() async {
    final response = await http.get('${BASE_URL}main/header');
    if(response.statusCode != 200) {
      throw('Error when loading header items');
    }
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

}