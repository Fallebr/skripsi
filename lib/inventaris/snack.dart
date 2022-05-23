import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

class SnackInven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cek Stok Snack"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Spaghetti Setan"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Indomie Gunung"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Ramen"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Chicken Wings"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Chicken Fillet"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Pisang Cicicuit"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Kebab"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Spring Roll"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Siaomay"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("French Fries"),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
