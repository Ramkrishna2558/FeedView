import 'package:feedx/login.dart';
import 'package:feedx/main.dart';
import 'package:feedx/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feedx/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetologinpage();
  }

  _navigatetologinpage() async {
    await Future.delayed(Duration(milliseconds: 1600), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => loginpage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,

            child: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/copyfeed.png'),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ],
            ),
            width: 200,
            // color: Colors.greenAccent,
          ),
          Container(
            child: Center(
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
