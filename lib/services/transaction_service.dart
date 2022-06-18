import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../kasir/transaction_state.dart';
import '../models/nota.dart';

class TransactionService {
  Future<List<Nota>> getNota() async {
    await Firebase.initializeApp();
    final Query notaQuery =
        FirebaseFirestore.instance.collection('transactions');
    List<Nota> notaList = [];
    await notaQuery.get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        var encodedResult = jsonEncode(result.data());
        print(encodedResult);
        notaList.add(
          Nota.fromJson(jsonDecode(encodedResult), result.id),
        );
      }
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
