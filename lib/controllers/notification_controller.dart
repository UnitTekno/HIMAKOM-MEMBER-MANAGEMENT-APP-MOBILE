import 'package:HIMAKOM/constants/app_colors.dart';
import 'package:HIMAKOM/models/push_notification_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/services/notification_services.dart';
import '../routes/app_routes.dart';

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class NotificationController extends GetxController {
  late final FirebaseMessaging _messaging;
  RxInt totalNotifications = 0.obs;
  Rx<PushNotification> notificationsInfo = PushNotification(
    status: '',
    data: [],
  ).obs;

  void getNotifications() async {
    notificationsInfo.value = await NotificationService().getNotifications();
    totalNotifications.value = notificationsInfo.value.data.length;
  }

  void setFCMToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;
    final fcmToken = await _messaging.getToken();
    prefs.setString('fcmToken', fcmToken!);
  }

  @override
  void onInit() async {
    getNotifications();
    registerNotification();
    checkForInitialMessage();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      getNotifications();
      Get.toNamed(RouteName.notificationRoute);
    });
    super.onInit();
  }

  void onMessage(RemoteMessage message) async {
    getNotifications();

    showSimpleNotification(
      Text(
        message.notification!.title!,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.BLACK,
        ),
      ),
      subtitle: Text(
        message.notification!.body!,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.BLACK,
        ),
      ),
      background: AppColors.WHITE,
      foreground: AppColors.BLACK,
      leading: const Icon(
        Icons.notifications,
        color: AppColors.PRIMARY,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.close,
          color: AppColors.PRIMARY,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      elevation: 0,
      duration: const Duration(seconds: 3),
    );
  }

  void registerNotification() async {
    await Firebase.initializeApp();

    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen(onMessage);
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      getNotifications();
    }
  }

  void notificationRead(int idNotification) async {
    notificationsInfo.value.data
        .removeWhere((element) => element.id == idNotification);
    await NotificationService().notificationRead(idNotification);
    notificationsInfo.value = await NotificationService().getNotifications();
    totalNotifications.value = notificationsInfo.value.data.length;
  }
}
