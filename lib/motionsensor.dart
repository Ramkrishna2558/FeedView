// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'main.dart';
import 'package:flutter/material.dart';
//import 'package:starflut/starflut.dart';
//
// Future _getStoragePermission() async {
//   if (await Permission.storage.request().isGranted) {
//     setState(() {
//       bool permissionGranted = true;
//     });
//   }
// }

void setState(Null Function() param0) {}

class motionsensor extends StatefulWidget {
  const motionsensor({Key? key}) : super(key: key);

  @override
  State<motionsensor> createState() => _motionsensorState();
}

class _motionsensorState extends State<motionsensor> {
  double x = 0, y = 0, z = 0;
  String speed = "none";
  // String speedy = "none";

  void initState() {
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      print(event);
      z = event.z;
      x = event.x;
      y = event.y;
      if (z > 5) {
        speed = "a pot hole";
      } else if (z < 2) {
        speed = "Chalo";
      }
      ;

      setState(() {});
    });
    super.initState();
// [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]
  }

  // String x,y,z;
  final fb = FirebaseDatabase.instance;

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
          color: Colors.redAccent,
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
                  "Motion",
                  style: TextStyle(fontSize: 25, color: Colors.redAccent),
                )),
          ],
        ),
      ),
      Divider(
        color: Colors.white,
      ),
      Container(
          margin: const EdgeInsets.only(bottom: 12, top: 30),
          height: 210,
          child: Stack(children: [
            Positioned(
                child: Material(
              child: Container(
                height: 188.0,
                //   width: width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
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
                  height: 140,
                  width: 365,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            speed,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ])),
    ]));
  }
}
