import 'dart:convert';

import 'package:get/get.dart';
import 'package:reports/kasir/transaction_controller.dart';
import 'package:reports/models/order.dart';

class TransactionState extends GetxController {
  static RxList<Order> orders = <Order>[].obs;

  static void addOrder(Order order) {
    orders.add(order);
  }

  void removeOrder(Order order) {
    orders.remove(order);
  }
}
