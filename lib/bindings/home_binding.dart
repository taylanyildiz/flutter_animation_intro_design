import 'package:get/get.dart';
import '../controllers/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PageViewController());
    Get.put(ButtonAnimationController());
    Get.put(ScaleButtonAnimationController());
    Get.put(HomeScreenController());
  }
}
