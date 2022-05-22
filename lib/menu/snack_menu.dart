import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

class SnackMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MENU"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Spaghetti Setan"),
            subtitle: new Text("Rp.20.000,00"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Indomie Gunung"),
            subtitle: new Text("Rp.15.000,00"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Ramen"),
            subtitle: new Text("Rp.15.000,00"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Chicken Wings"),
            subtitle: new Text("Rp.20.000,00"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Chicken Fillet"),
            subtitle: new Text("Rp.15.000,00"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Pisang Cicicuit"),
            subtitle: new Text("Rp.15.000,00"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Kebab"),
            subtitle: new Text("Rp.15.000,00"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Spring Roll"),
            subtitle: new Text("Rp.13.000,00"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("Siaomay"),
            subtitle: new Text("Rp.13.000,00"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.fastfood_outlined),
            title: new Text("French Fries"),
            subtitle: new Text("Rp.20.000,00"),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
