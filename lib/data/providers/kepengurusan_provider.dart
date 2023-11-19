import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/base_url.dart';
import '../../models/kabinet_model.dart';

class KepengurusanProvider extends GetConnect {
  Future<dynamic> getKabinet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final response = await get('$BASE_URL/cabinet', headers: {
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body['data']);
      final kabinetModel = kabinetModelFromJson(responseString);
      return kabinetModel;
    } else {
      throw Exception('Gagal mendapatkan data kabinet');
    }
  }
}
