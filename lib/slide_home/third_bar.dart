import 'package:flutter/material.dart';

class ThirdBar extends StatefulWidget {
  @override
  _ThirdBarState createState() => _ThirdBarState();
}

class _ThirdBarState extends State<ThirdBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(left: 15, bottom: 5, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Text(
            "Nota Keluar  : ",
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
