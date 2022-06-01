import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SecondBar extends StatefulWidget {
  @override
  _SecondBarState createState() => _SecondBarState();
}

class _SecondBarState extends State<SecondBar> {
  @override
  Widget build(BuildContext context) {
    // DateFormat.yMMMEd().format(DateTime.now()),
    return Container(
      padding: new EdgeInsets.only(left: 15, bottom: 5, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Text(
            'Day                 : ',
            style: new TextStyle(
                color: Colors.cyan[900],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Text(
            DateFormat.yMMMEd().format(DateTime.now()),
            textAlign: TextAlign.left,
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
