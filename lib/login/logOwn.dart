import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/login/Logadm.dart';
import 'package:reports/login/login.dart';
import 'package:reports/main.dart';

class LogOwn extends StatefulWidget {
  @override
  _LogOwnState createState() => _LogOwnState();
}

Widget buildPwd(TextEditingController passwordController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          controller: passwordController,
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.lock, color: Color(0xff5ac18e)),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildLpSnd(BuildContext context) {
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Color(0xff5ac18e),
                title: Text(
                  'INFORMASI',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  'Hubungi Manager Untuk Mengetahui Sandi Anda',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            });
      },
      padding: EdgeInsets.only(right: 0),
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget buildLogbtn(
    TextEditingController passwordController, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: () {
        if (passwordController.text == '13') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Color(0xff5ac18e),
                  title: Text(
                    'INFORMASI',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    'Password Salah!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              });
        }
      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Text(
        'Login',
        style: TextStyle(
            color: Color(0xff5ac18e),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class _LogOwnState extends State<LogOwn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color(0x665ac18e),
                      Color(0x995ac18e),
                      Color(0xcc5ac18e),
                      Color(0xff5ac18e),
                    ])),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Masukan Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 50),
                          buildPwd(passwordController),
                          buildLpSnd(context),
                          buildLogbtn(passwordController, context),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
