import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/model/login.dart';

class AuthUtils {
  static const String _userKey = 'user';
  static const String _tokenKey = 'token';
static const String  _loginDataKey= 'loginData';
  // Save login data and token
  static Future<void> saveLoginData(String user, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, user);
    await prefs.setString(_tokenKey, token);
  }

  // Retrieve user from SharedPreferences
  static Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userKey);
  }

  // Retrieve token from SharedPreferences
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Clear user and token data
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_tokenKey);
  }
   static Future<void> saveLoginModelData(LoginModel loginModel) async {
    final prefs = await SharedPreferences.getInstance();
    final loginDataJson = jsonEncode(loginModel.toJson());
    await prefs.setString(_loginDataKey, loginDataJson);
  }

  // Retrieve login model data
  static Future<LoginModel?> getLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    final loginDataJson = prefs.getString(_loginDataKey);
    if (loginDataJson != null) {
      final Map<String, dynamic> loginDataMap = jsonDecode(loginDataJson);
      return LoginModel.fromJson(loginDataMap);
    }
    return null;
  }

}
