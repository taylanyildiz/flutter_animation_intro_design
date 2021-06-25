import 'package:get/get.dart';
import '../controllers/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginScreenController());
  }
}
