import 'package:get/get.dart';

import '../../constants/base_url.dart';

class NotificationService extends GetConnect {
  Future putDeviceToken(String deviceToken) async {
    final response = await put(
      '$BASE_URL/user/device_token',
      {
        'device_token': deviceToken,
      },
    );
    return response.body;
  }
}
