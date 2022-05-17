import 'package:flutter/material.dart';

class FourthBar extends StatefulWidget {
  @override
  _FourthBarState createState() => _FourthBarState();
}

class _FourthBarState extends State<FourthBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14),
      height: 200,
      child: Text(
        '-MASIH DALAM PENGEMBANGAN-',
        style: TextStyle(
            color: Color(0xff5ac18e),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
