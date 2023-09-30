import 'package:HIMAKOM/controllers/notification_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/base_controller.dart';
import '../controllers/kepengurusan_controller.dart';

class BasePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasePageController>(() => BasePageController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<KepengurusanController>(() => KepengurusanController());
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
