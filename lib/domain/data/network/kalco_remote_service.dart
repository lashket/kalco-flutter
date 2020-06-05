import 'dart:convert';

import 'package:kalco_flutter/domain/error_handler/error_handler.dart';
import 'package:kalco_flutter/domain/error_handler/exceptions.dart';
import 'package:kalco_flutter/domain/models/section.dart';
import 'package:http/http.dart' as http;
import 'package:kalco_flutter/utils/constants.dart';

class KalcoRemoteService {

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(BASE_URL + url,);
      responseJson = ErrorHandler().returnResponse(response);
    } on Exception {

    }
    return responseJson;
  }



}

