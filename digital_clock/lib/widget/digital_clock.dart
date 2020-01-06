import 'dart:async';

import 'package:digital_clock/painter/clock_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class DigitalClock extends StatefulWidget {
  @override
  State createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  Timer _timer;
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), _timerCallback);
  }

  void _timerCallback(Timer timer) {
    setState(() {
      _dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueAccent
        ),
        child: Center(
          child: CustomPaint(
            painter: ClockPainter(dateTime: _dateTime),
          ),
        ),
      ),
    );
//    return new Scaffold(
//      body: Center(
//          child: AnimatedDefaultTextStyle(
//        child: Text(DateFormat.Hms().format(_dateTime)),
//        style: TextStyle(
//          fontSize: 60.0,
//          fontWeight: FontWeight.bold,
//          color: _dateTime.second % 2 == 0 ? Colors.black87 : Colors.redAccent,
//          letterSpacing: 6.0,
//        ),
//        duration: Duration(milliseconds: 800),
//      )),
//    );
  }
}
