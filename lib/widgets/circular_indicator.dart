import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularIndicator extends CustomPainter {
  CircularIndicator({
    required this.angle,
    required this.start,
    required this.color,
  }) : circlePaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = color
          ..strokeWidth = 2.0;
  final Paint circlePaint;
  final double angle;
  final double start;
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.width / 2);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 28),
      start,
      angle,
      false,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
