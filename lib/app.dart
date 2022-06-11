import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reports/kasir/transaksi.dart';
import 'package:reports/login/Logadm.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pos App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Colors.orange, primarySwatch: Colors.blue),
      home: Transaksi(),
    );
  }
}
