import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/pages/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff5ac18e),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/KLlogo.png',
            width: 80,
            height: 80,
          ),
          // Text(
          //   'Loading',
          //   style: TextStyle(
          //       fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          // ),
        ],
      ),
    );
  }
}
