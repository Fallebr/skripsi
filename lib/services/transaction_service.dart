import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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
          Nota.fromJson(jsonDecode(encodedResult)),
        );
      }
    });
    return notaList;
  }

  static void addNota(Nota nota) async {
    await Firebase.initializeApp();
    // String dummy = """
    //       {
    //         "total":"150000",
    //         "orders":
    //         [
    //           {
    //             "product":{"nama":"americano","harga":3000},
    //             "qty":"3"
    //           },
    //           {
    //             "product":{"nama":"french fries","harga":5000},
    //             "qty":"1"
    //           }
    //         ],
    //         "tanggal":"03-06-2022",
    //         "pelanggan":"kkk"
    //       }
    //     """;
    await FirebaseFirestore.instance
        .collection('transactions')
        .add(nota.toJson())
        .then((value) => print('success'));
  }
}
