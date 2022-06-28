import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import '../kasir/transaction_state.dart';
import '../models/nota.dart';

class TransactionService {
  Future<List<Nota>> getNota() async {
    await Firebase.initializeApp();
    final Query notaQuery =
        FirebaseFirestore.instance.collection('transactions');
    List<Nota> notaList = [];
    await notaQuery.get().then((querySnapshot) {
      TransactionState.totalOrder.value = 0;
      for (var result in querySnapshot.docs) {
        var encodedResult = jsonEncode(result.data());
        print(encodedResult);
        Nota nota = Nota.fromJson(jsonDecode(encodedResult), result.id);
        notaList.add(nota);
        TransactionState.totalPerDay(int.parse(nota.totalOrder!));
      }
    });
    return notaList;
  }

  Future<List<Nota>> getNotaByDate() async {
    var dateStart = DateTime.utc(2022, 5, 5);
    await Firebase.initializeApp();
    final Query notaQuery = FirebaseFirestore.instance
        .collection('transactions')
        .where('tanggal', isGreaterThanOrEqualTo: dateStart);
    List<Nota> notaList = [];
    await notaQuery.get().then((querySnapshot) {
      debugPrint('nota by date');
      for (var result in querySnapshot.docs) {
        // var encodedResult = jsonEncode(result.data());
        // print(encodedResult);
        // notaList.add(
        //   Nota.fromJson(jsonDecode(result.data()), result.id),
        // );
      }
      debugPrint('nota by date');
    });
    return notaList;
  }

  static void addNota(Nota nota) async {
    await Firebase.initializeApp();
    await FirebaseFirestore.instance
        .collection('transactions')
        .add(nota.toJson())
        .then((value) => print('success'));
    TransactionState.cleanOrder();
  }

  static void updateStatusNota(Nota nota) async {
    DocumentReference threadDocument =
        FirebaseFirestore.instance.collection('transactions').doc(nota.id);
    print(nota.id);
    print("pppp");
    Map<String, dynamic> data = <String, dynamic>{
      "status": true,
    };
    await threadDocument
        .update(data)
        .whenComplete(() => print("Note thread updated in the database"))
        .catchError((e) => print(e));
  }
}
