import 'dart:convert';

import 'package:kalco_flutter/domain/data/network/kalco_remote_service.dart';
import 'package:kalco_flutter/domain/data/parsers/response_to_list_converters.dart';
import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/domain/models/section.dart';

class MainScreenRepository {
  final KalcoRemoteService kalcoRemoteService = KalcoRemoteService();

  Future<List<Section>> fetchSections() async {

    final response = await kalcoRemoteService.get("main/sections");

    return ResponseToListConverters.instance.parseSections(response);
  }

  Future<List<Movie>> fetchHeaderMovies() async {

    final response = await kalcoRemoteService.get("main/header");

    return ResponseToListConverters.instance.parseMovies(response);

  }
  
}
