import 'package:sensors_plus/sensors_plus.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class motionsensor extends StatefulWidget {
  const motionsensor({Key? key}) : super(key: key);

  @override
  State<motionsensor> createState() => _motionsensorState();
}

class _motionsensorState extends State<motionsensor> {
  double x = 0, y = 0, z = 0;
  String speed = "none";
  String speedy = "none";

  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      print(event);
    });
// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
