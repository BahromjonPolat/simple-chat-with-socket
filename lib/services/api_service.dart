import 'dart:convert';

import 'package:http/http.dart' as http;

import '../hive_helper/app_prefs.dart';

class ApiService {
  const ApiService._();
  static const String baseUrl = 'http://192.168.43.42:5000/api';
  static const String socketUrl = 'http://192.168.43.42:3000';

  static Future<HttpResult> register({
    required String username,
    required String email,
    required String password,
  }) async {
    return await post(
      path: '/auth/register',
      body: {
        'username': username,
        'email': email,
        'password': password,
      },
    );
  }

  static Future<HttpResult> getUsers() async {
    return await post(path: '/auth/allusers/${AppPrefs.user?.sId}');
  }

  static Future<HttpResult> post({required String path, Object? body}) async {
    // String baseUrl = 'http://localhost:5000/api';

    try {
      Uri url = Uri.parse('$baseUrl$path');

      http.Response response = await http.post(
        url,
        body: jsonEncode(body ?? {}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return HttpResult(
          isSuccess: true,
          response: response.body,
          statusCode: response.statusCode,
        );
      }

      return HttpResult(
        isSuccess: false,
        response: response.body,
        statusCode: response.statusCode,
      );
    } catch (err) {
      return HttpResult(isSuccess: false, response: err, statusCode: -1);
    }
  }
}

class HttpResult {
  final int statusCode;
  final Object response;
  final bool isSuccess;
  HttpResult({
    required this.isSuccess,
    required this.response,
    required this.statusCode,
  });
}
