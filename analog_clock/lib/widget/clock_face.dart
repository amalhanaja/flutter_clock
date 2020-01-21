import 'package:analog_clock/painter/clock_dial_painter.dart';
import 'package:analog_clock/painter/half_circle_painter.dart';
import 'package:analog_clock/widget/clock_hand.dart';
import 'package:flutter/material.dart';

class ClockFace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFF3BB0BA)),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: CustomPaint(
                    painter: HalfCirclePainter(color: Colors.white),
                  ),
                ),
                Center(
                  child: Container(
                    width: 88.0,
                    height: 88.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFE8824F)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.all(28.0),
                  child: CustomPaint(
                    painter: ClockDialPainter(color: Colors.black87, roundRadius: 8.0),
                  ),
                ),
                ClockHand(),
                Center(
                  child: Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
