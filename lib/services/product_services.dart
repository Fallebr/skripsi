import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:reports/models/products.dart';

class ProductService {
  Future<List<Product>> getProducts(String kategori) async {
    await Firebase.initializeApp();
    final Query productsQuery = FirebaseFirestore.instance
        .collection('products')
        .where('kategori', isEqualTo: kategori);
    List<Product> productsList = [];
    await productsQuery.get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        var encodedResult = jsonEncode(result.data());
        productsList.add(
          Product.fromJson(jsonDecode(encodedResult), result.id),
        );
      }
    });
    return productsList;
  }
}
