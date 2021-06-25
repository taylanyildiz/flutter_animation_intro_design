import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ui_login_animation/colors/colors.dart';
import 'package:ui_login_animation/route_management.dart';
import 'package:ui_login_animation/widgets/widget.dart';
import 'controllers/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: CustomColor.scaffoldBackgroundColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: RouteManagement.initialRoute,
      getPages: RouteManagement.pageList,
    );
  }
}

class HomeScreen extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeScreenController _) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              _buildPageView(),
              _buildNextButton(),
              _buildAppBar(),
              _buildInfoText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return GetBuilder(
      builder: (ButtonAnimationController buttonAnimation) {
        return GetBuilder(
          builder: (ScaleButtonAnimationController scaleController) =>
              CircleButton(
            scale: scaleController.buttonScaleAnimation.value,
            lineColor: Colors.white,
            backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
            page: controller.page,
            animation: buttonAnimation.buttonAnimation,
            onPressed: () => controller.nextPage(),
          ),
        );
      },
    );
  }

  Widget _buildAppBar() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            FontAwesomeIcons.wpbeginner,
            color: Colors.white,
            size: 30,
          ),
          Text(
            'Skip',
            style: Theme.of(Get.context!).textTheme.headline1,
          ),
        ],
      ),
    );
  }

  _buildInfoText() {
    return Positioned(
      bottom: 180.0,
      left: 50,
      right: 50,
      child: Column(
        children: [
          Text(
            controller.headers[controller.currentPage],
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7.0),
          Text(
            'Visit my GitHub Profile and Learn more about Flutter Dart',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return GetBuilder(
      builder: (PageViewController pageView) => PageView.builder(
        controller: pageView.pageController,
        onPageChanged: controller.onChangePage,
        itemCount: controller.screens.length,
        itemBuilder: (context, index) => controller.screens[index],
      ),
    );
  }
}
