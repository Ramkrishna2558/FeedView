import 'package:feedx/home.dart';
import 'package:feedx/motionsensor.dart';
import 'package:feedx/newhome.dart';
import 'package:feedx/testpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feedx/main.dart';
import 'package:feedx/registerme.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Future _getStoragePermission() async {
//   bool permissionGranted;
//   if (await Permission.storage.request().isGranted) {
//     setState(() {
//       permissionGranted = true;
//     });
//   } else if (await Permission.storage.request().isPermanentlyDenied) {
//     await openAppSettings();
//   } else if (await Permission.storage.request().isDenied) {
//     setState(() {
//       permissionGranted = false;
//     });
//   }
// }

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  // form key ram
  final _formkey = GlobalKey<FormState>();

  // final TextEditingController;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: true,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("PLease Enter Your Email");
        }

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("PLease Enter a Valid Mail ID");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: Color(hexColor("#120a01")),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter passkey");
        }

        if (!regex.hasMatch(value)) {
          return ("Please enter Correct Password(Minimum 6 Characters)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key_sharp,
          color: Color(hexColor("#120a01")),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Passkey",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = Material(
      // #ff850a
      color: Color(hexColor("#ff850a")),
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(emailController.text, passwordController.text);

          //  this will navigate to homescreen
          /* Navigator.push(
              context, MaterialPageRoute(builder: (context) => feedx()));  */
        },
        child: Text(
          "Get-in",
          style: TextStyle(
              fontSize: 20, color: Colors.white70, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Color(hexColor("#ffb60a")),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Color(hexColor("#ffb60a")),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      child: Image.asset(
                        "images/fvlogo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    emailField,
                    SizedBox(
                      height: 30,
                    ),
                    passwordField,
                    SizedBox(
                      height: 20,
                    ),
                    loginButton,
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Got no Account's ?",
                            style: TextStyle(
                              color: Color(hexColor("#120a01")),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registerme()));
                          },
                          child: Text(
                            "SIGNUP",
                            style: TextStyle(
                                //#a12031
                                color: Color(hexColor("#a12031")),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      width: 90,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => testpage()));
                        },
                        child: Text(
                          "Or Login as Guest",
                          style: TextStyle(
                              //#a12031

                              color: Color(hexColor("#a12032")),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//    hexcolour code converter code
  int hexColor(String color) {
    //adding prefix
    String newColor = '0xff' + color;
    //removing # sign
    newColor = newColor.replaceAll('#', '');
    //converting it to the integer
    int finalColor = int.parse(newColor);
    return finalColor;
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Success"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => feedx()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
