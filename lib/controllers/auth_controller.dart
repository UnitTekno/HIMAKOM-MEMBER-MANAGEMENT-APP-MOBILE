// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_images.dart';
import '../data/providers/auth_provider.dart';
import '../data/services/notification_services.dart';
import '../models/auth_model.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  List<dynamic> menuProfile = [
    {
      'title': 'Kritik & Saran',
      'icon': AppImages.ICON_KRITK,
    },
    {
      'title': 'Logout',
      'icon': AppImages.ICON_LOGOUT,
    },
  ];
  Rx<AuthModel> auth = AuthModel(
    user: User(
      name: '',
      nim: '',
      email: '',
      na: '',
      namaBagus: '',
      avatar: '',
      year: '',
      role: '',
    ),
    accessToken: '',
  ).obs;
  RxBool isLoading = false.obs;
  RxBool isLoginSuccess = false.obs;
  RxBool isLoginFail = false.obs;
  RxBool isPasswordVisible = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void showHidePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  void checkLogin() async {
    try {
      isLoading.value = true;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? accessToken = prefs.getString('accessToken');
      if (accessToken != null) {
        auth.value.user = await AuthProvider().checkLogin();
        auth.value.accessToken = accessToken;
      }
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }

  void login(String email, String password) async {
    try {
      isLoading.value = true;
      isLoginFail.value = false;
      auth.value = await AuthProvider().login(email, password);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final deviceToken = prefs.getString('fcmToken') ?? '';
      
      prefs.setString('accessToken', auth.value.accessToken);
      NotificationService().putDeviceToken(deviceToken);

      isLoginSuccess.value = true;
      await Future.delayed(const Duration(seconds: 1));

      Get.toNamed(RouteName.baseRoute);
    } catch (error) {
      isLoginFail.value = true;
      Get.snackbar(
        'Gagal Login',
        'Email atau password salah',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      await Future.delayed(const Duration(seconds: 4));
      isLoading.value = false;
    } finally {
      isLoginSuccess.value = false;
      isLoading.value = false;
    }
  }

  void logout() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await AuthProvider().logout();
      prefs.remove('accessToken');
      Get.offAllNamed(RouteName.loginRoute);
    } catch (error) {
      print(error);
    }
  }
}
