import 'dart:math';

import 'package:flutter/material.dart';

class HalfCirclePainter extends CustomPainter {
  final Color color;

  HalfCirclePainter({@required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    canvas.save();
    canvas.drawArc(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: size.width,
            height: size.height),
        pi,
        pi,
        false,
        paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
