import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reports/kasir/transaction_state.dart';
import 'package:reports/services/transaction_service.dart';

import '../models/nota.dart';
import '../models/order.dart';

class TransactonController extends GetxController {
  RxObjectMixin<Nota> nota = Nota().obs;
  RxList<Order> orders = <Order>[].obs;
  RxInt changes = 0.obs;

  TextEditingController namaPelangganController = TextEditingController();
  TextEditingController uangPelangganController = TextEditingController();

  TransactonController() {
    orders.value = TransactionState.orders;
  }

  void sendData() {
    nota.value.pelanggan = namaPelangganController.text;
    nota.value.orders = orders.value;
    nota.value.tanggal = DateFormat.yMEd().add_jms().format(DateTime.now());
    nota.value.totalOrder = TransactionState.totalOrder.value.toString();
    nota.value.status = false;
    // nota.value.
    TransactionService.addNota(nota.value);
    namaPelangganController.text = '';
    uangPelangganController.text = '';
    changes.value = 0;
  }

  void calculateChange() {
    changes.value = int.parse(uangPelangganController.text) -
        TransactionState.totalOrder.value;
  }
}
