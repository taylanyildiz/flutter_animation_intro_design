import 'package:get/get.dart';
import 'bindings/binding.dart';
import 'main.dart';
import 'screens/login_screen.dart';

class RouteManagement {
  RouteManagement._();

  static const String initialRoute = '/HomeScreen';
  static final List<GetPage> pageList = [
    GetPage(
      name: '/HomeScreen',
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/LoginScreen',
      page: () => LoginScreen(),
      binding: LoginBinding(),
      transitionDuration: Duration(seconds: 1),
      transition: Transition.native,
    ),
  ];
}
