import 'package:get/get.dart';

import '../controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
    Get.put(PageViewController());
  }
}
