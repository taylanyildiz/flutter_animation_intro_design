import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  late PageController pageController;
  double page = 0.0;
  double offset = 0.0;

  @override
  void onInit() {
    pageController = PageController();
    pageController.addListener(_pageListener);
    super.onInit();
  }

  void _pageListener() {
    page = pageController.page ?? 0.0;
    offset = pageController.offset;
    update();
  }
}
