import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

class NotificationController extends GetxController {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final RxList notif = [].obs;

  void handleMessage(RemoteMessage? message) {
    if (message != null) {
      final notification = message.notification;
      if (notification != null) {
        addNotif(notification.title ?? '', notification.body ?? '');
      }
    }
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }

  Future<void> initNotifications() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    prefs.setString('fcmToken', fCMToken ?? '');
    initPushNotification();
  }

  void addNotif(String title, String body) {
    notif.add({
      'title': title,
      'body': body,
    });
  }

  void removeNotif(int index) {
    notif.removeAt(index);
  }
}
