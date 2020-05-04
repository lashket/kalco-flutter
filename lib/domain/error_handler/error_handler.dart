import 'dart:convert';

import 'package:http/http.dart' as http;

import 'exceptions.dart';

class ErrorHandler {

  dynamic returnResponse(http.Response response) {
    print(response.body.toString());
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body.toString();
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }

  }

}