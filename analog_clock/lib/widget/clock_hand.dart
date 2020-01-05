import 'dart:async';

import 'package:analog_clock/painter/clock_hour_hand_painter.dart';
import 'package:analog_clock/painter/clock_minute_hand_painter.dart';
import 'package:analog_clock/painter/clock_second_hand_painter.dart';
import 'package:flutter/material.dart';

class ClockHand extends StatefulWidget {
  @override
  State createState() => _ClockHandState();
}

class _ClockHandState extends State<ClockHand> {
  Timer _timer;
  DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), _timerCallback);
  }

  void _timerCallback(Timer timer) {
    setState(() {
      dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: CustomPaint(
                painter: ClockHourHandPainter(dateTime: dateTime),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: CustomPaint(
                painter: ClockMinuteHandPainter(dateTime: dateTime),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: CustomPaint(
                painter: ClockSecondHandPainter(dateTime: dateTime),
              ),
            )
          ],
        ),
      ),
    );
  }
}
