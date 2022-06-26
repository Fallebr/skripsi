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

class DetailTransaksi extends StatelessWidget {
  int? notaCount;
  final List<Order> orders;
  final service = TransactionService();
  final Nota nota;
  // final _controller = Get.put(TransactonController());

  DetailTransaksi({Key? key, required this.orders, required this.nota})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Transaksi"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView.builder(
        itemCount: (orders == null) ? 0 : orders.length,
        itemBuilder: (context, int position) {
          // for (var order in _controller.orders.value)
          return ListTile(
            // leading: Text("Detail Pesanan"),
            title: Text(orders[position].product!.nama ?? "",
                style: TextStyle(
                  fontSize: 25,
                )),
            trailing: Text(orders[position].qty.toString(),
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

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          TransactionService.updateStatusNota(nota);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Transaksi(),
          ));
        },
        label: Text(
          'Selesai',
          style: TextStyle(color: Colors.white),
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
            'Total Order : Rp. ' + nota.totalOrder.toString(),
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
