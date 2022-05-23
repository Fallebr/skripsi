import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

class Aldap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cek Keperluan Dapur"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("sendok"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("garpu"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("piring kaca"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("mangkuk"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("piring kecil"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("piring kecil plastik"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("cawan"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("gunting"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("pisau"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("tisue"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("saus"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("sambal"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("garam"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("bahan dapur"),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
