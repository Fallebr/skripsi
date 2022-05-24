import 'package:flutter/material.dart';

class SecondBar extends StatefulWidget {
  @override
  _SecondBarState createState() => _SecondBarState();
}

class _SecondBarState extends State<SecondBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(left: 15, bottom: 5, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Text(
            "Day                 : 23 - 05 -2022 ",
            style: new TextStyle(
                color: Colors.cyan[900],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
