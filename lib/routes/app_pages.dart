import 'package:get/get.dart';

import '../views/pages/auth_page/auth_page.dart';
import '../views/pages/base_page.dart';
import '../views/pages/home_page/home_page.dart';

import '../bindings/auth_binding.dart';
import '../bindings/base_binding.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: RouteName.baseRoute,
      page: () => const BasePage(),
      binding: BasePageBinding(),
    ),
    GetPage(
      name: RouteName.loginRoute,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RouteName.kepengurusanRoute,
      page: () => const HomePage(),
      binding: AuthBinding(),
    ),
  ];
}
