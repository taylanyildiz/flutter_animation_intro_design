import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ui_login_animation/controllers/controller.dart';
import 'package:ui_login_animation/widgets/widget.dart';

class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder(
        builder: (LoginScreenController _) => SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                _buildLine(),
                _buildAppBar(),
                _buildWelcomeText(),
                _buildInput(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildLine() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: Transform(
        transform: Matrix4.identity()
          ..scale(1.0, controller.lineAnimation.value),
        child: Container(
          height: 300,
          child: CustomPaint(
            painter: LinePainter(),
          ),
        ),
      ),
    );
  }

  _buildWelcomeText() {
    return Positioned(
      left: 20.0,
      right: 50.0,
      top: 110.0 - 10 * controller.topTextAnimation.value,
      child: Opacity(
        opacity: controller.topTextAnimation.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to CutFinger',
              style: Theme.of(Get.context!).textTheme.headline2,
            ),
            SizedBox(height: 10.0),
            Text(
              'Learn more about Flutter and Dart with my Github profile',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                wordSpacing: 3.0,
                letterSpacing: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return Positioned(
      top: 40.0 - 10 * controller.topTextAnimation.value,
      left: 10.0,
      right: 20.0,
      child: Opacity(
        opacity: controller.topTextAnimation.value,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(.3),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).scaffoldBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () => controller.back(),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
            ),
            Text(
              'Cf',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildInput() {
    return Positioned(
      bottom: 50.0 - 250 * (1 - controller.inputAnimation.value),
      left: 20,
      right: 20,
      child: Opacity(
        opacity: controller.inputAnimation.value,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Username or Email',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            SizedBox(height: 7.0),
            _buildFillButton(
              Theme.of(Get.context!).scaffoldBackgroundColor,
              'Login to contiune',
              Colors.white,
            ),
            SizedBox(height: 60.0),
            _buildLoginGoogleButton(),
            SizedBox(height: 7.0),
            _buildFillButton(
              Colors.black,
              'Create a Cutfinger Account',
              Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  _buildLoginGoogleButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.0),
          Icon(
            FontAwesomeIcons.google,
            color: Colors.red,
          ),
          Spacer(),
          Text(
            'Contiune in with Google',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  _buildFillButton(Color color, String text, Color textColor) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(vertical: 14.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
