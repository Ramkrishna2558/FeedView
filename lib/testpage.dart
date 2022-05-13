import 'dart:developer';

import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'package:sensors_plus/sensors_plus.dart  ';
import 'package:csv/csv.dart';

class testpage extends StatefulWidget {
  const testpage({Key? key}) : super(key: key);
  @override
  _testpageState createState() => _testpageState();
}

class _testpageState extends State<testpage> {
  int _counter = 0;
  int _counter1 = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }

  double x = 0, y = 0, z = 0;
  double a = 0, b = 0, c = 0;
  String direction = "none";
  String speed = "none";

  @override
  void initState() {
    //Gyroscope Sensor data
    // {
    //   File myCsv = new File("myCsvfile.csv");
    //   createCSV(myCsv);
    // }
    // csvSheet(File myCsv) {
    //   return new csv_sheet.CsvSheet(myCsv.readAsStringSync(), headerrow: true);
    // }

    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);

      x = event.x;
      y = event.y;
      z = event.z;

      // if (x > 0) {
      //   direction = "device is back ";
      // } else if (x < 0) {
      //   direction = "device is forward ";
      // }
      // if (y > 0) {
      //   direction = "device is left";
      // } else if (y < 0) {
      //   direction = "device is right";
      // }

      setState(() {});
    });
    super.initState();

//Accelerometer sensor data

    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      print(event);
      a = event.x;
      b = event.y;
      c = event.z;
      // if (z > 5) {
      //   speed = "a pot hole";
      // } else if (z < 2) {
      //   speed = "Chalo";
      // }
      // ;y < -0.4 && b < -0.4y < -0.4 && b < -0.4
      //y < -0.4 && b < -0.4
      if (c < -2 && (z < -0.01 || z > 0.01)) {
        if (c < -3 && (z < -0.02 || z > 0.02)) {
          speed = "deephole";
          _incrementCounter();
        } else {
          speed = "pothole";
          direction = "depth";
        }

        // || y > 0.2 && b > 0.4
      } else if (c >= 2 && (z > 0.01 || z < -0.01)) {
        if (c >= 3 && (z > 0.02 || z < -0.02)) {
          speed = "highbump";
          _incrementCounter1();
        } else {
          speed = "Bump";
          direction = "upward";
        }
      } else {
        speed = "none";
        direction = "stable";
      }

      setState(() {});
    });
    super.initState();

// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          ),
          color: Colors.teal,
          boxShadow: [
            new BoxShadow(
                color: Color(0xFF363f93).withOpacity(0.6),
                offset: new Offset(-10.0, 0.0),
                blurRadius: 20.0,
                spreadRadius: 5.0),
          ],
        ),
        child: Stack(
          children: [
            //HEADER POSITION
            Positioned(
              top: 70,
              right: 0,
              //left: 210,
              child: Container(
                height: 50,
                width: 190,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        topLeft: Radius.circular(50))),
              ),
            ),
            //HEADER TEXT
            Positioned(
                top: 79,
                right: 100,
                child: Text(
                  "GO!",
                  style: TextStyle(fontSize: 25, color: Colors.teal),
                )),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 12, top: 30),
        height: 120,
        width: 380,
        //padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(8.0),
            /* borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(80.0),
                ),*/
            boxShadow: [
              new BoxShadow(
                  color: Colors.teal.withOpacity(0.2),
                  offset: new Offset(-10.0, 0.0),
                  blurRadius: 20.0,
                  spreadRadius: 5.0),
            ],
          ),
          padding: const EdgeInsets.only(
            left: 32,
            top: 50.0,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Let's Take a quick ride",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      Divider(
        color: Colors.white,
      ),
      Container(
          margin: const EdgeInsets.only(bottom: 12, top: 30),
          height: 230,
          child: Stack(
            children: [
              Positioned(
                  child: Material(
                child: Container(
                  height: 188.0,
                  //   width: width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: new Offset(-10.0, 10.0),
                        blurRadius: 20.0,
                        spreadRadius: 6.0,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 50.0,
                    bottom: 20,
                  ),
                ),
              )),
              //
              Positioned(
                top: 38,
                left: 15,
                child: Card(
                  elevation: 10.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Container(
                    height: 130,
                    width: 365,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              direction,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              Positioned(
                  top: 90,
                  left: 120,
                  child: Container(
                    height: 120,
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          speed,
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))
            ],
          )),

      // 2nd container exist here
      //
      //
      Expanded(
          child: ListView(
        children: [
          //
          Container(
              margin: const EdgeInsets.only(bottom: 12, top: 30),
              height: 260,
              child: Stack(
                children: [
                  Positioned(
                      child: Material(
                    child: Container(
                      height: 188.0,
                      //   width: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: new Offset(-10.0, 10.0),
                            blurRadius: 20.0,
                            spreadRadius: 6.0,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 50.0,
                        bottom: 20,
                      ),
                    ),
                  )),
                  Positioned(
                    top: 38,
                    left: 10,
                    child: Card(
                      elevation: 10.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Container(
                        height: 125,
                        width: 365,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: []),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      left: 120,
                      child: Container(
                        height: 140,
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'no of potholes $_counter',
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'no of bumps $_counter1',
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ))
                ],
              )),
        ],
      ))
      //
      //
    ]));
  }
}
