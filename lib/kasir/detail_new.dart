// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:reports/models/nota.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// import 'package:reports/models/order.dart';
// import 'package:reports/services/transaction_service.dart';

// import '../commons/navigation_drawer_widget.dart';
// import 'transaction_controller.dart';

// class detailNew extends StatelessWidget {
//   final List<Order> orders;
//   final service = TransactionService();
//   final Nota nota;

//   detailNew({Key? key, required this.orders, required this.nota})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detail Transaksi"),
//         backgroundColor: Color(0xff5ac18e),
//       ),
//       body: SafeArea(
//         child: Center(
//             child: Center(
//           child: Builder(
//             itemCount: (orders == null) ? 0 : orders.length,
//             builder: (BuildContext context) =>
//                 Text(orders[position].product!.nama ?? ""),
//           ),
//         )),
//       ),
//     );
//   }
// }
