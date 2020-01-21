import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondHandPainter extends CustomPainter {
  final DateTime dateTime;

  ClockSecondHandPainter({
    @required this.dateTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Paint paint = Paint()
      ..color = Color(0xFFBD2B3C)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;
    final Path path = Path();

    canvas.save();

    canvas.translate(radius, radius);
    canvas.rotate(2 * pi * dateTime.second / 60);
    path.moveTo(0.0, -radius * 1);
    path.lineTo(0.0, 0);
    path.addRRect(RRect.fromLTRBR(0, 0, 0, 0, Radius.circular(10.0)));

    path.close();

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(ClockSecondHandPainter oldDelegate) {
    return oldDelegate.dateTime.isBefore(dateTime);
  }
}
