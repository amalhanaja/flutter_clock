import 'dart:math';

import 'package:flutter/material.dart';

class ClockDialPainter extends CustomPainter {
  final Color color;
  final double roundRadius;

  ClockDialPainter({@required this.color, this.roundRadius = 8.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint tickPaint = new Paint()..color = color;

    final double angle = 2 * pi / 60;
    final double radius = size.width / 2.0;

    canvas.save();
    canvas.translate(radius, radius);

    for (int i = 0; i < 60; i++) {
      if (i % 5 == 0) {
        canvas.drawCircle(Offset(0.0, -radius), roundRadius, tickPaint);
      }
      canvas.rotate(angle);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
