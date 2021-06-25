import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ButtonAnimationController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController buttonContorller;
  late Animation<double> buttonAnimation;
  @override
  void onInit() {
    buttonContorller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    buttonAnimation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(buttonContorller);
    buttonAnimation.addListener(_addListener);
    super.onInit();
  }

  void _addListener() => update();

  void nextPage() async {
    await buttonContorller.forward();
    reset();
  }

  void nextSecondPage() async {
    buttonAnimation =
        Tween<double>(begin: 2 * pi, end: 0.0).animate(buttonContorller);
    await buttonContorller.forward();
    reset();
  }

  void backPage() async {
    buttonAnimation =
        Tween<double>(begin: 2 * pi, end: 0.0).animate(buttonContorller);
    await buttonContorller.forward();
    reset();
  }

  void reset() => buttonContorller.reset();
}
