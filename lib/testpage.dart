import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'package:sensors_plus/sensors_plus.dart  ';

class testpage extends StatefulWidget {
  const testpage({Key? key}) : super(key: key);

  @override
  _testpageState createState() => _testpageState();
}

class _testpageState extends State<testpage> {
  double x = 0, y = 0, z = 0;
  String direction = "Orientation Stable";
  // String directiona = "none";
  @override
  void initState() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);

      x = event.x;
      y = event.y;
      z = event.z;

      if (x > 0) {
        direction = "device is back ";
      } else if (x < 0) {
        direction = "device is forward ";
      }
      if (y > 0) {
        direction = "device is left";
      } else if (y < 0) {
        direction = "device is right";
      }

      setState(() {});
    });
    super.initState();
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
                  "GO!",
                  style: TextStyle(fontSize: 25, color: Colors.redAccent),
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
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8.0),
            /* borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(80.0),
                ),*/
            boxShadow: [
              new BoxShadow(
                  color: Colors.redAccent.withOpacity(0.2),
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
          height: 210,
          child: Stack(
            children: [
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
                              direction,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
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
                    height: 150,
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          direction,
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   directiona,
                        //   style: TextStyle(
                        //       fontSize: 26,
                        //       color: Colors.black45,
                        //       fontWeight: FontWeight.bold),
                        // ),
                      ],
                    ),
                  ))
            ],
          )),
    ]));
  }
}
