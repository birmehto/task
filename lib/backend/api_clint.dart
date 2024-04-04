import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test/model/login.dart';

class ApiClient {
  Future<LoginModel> login(String email, String password) async {
    const url = 'https://codegarage.in/ipop-team-tracker/api/login';
    final body = jsonEncode({
      'email': email,
      'password': password,
      'device_token': '123',
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        log(response.body);
        return LoginModel.fromJson(responseData);
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }

}
