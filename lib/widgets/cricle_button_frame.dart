import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButtonFrame extends CustomPainter {
  CircleButtonFrame({
    required this.lineColor,
    required this.backgroundColor,
    required this.start,
    required this.radius,
    required this.stop,
    required this.page,
  })  : firstFramePaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = lineColor
          ..strokeWidth = 2.0,
        secondFramePaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = page >= 0.5 ? lineColor : backgroundColor
          ..strokeWidth = 2.0,
        thirdFramePaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = page >= 1.7 ? lineColor : backgroundColor
          ..strokeWidth = 2.0;
  final Paint firstFramePaint;
  final Paint secondFramePaint;
  final Paint thirdFramePaint;

  final Color backgroundColor;
  final Color lineColor;
  final double start;
  final double stop;
  final double radius;
  final double page;
  @override
  void paint(Canvas canvas, Size size) {
    _drawFirstLine(canvas, size);
    _drawSecondLine(canvas, size);
    _drawThirdLine(canvas, size);
  }

  _drawThirdLine(Canvas canvas, Size size) {
    canvas.drawArc(
      Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: radius,
      ),
      start + 2.8,
      stop,
      false,
      thirdFramePaint,
    );
  }

  _drawSecondLine(Canvas canvas, Size size) {
    canvas.drawArc(
      Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: radius,
      ),
      start + 1.4,
      stop,
      false,
      secondFramePaint,
    );
  }

  _drawFirstLine(Canvas canvas, Size size) {
    canvas.drawArc(
      Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: radius,
      ),
      start,
      stop,
      false,
      firstFramePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
