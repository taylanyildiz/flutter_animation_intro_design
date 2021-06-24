import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_design_login/controllers/controller.dart';
import '/screens/screens.dart';

class HomeScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late AnimationController scaleController;
  late Animation<double> animation;
  late Animation<double> animationScale;
  late AnimationController loginAnimationController;
  late Animation<double> animationLogin;
  late AnimationController lineController;
  late AnimationController inputAnimation;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    scaleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    loginAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    lineController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    inputAnimation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    animationLogin =
        Tween<double>(begin: 0.0, end: 1).animate(loginAnimationController);
    animation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(animationController);
    animationScale = Tween<double>(begin: 0.0, end: Get.height).animate(
        CurvedAnimation(parent: scaleController, curve: Curves.bounceOut));
    lineController.addListener(_addListener);
    inputAnimation.addListener(_addListener);
    animation.addListener(_addListener);
    animationScale.addListener(_addListener);
    animationLogin.addListener(_addListener);
    super.onInit();
  }

  void _addListener() {
    update();
    if (animationScale.value > 0.5) {
      loginAnimationController.forward();
    }
    if (loginAnimationController.value > 0.8) {
      lineController.forward();
    }
    if (lineController.value > 0.8) {
      inputAnimation.forward();
    }
  }

  final pages = [
    FirstScreen(),
    SecondScreen(),
    LoginScreen(),
    ThirdScreen(),
  ];
  late int currentPage = 0;

  late var listColor = [Colors.white, Colors.blue, Colors.blue];

  late String text = 'Community';

  void onChanged(page) async {
    currentPage = page;
    switch (page) {
      case 0:
        text = 'Community';
        listColor = [Colors.white, Colors.blue, Colors.blue];
        break;
      case 1:
        text = 'Keep Learning';
        listColor = [Colors.white, Colors.white, Colors.blue];
        break;
      case 2:
        text = 'Work together';
        listColor = [Colors.white, Colors.white, Colors.white];
        break;
      case 3:
        break;
    }

    await animationController.forward();
    animationController.reset();

    update();
  }

  void changePage() async {
    if (currentPage == 2) {
      scaleController.forward();
    } else if (currentPage == 0) {
      Get.find<PageViewController>().pageController.nextPage(
            duration: Duration(milliseconds: 700),
            curve: Curves.ease,
          );
      await animationController.forward();
      animationController.reset();
    } else if (currentPage == 1) {
      Get.find<PageViewController>().pageController.nextPage(
            duration: Duration(seconds: 1),
            curve: Curves.ease,
          );
      animation =
          Tween<double>(begin: 2 * pi, end: 0).animate(animationController);
      await animationController.forward();
      animationController.reset();
    }
  }
}
