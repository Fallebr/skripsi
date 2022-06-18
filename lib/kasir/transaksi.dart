import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/kasir/detail_transaksi.dart';
import 'package:reports/models/nota.dart';
import 'package:reports/services/transaction_service.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({Key? key}) : super(key: key);

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  int? notaCount;
  List<Nota>? nota;
  TransactionService? service;

  @override
  void initState() {
    service = TransactionService();
    initialize();
    super.initState();
  }

  Future initialize() async {
    nota = [];
    nota = await service?.getNota();
    notaCount = nota?.length;
    nota = nota;
    refresh();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Transaksi"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView.builder(
        itemCount: (notaCount == null) ? 0 : notaCount,
        itemBuilder: (context, int position) {
          return ListTile(
            leading: const Icon(Icons.arrow_right),
            title: Text(nota![position].pelanggan!),
            subtitle: Text(nota![position].tanggal!.toString()),
            trailing: (nota![position].status!)
                ? Icon(Icons.star)
                : Icon(Icons.star_border),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailTransaksi(
                  orders: nota![position].orders!,
                  nota: nota![position],
                ),
              ));
            },
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
