import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/kasir/transaction_controller.dart';
import 'package:reports/kasir/transaction_state.dart';
import 'package:reports/pages/menu.dart';

class Kasir2 extends StatefulWidget {
  @override
  State<Kasir2> createState() => _Kasir2State();
}

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class _Kasir2State extends State<Kasir2> {
  final _controller = Get.put(TransactonController());

  int total_pesanan = 0;
  GoogleSignInAccount? user = _googleSignIn.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  getCurrentUser() async {
    _user = _auth.currentUser!;
    _controller.emailController.text = _user.email!;
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Again ${_user.email}" + " !"),
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
              child: Text(
                "tambahkan pesanan",
                style: TextStyle(fontSize: 20),
              ),
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
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: (_controller.orders.isNotEmpty)
                ? Container(
                    height: 300,
                    child: Obx(
                      () => ListView(
                        children: [
                          for (var order in _controller.orders.value)
                            // TransactionState.totalPerDay(order.)
                            // total_pesanan +=
                            //     order.product!.harga * int.parse(order.qty),
                            ListTile(
                              title: Text(
                                order.product!.nama!,
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                order.product!.harga.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              trailing: Text(
                                order.qty.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
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
                  ' Total Pesanan : ' +
                      TransactionState.totalOrder.value.toString(),
                  style: TextStyle(fontSize: 20),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _controller.uangPelangganController,
                  decoration: const InputDecoration(
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
                child: Obx(
                  () => Text(
                    'Uang Kembalian : Rp. ' +
                        _controller.changes.value.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  // padding: const EdgeInsets.only(left: 5.0),
                  child: RaisedButton(
                    color: Color(0xff5ac18e),
                    child: Text(
                      "Hitung",
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.white,
                    shape: StadiumBorder(),
                    onPressed: () {
                      _controller.calculateChange();
                      // _controller.sendData();
                      // _controller.namaPelangganController.text = '';
                      // TransactionState.cleanOrder();
                    },
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  // padding: const EdgeInsets.only(left: 5.0),
                  child: Obx(
                    () => RaisedButton(
                      color: (_controller.changes.value >= 0 &&
                              _controller.uangPelangganController.text != '')
                          ? Color(0xff5ac18e)
                          : Colors.red,
                      child: Text(
                        "Bayar Sekarang",
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: Colors.white,
                      shape: StadiumBorder(),
                      onPressed: () {
                        (_controller.changes.value >= 0 &&
                                _controller.uangPelangganController.text != '')
                            ? {
                                _controller.sendData(),
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('INFORMATION'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text('Transaction Success'),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('oke'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                )
                              }
                            : null;
                        // _controller.namaPelangganController.text = '';
                      },
                    ),
                  ),
                ),
              ),
            ],
          )
          // SizedBox(
          //   height: 10,
          // ),

          // new ListTile(
          //   title: new Text('Uang Kembali: Rp.'+ _controller.UangPelanggaController -= ),
          // ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
