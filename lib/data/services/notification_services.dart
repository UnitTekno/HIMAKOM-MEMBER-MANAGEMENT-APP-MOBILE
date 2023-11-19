import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/base_url.dart';
import '../../models/push_notification_model.dart';

class NotificationService extends GetConnect {
  Future putDeviceToken(String deviceToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final response = await put(
      '$BASE_URL/user/device-token',
      headers: {'Authorization': 'Bearer $accessToken'},
      {
        'device_token': deviceToken,
      },
    );
    return response.body;
  }

  Future getNotifications() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final response = await get(
      '$BASE_URL/notifications',
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    if (response.statusCode == 200) {
      final responseString = json.encode(response.body);
      final pushNotifications = pushNotificationFromJson(responseString);
      return pushNotifications;
    } else {
      throw Exception('Gagal mendapatkan data notifikasi');
    }
  }

  Future notificationRead(int idNotification) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? '';
    final response = await get(
      '$BASE_URL/notifications/$idNotification/read',
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    return response.body;
  }
}
