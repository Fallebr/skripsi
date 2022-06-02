import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/kasir/transaction_controller.dart';
import 'package:reports/pages/menu.dart';

class Kasir2 extends StatelessWidget {
  final _controller = Get.put(TransactonController());
  int total_pesanan = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Kasir"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _controller.namaPelangganController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Masukan Nama Pelanggan',
                fillColor: Color(0xff5ac18e),
              ),
            ),
          ),
          RaisedButton(
            color: Color(0xff5ac18e),
            child: Text("tambahkan pesanan"),
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Menu(),
                ),
              );
            },
          ),
          Container(
            child: (_controller.orders.isNotEmpty)
                ? Container(
                    height: 300,
                    child: ListView(
                      children: [
                        for (var order in _controller.orders.value)
                          // total_pesanan += order.product!.harga * int.parse(order.qty),
                          ListTile(
                            title: Text(order.product!.nama!),
                            subtitle: Text(order.product!.harga.toString()),
                            trailing: Text(order.qty.toString()),
                          ),
                      ],
                    ),
                  )
                : Container(),
          ),
          Container(
            child: (Text(
              ' Total Pesanan : Rp. ',
            )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 60,
            child: TextField(
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon:
                      Icon(Icons.attach_money, color: Color(0xff5ac18e)),
                  hintText: 'Masukan uang diterima',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          Container(
            child: RaisedButton(
              color: Color(0xff5ac18e),
              child: Text("Bayar Sekarang"),
              textColor: Colors.white,
              shape: StadiumBorder(),
              onPressed: () {
                _controller.sendData();
              },
            ),
          ),
          new ListTile(
            title: new Text("Uang Kembali: Rp."),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
