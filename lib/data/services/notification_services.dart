import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/base_url.dart';

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
}
