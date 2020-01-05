import 'package:analog_clock/widget/clock_face.dart';
import 'package:flutter/material.dart';

class AnalogClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: new AspectRatio(
            aspectRatio: 1.0,
            child: new Stack(
              children: <Widget>[
                new Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          offset: new Offset(4.0, 4.0),
                          blurRadius: 4.0,
                        )
                      ]),
                  child: new ClockFace(),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
