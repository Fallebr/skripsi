import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reports/kasir/transaction_state.dart';
import 'package:reports/services/transaction_service.dart';

import '../models/nota.dart';
import '../models/order.dart';

class TransactonController extends GetxController {
  RxObjectMixin<Nota> nota = Nota().obs;
  RxList<Order> orders = <Order>[].obs;

  TextEditingController namaPelangganController = TextEditingController();

  TransactonController() {
    orders.value = TransactionState.orders;
  }

  void sendData() {
    nota.value.pelanggan = namaPelangganController.text;
    nota.value.orders = orders.value;
    nota.value.tanggal = DateFormat.yMMMEd().format(DateTime.now());
    nota.value.total = '0';
    TransactionService.addNota(nota.value);
  }
}
