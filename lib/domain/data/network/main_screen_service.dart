import 'dart:convert';

import 'package:kalco_flutter/domain/error_handler/error_handler.dart';
import 'package:kalco_flutter/domain/error_handler/exceptions.dart';
import 'package:kalco_flutter/domain/models/section.dart';
import 'package:http/http.dart' as http;
import 'package:kalco_flutter/utils/constants.dart';

class MainScreenService {

  Future<dynamic> get(String url) async {
    var responseJson;
    print('get response from url $url');
    try {
      final response = await http.get(BASE_URL + url);
      print('$url Response is ${response.body}');
      responseJson = ErrorHandler().returnResponse(response);
    } on Exception {

    }
    return responseJson;
  }



}

