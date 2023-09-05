import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/base_url.dart';
import '../../models/departments_model.dart';
import '../../models/kabinet_model.dart';
import '../../models/kepengurusan_model.dart';

class KepengurusanProvider extends GetConnect {
  Future<dynamic> getKepengurusan() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final response = await get('$BASE_URL/users',
        headers: {'Authorization': 'Bearer $accessToken'});
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final kepengurusanModel = kepengurusanModelFromJson(responseString);
      return kepengurusanModel;
    } else {
      throw Exception('Gagal mendapatkan data kepengurusan');
    }
  }

  Future<dynamic> getKabinet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final response = await get('$BASE_URL/cabinets', headers: {
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final kabinetModel = kabinetModelFromJson(responseString);
      return kabinetModel;
    } else {
      throw Exception('Gagal mendapatkan data kabinet');
    }
  }

  Future<dynamic> getDepartments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final response = await get('$BASE_URL/departments', headers: {
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final departmentsModel = departmentsModelFromJson(responseString);
      return departmentsModel;
    } else {
      throw Exception('Gagal mendapatkan data departments');
    }
  }
}
