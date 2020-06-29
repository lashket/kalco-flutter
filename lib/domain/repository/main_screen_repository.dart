import 'dart:convert';

import 'package:kalco_flutter/domain/data/network/kalco_remote_service.dart';
import 'package:kalco_flutter/domain/data/network/main_screen_remote_service.dart';
import 'package:kalco_flutter/domain/data/parsers/response_to_list_converters.dart';
import 'package:kalco_flutter/domain/models/movie.dart';
import 'package:kalco_flutter/domain/models/section.dart';

class MainScreenRepository {
  final  _remoteService = MainScreenRemoteService();

  Future<List<Section>> fetchSections() async {

    final response = await _remoteService.getSectionsList();

    return response;

  }

  Future<List<Movie>> fetchHeaderMovies() async {

    final response = await _remoteService.getHeaderMovies();

    return response;

  }
  
}
