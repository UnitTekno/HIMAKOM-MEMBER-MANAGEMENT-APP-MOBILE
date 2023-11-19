// ignore_for_file: avoid_print

import 'package:HIMAKOM/constants/app_colors.dart';
import 'package:HIMAKOM/models/push_notification_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

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

  @override
  void onInit() async {
    notificationsInfo.value = await NotificationService().getNotifications();
    totalNotifications.value = notificationsInfo.value.data.length;
    registerNotification();
    checkForInitialMessage();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      notificationsInfo.value = await NotificationService().getNotifications();
      totalNotifications++;
      Get.toNamed(RouteName.notificationRoute);
    });
    super.onInit();
  }

  void onMessage(RemoteMessage message) async {
    notificationsInfo.value = await NotificationService().getNotifications();
    totalNotifications++;

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
      _messaging.getToken().then((token) {
        NotificationService().putDeviceToken(token!);
      });
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
      notificationsInfo.value = await NotificationService().getNotifications();
      totalNotifications++;
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
