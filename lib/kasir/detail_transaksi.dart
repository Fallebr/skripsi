import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reports/kasir/transaction_state.dart';
import 'package:reports/kasir/transaksi.dart';
import 'package:reports/models/nota.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:reports/models/order.dart';
import 'package:reports/services/transaction_service.dart';

import '../commons/navigation_drawer_widget.dart';
import 'transaction_controller.dart';

class DetailTransaksi extends StatefulWidget {
  final List<Order> orders;
  final Nota nota;
  DetailTransaksi({Key? key, required this.orders, required this.nota})
      : super(key: key);

  @override
  State<DetailTransaksi> createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  int? notaCount;

  final service = TransactionService();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late User _user;

  getCurrentUser() async {
    _user = _auth.currentUser!;
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
        title: Text("Detail Transaksi"),
        backgroundColor: Color(0xff5ac18e),
      ),
      // drawer: NavigationDrawerWidget(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 200,
            width: 200,
            child: Image.asset(
              'assets/KLlogo.png',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Column(
              children: [
                Text(
                  'Kasir: ${_user.email}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Nama Pelanggan: ' + widget.nota.pelanggan!,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 300,
            child: ListView.builder(
              itemCount: (widget.orders == null) ? 0 : widget.orders.length,
              itemBuilder: (context, int position) {
                // for (var order in _controller.orders.value)
                return ListTile(
                  // leading: Image.asset('assets/KLlogo.png'),
                  title: Text(widget.orders[position].product!.nama ?? "",
                      style: TextStyle(
                        fontSize: 25,
                      )),
                  // subtitle: Text(
                  //   orders[position].product!.harga.toString(),
                  //   style: TextStyle(fontSize: 25),
                  // ),
                  trailing: Text(widget.orders[position].qty.toString(),
                      style: TextStyle(
                        fontSize: 25,
                      )),
                  // trailing: Text(order.product!.harga.toString()),
                  onTap: () {},
                );

                // Text(
                //   ' Total Pesanan : Rp. ' +
                //       TransactionState.uangPelanggan.value.toString(),
                // );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          TransactionService.updateStatusNota(widget.nota);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Transaksi(),
          ));
        },
        label: Text(
          'Selesai',
        ),
        icon: Icon(
          Icons.check_rounded,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff5ac18e),
      ),

      bottomNavigationBar: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Total Order : Rp. ' + widget.nota.totalOrder.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // SizedBox(height: 10),
        ),
      ),
      // SizedBox(height: 10),
    );
  }
}
