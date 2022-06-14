import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/slide_home/fourth_bar.dart';
import 'package:reports/slide_home/second_bar.dart';
import 'package:reports/slide_home/first_bar.dart';
import 'package:reports/slide_home/third_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(),
                child: Image.asset('assets/header-bg.jpg'),
                width: double.infinity,
              ),
              new FirstBar(),
              Padding(padding: EdgeInsets.all(20.0)),
              new SecondBar(),
              // Padding(padding: EdgeInsets.all(20.0)),
              // new ThirdBar(),
              //   Padding(padding: EdgeInsets.all(20.0)),
              //   new FourthBar(),
              //   Padding(padding: EdgeInsets.all(20.0)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
