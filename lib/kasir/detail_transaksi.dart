import 'package:flutter/material.dart';
import 'package:reports/models/order.dart';
import 'package:reports/services/transaction_service.dart';

import '../commons/navigation_drawer_widget.dart';

class DetailTransaksi extends StatelessWidget {
  final List<Order> orders;
  final service = TransactionService();

  DetailTransaksi({Key? key, required this.orders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Transaksi"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView.builder(
        itemCount: (orders == null) ? 0 : orders.length,
        itemBuilder: (context, int position) {
          return ListTile(
            leading: const Icon(Icons.arrow_right),
            title: Text(orders[position].product!.nama ?? ""),
            subtitle: Text(orders[position].qty.toString()),
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
