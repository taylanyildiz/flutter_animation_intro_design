import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '/controllers/controller.dart';

class LoginScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  final scalebutton = Get.find<ScaleButtonAnimationController>();
  late AnimationController loginAnimationController;
  late Animation<double> topTextAnimation;
  late Animation<double> lineAnimation;
  late Animation<double> inputAnimation;

  @override
  void onInit() {
    loginAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(milliseconds: 1),
    );
    topTextAnimation = CurvedAnimation(
      parent: loginAnimationController,
      curve: Interval(0.2, 0.4, curve: Curves.linear),
    );
    lineAnimation = Tween<double>(begin: 5.0, end: 1.0).animate(
      CurvedAnimation(
        parent: loginAnimationController,
        curve: Interval(.4, .8, curve: Curves.linear),
      ),
    );
    inputAnimation = CurvedAnimation(
      parent: loginAnimationController,
      curve: Interval(.7, 1.0, curve: Curves.linear),
    );
    inputAnimation.addListener(() => update());
    lineAnimation.addListener(() => update());
    topTextAnimation.addListener(() => update());
    runAnimation();
    super.onInit();
  }

  void runAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    loginAnimationController.forward();
  }

  void back() async {
    Get.back();
    scalebutton.buttonScaleController.reverse();
  }
}
