import 'package:analog_clock/clock_dial_painter.dart';
import 'package:analog_clock/clock_hand.dart';
import 'package:flutter/material.dart';

class ClockFace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: EdgeInsets.all(10.0),
        child: new AspectRatio(
          aspectRatio: 1.0,
          child: new Container(
            width: double.infinity,
            decoration: new BoxDecoration(
                shape: BoxShape.circle, color: Colors.lightBlueAccent),
            child: new Stack(
              children: <Widget>[
                new Center(
                  child: new Container(
                    width: 88.0,
                    height: 88.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
                new Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.all(28.0),
                  child: new CustomPaint(
                    painter: ClockDialPainter(),
                  ),
                ),
                ClockHand(),
                new Center(
                  child: new Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
