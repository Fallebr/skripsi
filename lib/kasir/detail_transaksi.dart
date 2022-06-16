import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reports/kasir/transaction_state.dart';
import 'package:reports/models/nota.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:reports/models/order.dart';
import 'package:reports/services/transaction_service.dart';

import '../commons/navigation_drawer_widget.dart';
import 'transaction_controller.dart';

class DetailTransaksi extends StatelessWidget {
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
            title: Text(orders[position].product!.nama ?? ""),
            subtitle:
                Text('Jumlah Pesanan : ' + orders[position].qty.toString()),
            // trailing: Text(order.product!.harga.toString()),
            onTap: () {},
          );
          // Text(
          //   ' Total Pesanan : Rp. ' +
          //       TransactionState.uangPelanggan.value.toString(),
          // );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Total Order : Rp. ' + nota.totalOrder.toString(),
            textAlign: TextAlign.center,
          ),
          // SizedBox(height: 10),
        ),
      ),
      // SizedBox(height: 10),
    );
  }
}
