import 'dart:convert';

import 'package:kalco_flutter/domain/data/network/main_screen_service.dart';
import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/domain/models/section.dart';

class MainScreenRepository {
  final MainScreenService mainScreenService = MainScreenService();

  Future<List<Section>> fetchSections() async {

    final response = await mainScreenService.get("main/sections");

    return parseSections(response);
  }

  Future<List<Movie>> fetchHeaderMovies() async {

    final response = await mainScreenService.get("main/header");

    return parseMovies(response);

  }

  List<Section> parseSections(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Section>((json) => Section.fromJson(json)).toList();
  }

  List<Movie> parseMovies(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
  }
}
