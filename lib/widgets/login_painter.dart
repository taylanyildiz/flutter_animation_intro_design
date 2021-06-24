import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPainter extends CustomPainter {
  LoginPainter()
      : loginPaint = Paint()
          ..style = PaintingStyle.fill
          ..strokeWidth = 3.0
          ..color = Color(0xff2651FA);
  final Paint loginPaint;
  @override
  void paint(Canvas canvas, Size size) {
    _drawLine(canvas, size);
  }

  _drawLine(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height / 2 + 20);
    path.cubicTo(
      size.width / 2 + 20,
      size.height / 2 + 40,
      size.width,
      size.height / 2 - 30,
      size.width,
      10,
    );
    path.lineTo(size.width, 0);
    path.cubicTo(
      size.width + 10,
      size.height / 2 - 70,
      size.width,
      size.height / 2 + 20,
      0,
      size.height / 2 - 20,
    );
    path.close();
    canvas.drawShadow(path, Colors.grey.shade200, 7.0, true);
    canvas.drawPath(path, loginPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
