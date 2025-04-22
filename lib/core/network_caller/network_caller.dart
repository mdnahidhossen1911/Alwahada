import 'dart:convert';
import 'package:alwahda/feature/auth/ui/controller/auth_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
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

  Future<NetworkResponse> getRequest(String url) async {
    try {
      Map<String, String> headers = {
        'content-type': 'application/json',
        'auth_key': Get
            .find<AuthController>()
            .uid ?? '',
      };
      _logger.i('URL: $url\nHeaders: $headers');
      Response response = await get(Uri.parse(url), headers: headers);
      final decodeResponce = jsonDecode(response.body);
      _logger.i('response: $decodeResponce');
      if (response.statusCode == 200) {
        return NetworkResponse(isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodeResponce);
      } else {
        return NetworkResponse(isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: decodeResponce['error'] ?? 'Something went wrong!',
        );
      }
    } catch (e) {
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }


  Future<NetworkResponse> postRequest(String url,
      Map<String, dynamic>? body) async {
    try {
      Map<String, String> headers = {
        'content-type': 'application/json',
        'token': Get
            .find<AuthController>()
            .uid ?? '',
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

