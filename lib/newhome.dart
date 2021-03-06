import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedx/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'main.dart';

class newhome extends StatefulWidget {
  const newhome({Key? key}) : super(key: key);

  @override
  _newhomeState createState() => _newhomeState();
}

class _newhomeState extends State<newhome> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              // bottomRight: Radius.circular(50),
              ),
          color: Colors.greenAccent,
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
            Positioned(
              top: 70,
              left: 68,
              child: Container(
                //  margin: EdgeInsets.Only(),
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    )),
              ),
            ),
            Positioned(
                top: 79,
                left: 130,
                right: 100,
                child: Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 25, color: Colors.teal),
                )),
          ],
        ),
      ),
      /*  SizedBox(
          //   height: height * 0.2,
          //height: height * 0.05,
          ),*/
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
                  color: Colors.greenAccent.withOpacity(0.6),
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
                "${loggedInUser.firstName}",
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
          height: 210,
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
                ),
              )),
              Positioned(
                top: 38,
                left: 10,
                child: Card(
                  elevation: 10.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    height: 140, width: 365,

                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "you're popular",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),

                    //decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(18.0),
                    //  image: DecorationImage(
                    //  fit: BoxFit.fill,
                    //image: AssetImage("images/pvgi.png"),
                    //),
                    //),
                  ),
                ),
              ),
              Positioned(
                  top: 16,
                  left: 120,
                  child: Container(
                    height: 150,
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "you're popular",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        /*   Text(
                          "PVGCOE,Nashik",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              fontWeight: FontWeight.normal),
                        ),
                        Divider(
                          color: Colors.black45,
                        ),
                                     Text(
                          "Developed and Created by Students of PVG  \n"
                          "as a final year project using machine learning",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                              fontWeight: FontWeight.normal),
                        ), */
                      ],
                    ),
                  ))
            ],
          )),
    ]));
  }
}
