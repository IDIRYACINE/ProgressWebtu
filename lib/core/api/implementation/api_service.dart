import 'dart:convert';

import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:progresswebtu/core/api/types.dart';
import 'package:progresswebtu/core/api/utility/parser.dart';
import 'api_responses.dart';
import 'apis.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  static String _authKey = "";

  static String _username = "";
  static String _bacYear = "";

  ApiService._internal();

  factory ApiService.instance() {
    return _instance;
  }

  final http.Client _client = http.Client();

  Future<void> login(String username, String password,
      {required OnLoginSuccess onSucess, required VoidCallback onFail}) async {
    Api api = AuthenticateApi();

    Uri url = Uri.https(host, api.url);

    Map<String, Object> body = {"username": username, "password": password};
    Map<String, String> headers = {"Content-Type": "application/json"};

    _client
        .post(url, body: jsonEncode(body), headers: headers)
        .then((response) {
      try {
        final decodedResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        AuthResponse authResponse = AuthResponse.fromJson(decodedResponse);
        _authKey = authResponse.token;

        _username = parseBacNumberFromUsername(username);
        _bacYear = parseBacYearFromUsername(username);

        onSucess(authResponse);
      } catch (e) {

        onFail();
      }
    });
  }

  Future<void> logout() async {
    _client.close();
  }

  Future<BacSummary?> getBacSummary() async {
    Api api = BacSummaryApi();

    String apiUrl = api.url.replaceAll(usernameToken, _username);
    apiUrl = apiUrl.replaceAll(bacYearToken, _bacYear);

    Uri url = Uri.https(host, apiUrl);

    final headers = {"authorization": _authKey};

    return _client.get(url, headers: headers).then((response) {
      try {
        final decodedResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        BacSummary bacSummary = BacSummary.fromJson(decodedResponse);
        return bacSummary;
      } catch (e) {
        return null;
      }
    });
  }
}
