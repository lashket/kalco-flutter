import 'dart:convert';
import 'package:vix/domain/data/network/main_screen_remote_service.dart';
import 'package:vix/domain/data/parsers/response_to_list_converters.dart';
import 'package:vix/domain/models/movie.dart';
import 'package:vix/domain/models/section.dart';

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
