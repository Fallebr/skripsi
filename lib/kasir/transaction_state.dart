import 'dart:convert';

import 'package:get/get.dart';
import 'package:reports/kasir/transaction_controller.dart';
import 'package:reports/models/order.dart';

class TransactionState extends GetxController {
  static RxList<Order> orders = <Order>[].obs;
  static RxInt totalOrder = 0.obs;
  static RxInt uangKembali = 0.obs;

  static void addOrder(Order order) {
    orders.add(order);
    addTotal(order);
  }

  static void removeOrder(Order order) {
    orders.remove(order);
    decreaseTotal(order);
  }

  static void cleanOrder() {
    orders.clear();
    totalOrder.value = 0;
  }

  static void addTotal(Order order) {
    totalOrder.value += (order.product!.harga! * int.parse(order.qty!));
    print(totalOrder.value);
  }

  static void decreaseTotal(Order order) {
    totalOrder.value -= (order.product!.harga! * int.parse(order.qty!));
  }
}
