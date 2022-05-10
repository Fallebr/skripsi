import 'package:flutter/material.dart';
import 'login/login.dart';
import 'commons/collapsing_navigation_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report Application',
      theme: ThemeData(primaryColor: Colors.amber),
      home: Login(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
      ),
      drawer: CollapsingNavigationDrawer(),
      body: CollapsingNavigationDrawer(),
    );
  }
}
