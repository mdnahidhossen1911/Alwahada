import 'dart:convert';
import 'dart:io';

import 'package:alwahda/app/assets_path.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final Map<String, dynamic>? responseData;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage = 'Something went wrong!',
  });

}

class NetWorkCaller {
  final Logger _logger = Logger();

  Future<NetworkResponse> postRequestWithImage(String url, Map<String, dynamic>? body) async {
    try {
      Map<String, String> headers = {
        'content-type': 'application/json',
        'token': '',
      };

      _logger.i('URL: $url\nBody: $body');
      Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: headers,
      );

      _logger.i('response: ${jsonDecode(response.body)}');
      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedResponse);
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedResponse['error'],
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedResponse['error'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }

  }
}

