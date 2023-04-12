import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpRequests {
  static final dio = Dio();

  // I usually use GetStorage to store token and other data.
  // but since this is a test case:
  static const accessToken =
      "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODE4NTQzOTgsInVzZXJfaWQiOjN9.t0KC0iFwjCDnOUdYNVSJ2DR5_qWkiwLIUfmXHkWB4WmC6TKykFtC2maofn2msynosFiDRzRNfoc2OlQBxrU77A";

  static Future<String?> post(String api, Map<String, dynamic> bodies) async {
    debugPrint("HttpRequest.post start");
    dio.options.headers["Authorization"] = "Bearer $accessToken";

    try {
      final response = await dio.post(api, data: bodies);
      if (response.statusCode == 200) return response.toString();
    } catch (e) {
      // #TODO: something
      debugPrint("HttpRequest.post() error: $e");
      return null;
    }
    return null;
  }
}
