import 'dart:math';

import 'package:flutter/material.dart';

class ClockMinuteHandPainter extends CustomPainter {
  final DateTime dateTime;

  ClockMinuteHandPainter({
    @required this.dateTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Paint paint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0;
    final Path path = Path();

    canvas.save();


    canvas.translate(radius, radius);
    canvas.rotate(2 * pi * ((dateTime.minute + (dateTime.second / 60)) / 60));
    path.moveTo(0.0, -radius * 1);
    path.lineTo(0.0, 0);
    path.addRRect(RRect.fromLTRBR(0, 0, 0, 0, Radius.circular(10.0)));

    path.close();

    canvas.drawPath(path, paint);
    canvas.drawShadow(path, Colors.black, 4.0, false);
    canvas.restore();
  }

  @override
  bool shouldRepaint(ClockMinuteHandPainter oldDelegate) {
    return oldDelegate.dateTime.isBefore(dateTime);
  }
}
