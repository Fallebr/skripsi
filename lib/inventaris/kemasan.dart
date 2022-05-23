import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

class Kemasan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cek Kemasan"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Strawberry Frappucino"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Chocolate"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Macha Latte"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Oreo"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Red Velvet"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Vanilla"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Mocca"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Choco Chezze"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Lemon Tea"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Tarik Tea"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Jasmine Tea"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Lyche Tea"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Lemon Squash"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("Lyche Squash"),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
