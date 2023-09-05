import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.PRIMARY,
        body: Center(
            child: SizedBox(
          height: Get.width * 0.5,
          width: Get.width * 0.5,
          child: Image.asset(AppImages.ICON_SPLASH),
        )),
      ),
    );
  }
}
