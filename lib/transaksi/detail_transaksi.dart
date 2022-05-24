import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

class dettrans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deatil Transaksi"),
        backgroundColor: Color(0xff5ac18e),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.arrow_downward,
                      size: 70,
                      color: Color(0xff5ac18e),
                    ),
                    Text("nama pelanggan", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      drawer: NavigationDrawerWidget(),
    );
  }
}
