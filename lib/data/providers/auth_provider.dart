import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/base_url.dart';
import '../../models/auth_model.dart';

class AuthProvider extends GetConnect {
  Future<dynamic> login(String email, String password) async {
    final response = await post('$BASE_URL/loginApi', {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final authModel = authModelFromJson(responseString);
      return authModel;
    } else {
      throw Exception('Gagal login');
    }
  }

  Future<dynamic> checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final response = await get('$BASE_URL/user', headers: {
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final userModel = userFromJson(responseString);
      return userModel;
    } else {
      throw Exception('Gagal login');
    }
  }

  Future<dynamic> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final response = await post('$BASE_URL/logoutApi', null, headers: {
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Gagal logout');
    }
  }
}
