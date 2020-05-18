import 'dart:convert';

import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/domain/models/section.dart';

class ResponseToListConverters {

  ResponseToListConverters._privateConstructor();

  static final ResponseToListConverters instance = ResponseToListConverters._privateConstructor();

  List<Section> parseSections(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Section>((json) => Section.fromJson(json)).toList();
  }

  List<Movie> parseMovies(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

}