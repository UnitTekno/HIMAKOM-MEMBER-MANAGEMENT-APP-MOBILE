import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../constants/app_colors.dart';
import '../../controllers/base_controller.dart';

class BasePage extends GetView<BasePageController> {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: controller.selectedIndex,
          onTap: (index) {
            controller.changeIndex(index);
          },
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Beranda"),
              selectedColor: AppColors.PRIMARY,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.group),
              title: const Text("Departemen"),
              selectedColor: AppColors.PRIMARY,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.calendar_today),
              title: const Text("Kegiatan"),
              selectedColor: AppColors.PRIMARY,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profil"),
              selectedColor: AppColors.PRIMARY,
            ),
          ],
        ),
        body: controller.getWidgetSelected(controller.selectedIndex),
      );
    });
  }
}
