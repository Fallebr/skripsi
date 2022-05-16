import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

class Habis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barang Habis Hari Ini"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
