import 'package:feedx/login.dart';
import 'package:feedx/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:feedx/login.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(feedview());
}

class feedview extends StatelessWidget {
  const feedview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'feed spash',
      home: Splash(),
    );
  }
}
