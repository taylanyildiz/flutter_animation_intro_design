import 'package:get/get.dart';
import 'package:ui_design_login/main.dart';

import 'binding/home_binding.dart';

class RouteManagement {
  static const String initialRoute = '/HomeScreen';
  static final List<GetPage> pageList = [
    GetPage(
      name: '/HomeScreen',
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
