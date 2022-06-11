import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/login/Logadm.dart';
import 'package:reports/login/register.dart';
import 'package:reports/main.dart';
import 'package:reports/pages/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogAdm extends StatefulWidget {
  @override
  _LogAdmState createState() => _LogAdmState();
}

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class _LogAdmState extends State<LogAdm> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final google = GoogleSignIn();
  GoogleSignInAccount? user;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/KLlogo.png',
                width: 80,
                height: 80,
              ),
              //hello
              Text(
                'Hello Again!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome back to Kopi Letek Cashier Apps',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //email field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //password field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _password = value.trim();
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xff5ac18e),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //loggoogle
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: InkWell(
              //     child: Container(
              //       padding: EdgeInsets.all(20),
              //       decoration: BoxDecoration(
              //         color: Color(0xff5ac18e),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       child: Center(
              //         child: Text(
              //           'Login with Google?',
              //           style: TextStyle(
              //               color: Colors.white, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //     ),
              //     onTap: () {
              // await _googleSignIn.signIn();
              // try {
              //   final googleMethod = await google.signIn();
              //   user = googleMethod;
              //   final auth = await googleMethod!.authentication;
              //   final cred = GoogleAuthProvider.credential(
              //       accessToken: auth.idToken, idToken: auth.idToken);
              //   await FirebaseAuth.instance
              //       .signInWithCredential(cred)
              //       .whenComplete(
              //         () => Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => Home(),
              //         )),
              //       );
              // } catch (e) {
              //   print(e);
              // }
              //       Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => Home(),
              //       ));
              //     },
              //   ),
              // ),
              //register button,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?'),
                  Text(
                    'Register now!',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              //Login google
            ],
          ),
        ),
      ),
    );
  }

  // Future signIn() async {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => Center(child: CircularProgressIndicator()));
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  //   navigatorKey.currentState!.popUntil((route) => route.isFirst);
  // }

//   Future GoogleSignIn<void> _incrementCounter() async {
//   setState(() {
//     _counter++;
//   });
//   Directory directory = await getApplicationDocumentsDirectory();
//   final String dirName = directory.path;
//   await File('$dir/counter.txt').writeAsString('$_counter');
// }
}
