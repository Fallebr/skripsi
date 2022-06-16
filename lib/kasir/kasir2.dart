import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/kasir/transaction_controller.dart';
import 'package:reports/kasir/transaction_state.dart';
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextFormField(
                  controller: _controller.namaPelangganController,
                  decoration: const InputDecoration(
                    // border: UnderlineInputBorder(),
                    labelText: 'Masukan Nama Pelanggan',
                    fillColor: Color(0xff5ac18e),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: RaisedButton(
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
          ),
          Container(
            child: (_controller.orders.isNotEmpty)
                ? Container(
                    height: 200,
                    child: Obx(
                      () => ListView(
                        children: [
                          for (var order in _controller.orders.value)
                            // total_pesanan +=
                            //     order.product!.harga * int.parse(order.qty),
                            ListTile(
                              title: Text(order.product!.nama!),
                              subtitle: Text(order.product!.harga.toString()),
                              trailing: Text(order.qty.toString()),
                              onTap: () {
                                TransactionState.removeOrder(order);
                              },
                            ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              child: Obx(
                () => (Text(
                  ' Total Pesanan : Rp. ' +
                      TransactionState.totalOrder.value.toString(),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   alignment: Alignment.centerLeft,
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(10),
          //       boxShadow: [
          //         BoxShadow(
          //             color: Colors.black26,
          //             blurRadius: 6,
          //             offset: Offset(0, 2))
          //       ]),
          //   height: 60,
          //   child: TextField(
          //     style: TextStyle(
          //       color: Colors.black87,
          //     ),
          //     decoration: InputDecoration(
          //         border: InputBorder.none,
          //         contentPadding: EdgeInsets.only(top: 14),
          //         prefixIcon:
          //             Icon(Icons.attach_money, color: Color(0xff5ac18e)),
          //         hintText: 'Masukan uang diterima',
          //         hintStyle: TextStyle(color: Colors.black38)),
          //     controller: _controller.uangPelangganController,
          //   ),
          // ),
          //input uang pelanggan
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  // controller: uangPelangganController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Masukan Uang Pelanggan',
                  ),
                  // onChanged: (){};
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //Teks kembalian
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Uang Kembalian : Rp. ')),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              // padding: const EdgeInsets.only(left: 5.0),
              child: RaisedButton(
                color: Color(0xff5ac18e),
                child: Text("Bayar Sekarang"),
                textColor: Colors.white,
                shape: StadiumBorder(),
                onPressed: () {
                  _controller.sendData();
                  // _controller.namaPelangganController.text = '';
                  // TransactionState.cleanOrder();
                },
              ),
            ),
          ),
          // new ListTile(
          //   title: new Text('Uang Kembali: Rp.'+ _controller.UangPelanggaController -= ),
          // ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
