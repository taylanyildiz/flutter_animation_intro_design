import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ui_design_login/route_management.dart';
import 'package:ui_design_login/screens/first_screen.dart';
import 'package:ui_design_login/screens/screens.dart';
import 'package:ui_design_login/widgets/circular_indicator.dart';
import 'package:ui_design_login/widgets/login_painter.dart';
import '../controllers/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteManagement.initialRoute,
      getPages: RouteManagement.pageList,
    );
  }
}

class HomeScreen extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff2651FA),
        body: Stack(
          children: [
            _buildChangableScreens(),
            Positioned(
              top: 20.0,
              left: 10.0,
              right: 10.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.headphones,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
            GetBuilder(
              builder: (PageViewController page) {
                return Positioned(
                  bottom: 150.0,
                  left: 60,
                  right: 60,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Column(
                      children: [
                        Text(
                          controller.text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Learn ipsum dolor sit consetetur sadipscing elitr sed diam',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            _buildButton(),
            _loginScreen(),
          ],
        ),
      ),
    );
  }

  Widget _loginScreen() {
    return GetBuilder(
      builder: (HomeScreenController _) => IgnorePointer(
        ignoring: !controller.lineController.isCompleted,
        child: Opacity(
          opacity: controller.animationLogin.value,
          child: Stack(
            children: [
              Container(
                child: Stack(
                  children: [
                    Positioned(
                      top: 30,
                      left: 20 * controller.animationLogin.value,
                      child: Icon(
                        Icons.headphones,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                    ),
                    Positioned(
                      top: 120.0 - 20 * controller.animationLogin.value,
                      left: 20.0,
                      right: 80.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to Cutfinger',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Learn ipsum dolor sit consetetur sadipscing elitr sed diam',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 200.0 + 100 * (1 - controller.lineController.value),
                child: Opacity(
                  opacity: max(0, (2 * controller.lineController.value - 1)),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..scale(
                        2 * (1 - controller.lineController.value) + 1,
                      ),
                    child: Container(
                      height: 100.0,
                      width: Get.width,
                      child: CustomPaint(
                        painter: LoginPainter(),
                      ),
                    ),
                  ),
                ),
              ),
              _buildLoginInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginInput() {
    return Positioned(
      bottom: 50.0 * controller.inputAnimation.value,
      left: 40.0,
      right: 40.0,
      child: Opacity(
        opacity: controller.inputAnimation.value,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Username or Email',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  )),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  )),
            ),
            SizedBox(height: 40.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Color(0xff2651FA),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Center(
                child: Text(
                  'Login to contiune',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Contiune with Google',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Center(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton() => GetBuilder(
        builder: (PageViewController pageController) {
          return Positioned(
            left: 0,
            right: 0,
            bottom: 20.0,
            child: GestureDetector(
              onTap: () => controller.changePage(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: controller.animation.value,
                    child: Container(
                      child: Stack(
                        children: [
                          CustomPaint(
                            painter: CircularIndicator(
                                angle: 1.0,
                                start: 2.8,
                                color: controller.listColor[0]),
                          ),
                          CustomPaint(
                            painter: CircularIndicator(
                                angle: 1.2,
                                start: 4.0,
                                color: controller.listColor[1]),
                          ),
                          CustomPaint(
                            painter: CircularIndicator(
                                angle: 1.0,
                                start: 5.4,
                                color: controller.listColor[2]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Transform.rotate(
                      angle: pi,
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff2651FA),
                      ),
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: GetBuilder(
                      builder: (HomeScreenController _) => Transform.scale(
                        scale: controller.animationScale.value,
                        child: Container(
                          width: 5.0,
                          height: 5.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  Widget _buildChangableScreens() {
    return GetBuilder(
      builder: (PageViewController pageController) => PageView(
        controller: pageController.pageController,
        onPageChanged: controller.onChanged,
        physics: ClampingScrollPhysics(),
        pageSnapping: true,
        children: [
          FirstScreen(),
          SecondScreen(),
          ThirdScreen(),
        ],
      ),
    );
  }
}
