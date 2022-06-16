import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/menu/kopi_menu.dart';
import 'package:reports/menu/non_kopi_menu.dart';
import 'package:reports/menu/snack_menu.dart';
import 'package:reports/menu_Kopi/brew.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body:
          // ListView(children: <Widget>[
          //   new ListTile(
          //     leading: new Icon(Icons.coffee),
          //     title: new Text("KOPI"),
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => KopiMenu(),
          //       ));
          //     },
          //   ),
          //   new ListTile(
          //     leading: new Icon(Icons.icecream),
          //     title: new Text("NON KOPI"),
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => NonKopi(),
          //       ));
          //     },
          //   ),
          //   new ListTile(
          //     leading: new Icon(Icons.fastfood),
          //     title: new Text("SNACK"),
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => Snack(),
          //       ));
          //     },
          //   ),
          // ]),
          GridView.count(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 1,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(35),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => KopiMenu(),
                ));
              },
              splashColor: Color(0xff5ac18e),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.coffee,
                      size: 70,
                      color: Color(0xff5ac18e),
                    ),
                    Text("Kopi", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(35),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NonKopi(),
                ));
              },
              splashColor: Color(0xff5ac18e),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.icecream_rounded,
                      size: 70,
                      color: Color(0xff5ac18e),
                    ),
                    Text("NON KOPI", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(35),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Snack(),
                ));
              },
              splashColor: Color(0xff5ac18e),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.outdoor_grill_sharp,
                      size: 70,
                      color: Color(0xff5ac18e),
                    ),
                    Text("SNACK", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
