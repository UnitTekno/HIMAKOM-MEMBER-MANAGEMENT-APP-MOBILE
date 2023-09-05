import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/pages/auth_page/profile_page.dart';
import '../views/pages/departments_page/departments_page.dart';
import '../views/pages/events_page/events_page.dart';
import '../views/pages/home_page/home_page.dart';

class BasePageController extends GetxController {
  final _selectedIndex = 0.obs;
  final List<Widget> _pages = [
    const HomePage(),
    const DepartmentsPage(),
    const EventsPage(),
    const ProfilePage(),
  ];

  int get selectedIndex => _selectedIndex.value;
  void changeIndex(int index) => _selectedIndex.value = index;
  Widget getWidgetSelected(int index) => _pages[index];
}
