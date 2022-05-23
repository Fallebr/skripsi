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
            title: new Text("cup kecil"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("cup besar"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("penutup cup"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("sedotan"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("cup holder"),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
