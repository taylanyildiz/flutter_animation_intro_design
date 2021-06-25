import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ScaleButtonAnimationController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController buttonScaleController;
  late Animation<double> buttonScaleAnimation;
  @override
  void onInit() {
    buttonScaleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      reverseDuration: Duration(milliseconds: 1200),
    );
    buttonScaleAnimation = Tween<double>(begin: 0.0, end: Get.width).animate(
      CurvedAnimation(
        parent: buttonScaleController,
        curve: Curves.ease,
      ),
    );
    buttonScaleAnimation.addListener(_addListener);
    super.onInit();
  }

  void _addListener() => update();

  loginScreen() => buttonScaleController.forward();
}
