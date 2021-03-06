import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/inventaris/non_kopi.dart';
import 'package:reports/kasir/kasir2.dart';

class FirstBar extends StatefulWidget {
  @override
  _FirstBarState createState() => _FirstBarState();
}

class _FirstBarState extends State<FirstBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: new EdgeInsets.only(left: 15, bottom: 5, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ),
        Container(
          // height: 90,
          child: (ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff5ac18e), // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Kasir2(),
              ));
            },
            child: Text('go to the cashier'),
          )),
        ),
      ],
    );
  }
}

class DetailFirstBar extends StatefulWidget {
  final Color color;
  final Color colorText;
  final String title;
  final String subtitle;

  final Icon icon;
  DetailFirstBar({
    required this.color,
    required this.colorText,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  _DetailFirstBarState createState() => _DetailFirstBarState();
}

class _DetailFirstBarState extends State<DetailFirstBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),
                colors: [
                  widget.color,
                  Colors.blueAccent,
                ],
                tileMode: TileMode.repeated,
              ),
              color: widget.color,
              borderRadius: new BorderRadius.circular(12.0)),
          margin: EdgeInsets.only(left: 10),
          width: 250,
          padding: EdgeInsets.all(5.0),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: new BorderRadius.circular(50.0)),
            height: 50,
            width: 50,
            child: Center(child: widget.icon),
          ),
        ),
        Positioned(
          top: 10,
          left: 100,
          child: Container(
            width: 120,
            child: new Text(
              widget.title,
              style: new TextStyle(
                color: widget.colorText,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 100,
          child: Container(
            alignment: Alignment.center,
            width: 130,
            child: Center(
              child: new Text(
                widget.subtitle,
                style: new TextStyle(color: Colors.white, fontSize: 12.0),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
