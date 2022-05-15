import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

class Inventaris extends StatefulWidget {
  @override
  _InventarisState createState() => _InventarisState();
}

class _InventarisState extends State<Inventaris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman inventaris"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(),
    );
  }
}
