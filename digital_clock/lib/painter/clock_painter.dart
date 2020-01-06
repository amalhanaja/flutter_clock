import 'package:digital_clock/formatter/time_formatter.dart';
import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final DateTime dateTime;
  final TextStyle textStyle;

  ClockPainter({
    @required this.dateTime,
    this.textStyle = const TextStyle(
        color: Colors.redAccent,
        fontSize: 60,
        fontFamily: "DS-Digital",
        fontWeight: FontWeight.bold),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final colonTextPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textStyle,
        text: ":",
      ),
    );

    final colonTextPainter2 = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textStyle,
        text: ":",
      ),
    );

    final hourTextPainter = TextPainter(
      text: TextSpan(
        text: TimeFormatter.formatHour24(dateTime),
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    final minuteTextPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        style: textStyle,
        text: TimeFormatter.formatMinute(dateTime),
      ),
    );

    final secondTextPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        text: TextSpan(
          style: textStyle,
          text: TimeFormatter.formatSecond(dateTime),
        ));

    minuteTextPainter
      ..layout(minWidth: 60.0)
      ..paint(
        canvas,
        Offset(-minuteTextPainter.width / 2, -minuteTextPainter.height / 2),
      );
    colonTextPainter
      ..layout(minWidth: 12.0)
      ..paint(
        canvas,
        Offset((colonTextPainter.width) - (minuteTextPainter.width),
            -colonTextPainter.height / 1.8),
      );
    colonTextPainter2
      ..layout(minWidth: 12.0)
      ..paint(
        canvas,
        Offset(minuteTextPainter.width - (colonTextPainter2.width * 2),
            -colonTextPainter2.height / 1.8),
      );
    secondTextPainter
      ..layout(minWidth: 60.0)
      ..paint(
        canvas,
        Offset(minuteTextPainter.width + (-secondTextPainter.width / 2) + (colonTextPainter2.width),
            -secondTextPainter.height / 2),
      );
    hourTextPainter
      ..layout(minWidth: 60.0)
      ..paint(
        canvas,
        Offset((-hourTextPainter.width / 2) - (minuteTextPainter.width) - (colonTextPainter.width),
            -hourTextPainter.height / 2),
      );
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) {
    return oldDelegate.dateTime.isBefore(dateTime);
  }
}