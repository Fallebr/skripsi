import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:reports/models/order.dart';
import 'package:reports/services/transaction_service.dart';

import '../commons/navigation_drawer_widget.dart';
// import 'transaction_controller.dart';

class DetailTransaksi extends StatelessWidget {
  final List<Order> orders;
  final service = TransactionService();
  // final _controller = Get.put(TransactonController());

  DetailTransaksi({Key? key, required this.orders}) : super(key: key);
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
            subtitle: Text(orders[position].qty.toString()),
            // trailing: Text(order.product!.harga.toString()),
            onTap: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
