import 'dart:math';

import 'package:flutter/material.dart';

class ClockHourHandPainter extends CustomPainter {

  final DateTime dateTime;

  ClockHourHandPainter({
    @required this.dateTime
  });

  @override
  void paint(Canvas canvas, Size size) {

    final radius = size.width / 2;
    final Paint paint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8.0;
    final Path path = Path();

    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(dateTime.hour >= 12 ? 2 * pi * ((dateTime.hour - 12) / 12) +
        (dateTime.minute / 720) : 2 * pi *
        ((dateTime.hour / 12) + (dateTime.minute / 720)));
    
    path.moveTo(0.0, -radius * 0.5);
    path.lineTo(0.0, 0);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(ClockHourHandPainter oldDelegate) {
    return oldDelegate.dateTime.isBefore(dateTime);
  }
}