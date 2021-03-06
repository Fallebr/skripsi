import 'package:reports/commons/curved_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/inventaris/kopi_invent.dart';
import 'package:reports/inventaris/bahan_habis.dart';
import 'package:reports/inventaris/kopi.dart';
import 'package:reports/inventaris/non_kopi.dart';
import 'package:reports/inventaris/snack.dart';

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
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SnackInven(),
                ));
              },
              splashColor: Color(0xff5ac18e),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.fastfood_outlined,
                      size: 70,
                      color: Color(0xff5ac18e),
                    ),
                    Text("Snack", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Kopi(),
                ));
              },
              splashColor: Color(0xff5ac18e),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.coffee_maker_outlined,
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
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NonKopiInven(),
                ));
              },
              splashColor: Color(0xff5ac18e),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.bungalow_outlined,
                      size: 70,
                      color: Color(0xff5ac18e),
                    ),
                    Text("Bahan", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Habis(),
                ));
              },
              splashColor: Color(0xff5ac18e),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.outbox,
                      size: 70,
                      color: Color(0xff5ac18e),
                    ),
                    Text("Bahan Habis", style: TextStyle(fontSize: 17.0)),
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
