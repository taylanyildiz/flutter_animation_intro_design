import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinePainter extends CustomPainter {
  LinePainter()
      : initPaint = Paint()
          ..color = Colors.grey.shade200
          ..style = PaintingStyle.fill
          ..strokeWidth = 3.0,
        secondInitPaint = Paint()
          ..color = Theme.of(Get.context!).scaffoldBackgroundColor
          ..style = PaintingStyle.fill
          ..strokeWidth = 3.0,
        thirdInitPaint = Paint()
          ..color = Colors.grey.shade200
          ..style = PaintingStyle.fill
          ..strokeWidth = 3.0;
  final Paint initPaint;
  final Paint secondInitPaint;
  final Paint thirdInitPaint;
  @override
  void paint(Canvas canvas, Size size) {
    _drawLineInit(canvas, size);
    _drawLineSecondInit(canvas, size);
    _drawLineThirdInit(canvas, size);
  }

  _drawLineInit(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height);
    path.quadraticBezierTo(
      size.width / 1.4,
      size.height + 5,
      size.width,
      size.height - 95,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0.0, 0.0);
    path.close();
    canvas.drawPath(path, initPaint);
  }

  _drawLineSecondInit(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height - 20);
    path.quadraticBezierTo(
      size.width / 1.2 - 50,
      size.height - 10,
      size.width,
      size.height - 110,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0.0, 0.0);
    path.close();
    canvas.drawPath(path, secondInitPaint);
  }

  _drawLineThirdInit(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 1.2 - 20,
      size.height - 20,
      size.width,
      size.height - 120,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0.0, 0.0);
    path.close();
    canvas.drawPath(path, thirdInitPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
