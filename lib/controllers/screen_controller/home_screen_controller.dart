import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/screens/screen.dart';
import '/controllers/controller.dart';

class HomeScreenController extends GetxController {
  final pageView = Get.find<PageViewController>();
  final buttonController = Get.find<ButtonAnimationController>();
  final buttonScaleController = Get.find<ScaleButtonAnimationController>();
  int currentPage = 0;

  final screens = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  final headers = ['Learning', 'Working', 'More and More'];

  void nextPage() async {
    if (!buttonController.buttonContorller.isAnimating) {
      if (currentPage < screens.length - 1) {
        if (currentPage == 0)
          buttonController.nextPage();
        else
          buttonController.nextSecondPage();
        pageView.pageController.animateToPage(
          currentPage + 1,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );
      } else {
        buttonScaleController.loginScreen();
        Get.toNamed('/LoginScreen');
      }
    }
  }

  void onChangePage(int page) {
    if (page > currentPage)
      buttonController.nextPage();
    else
      buttonController.backPage();
    currentPage = page;
    update();
  }

  double get page => pageView.page;
}
