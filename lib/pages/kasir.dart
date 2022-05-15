import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/pages/menu.dart';

class Kasir extends StatefulWidget {
  @override
  _KasirState createState() => _KasirState();
}

class _KasirState extends State<Kasir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Halaman kasir"),
          backgroundColor: Color(0xff5ac18e),
        ),
        drawer: NavigationDrawerWidget(),
        body: Stack(children: <Widget>[
          Text('Order Hari Ini :'),
          // Container(
          //   child: RaisedButton(
          //     elevation: 5,
          //     onPressed: () {},
          //     padding: EdgeInsets.all(15),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(15)),
          //     color: Colors.white,
          //     child: Text(
          //       'Tambah',
          //       style: TextStyle(
          //           color: Color(0xff5ac18e),
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // )
        ]));
  }
}

Widget buildTmbhData() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
  );
}
