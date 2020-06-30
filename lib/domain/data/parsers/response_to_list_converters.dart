import 'dart:convert';

import 'package:vix/domain/models/movie.dart';
import 'package:vix/domain/models/section.dart';

class ResponseToListConverters {

  ResponseToListConverters._privateConstructor();

  static final ResponseToListConverters instance = ResponseToListConverters._privateConstructor();

  List<Section> parseSections(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed.map<Section>((json) => Section.fromJson(json)).toList();
  }

  List<Movie> parseMovies(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

}