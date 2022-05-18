import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.coffee),
          title: new Text("KOPI"),
          onTap: () {},
        ),
        new ListTile(
          leading: new Icon(Icons.icecream),
          title: new Text("NON KOPI"),
          onTap: () {},
        ),
        new ListTile(
          leading: new Icon(Icons.fastfood),
          title: new Text("SNACK"),
          onTap: () {},
        ),
      ]),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
