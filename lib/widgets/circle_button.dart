import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cricle_button_frame.dart';

class CircleButton extends StatelessWidget {
  CircleButton(
      {Key? key,
      required this.onPressed,
      required this.animation,
      required this.page,
      required this.backgroundColor,
      required this.lineColor,
      required this.scale})
      : super(key: key);

  final Color backgroundColor;
  final Color lineColor;
  final Function() onPressed;
  final Animation animation;
  final double page;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: Get.height * .04,
      left: 0,
      right: 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: animation.value,
            child: CustomPaint(
              painter: CircleButtonFrame(
                backgroundColor: backgroundColor,
                lineColor: lineColor,
                page: page,
                start: 2.6,
                radius: 30.0,
                stop: 1.2,
              ),
            ),
          ),
          Transform.scale(
            scale: scale,
            child: Container(
              padding: EdgeInsets.all(Get.width * .03),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.all(Get.width * .03),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: pi,
                child: Icon(
                  Icons.arrow_back,
                  color: scale == 0
                      ? Theme.of(Get.context!).scaffoldBackgroundColor
                      : Colors.white,
                  size: Get.width * .08,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
