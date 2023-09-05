// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'views/pages/splash_page.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    runApp(MyApp(prefs: prefs));
  } catch (error) {
    print(error);
  }
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            } else {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "APP HIMAKOM",
                initialRoute: prefs.containsKey('accessToken')
                    ? RouteName.baseRoute
                    : RouteName.loginRoute,
                getPages: AppPages.pages,
              );
            }
          } catch (error) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
