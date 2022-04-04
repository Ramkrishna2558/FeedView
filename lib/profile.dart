import 'package:feedx/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      /*    appBar: AppBar(
        title: Center(child: Text('Profile')),
        backgroundColor: Colors.teal,
      ),  */
      body: Column(
        children: [
          Container(
            height: 145,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: Colors.teal,
              boxShadow: [
                new BoxShadow(
                    color: Colors.teal.withOpacity(0.6),
                    offset: new Offset(-10.0, 0.0),
                    blurRadius: 20.0,
                    spreadRadius: 5.0),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 70,
                  left: 0,
                  child: Container(
                    height: 50,
                    width: 190,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            topRight: Radius.circular(50))),
                  ),
                ),
                Positioned(
                    top: 79,
                    left: 100,
                    child: Text(
                      "Profile",
                      style: TextStyle(fontSize: 25, color: Colors.teal),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
              height: 230,
              child: Stack(
                children: [
                  Positioned(
                      child: Material(
                    child: Container(
                      height: 188.0,
                      width: width * 0.9,
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
                    top: 0,
                    left: 10,
                    child: Card(
                      elevation: 10.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/pvgi.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 170,
                      child: Container(
                        height: 150,
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Institute",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
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
                            ),
                          ],
                        ),
                      ))
                ],
              )),
          Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, top: 20),
                        height: 170,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(80.0),
                            ),
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
                            bottom: 50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Developer",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Ramkrishna More",
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
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 25),
                        height: 170,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(80.0),
                              bottomRight: Radius.circular(80.0),
                            ),
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
                            bottom: 50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Developer",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Rushikesh Solanke",
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
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 25),
                        height: 170,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(80.0),
                            ),
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
                            bottom: 50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Developer",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Prerna Pagar",
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
                      SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: ActionChip(
                              avatar: CircleAvatar(
                                backgroundColor: Colors.grey.shade800,
                                child: const Text('RM'),
                              ),
                              elevation: 0,
                              label: Text(
                                "Logout",
                              ),
                              onPressed: () {
                                logout(context);
                              }),
                        ),
                      ),
                    ],
                  )))
        ],
      ),
    );
  }

  // the logout function

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => loginpage()));
  }
}
