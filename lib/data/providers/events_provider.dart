import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/base_url.dart';
import '../../models/events_model.dart';

class EventsProvider extends GetConnect {
  Future<dynamic> getEvents() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final response = await get('$BASE_URL/events',
        headers: {'Authorization': 'Bearer $accessToken'});
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final eventsModel = eventsModelFromJson(responseString);
      return eventsModel;
    } else {
      throw Exception('Gagal mendapatkan data events');
    }
  }
}
