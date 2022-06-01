import 'package:flutter/material.dart';
import 'package:reports/commons/splash_screen.dart';
import 'package:reports/kasir/transaksi.dart';
import 'commons/navigation_drawer_widget.dart';
import 'commons/splash_screen.dart';
import 'menu_Kopi/brew.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report Application',
      theme: ThemeData(primaryColor: Colors.amber),
      home: Transaksi(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang!"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(),
    );
  }
}
