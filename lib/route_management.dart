import 'package:get/get.dart';
import 'package:ui_design_login/controllers/binding/home_binding.dart';
import 'package:ui_design_login/main.dart';

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
