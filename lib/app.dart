import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reports/kasir/kasir2.dart';
import 'package:reports/kasir/transaksi.dart';
import 'package:reports/login/logadm.dart';
import 'package:reports/pages/kasir.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pos App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Colors.orange, primarySwatch: Colors.blue),
      home: Kasir2(),
    );
  }
}
