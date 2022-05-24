import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/transaksi/detail_transaksi.dart';

class Transaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Transaksi"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(children: <Widget>[
        new ListTile(
            title: new Text("23 - 5 - 2022"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => dettrans(),
              ));
            }),
        new ListTile(
            title: new Text("24 - 5 - 2022"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => dettrans(),
              ));
            }),
        new ListTile(
            title: new Text("25 - 5 - 2022"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => dettrans(),
              ));
            }),
        new ListTile(
            title: new Text("26 - 5 - 2022"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => dettrans(),
              ));
            }),
      ]),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
