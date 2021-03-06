import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:reports/models/products.dart';

import '../models/nota.dart';

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
        print(encodedResult);
        productsList.add(
          Product.fromJson(jsonDecode(encodedResult), result.id),
        );
      }
    });
    return productsList;
  }

  static Future<List<Product>> getProductsByTipe(String tipe) async {
    await Firebase.initializeApp();
    final Query productsQuery = FirebaseFirestore.instance
        .collection('products')
        .where('tipe', isEqualTo: tipe);
    List<Product> productList = [];
    await productsQuery.get().then((QuerySnapshot) {
      for (var result in QuerySnapshot.docs) {
        var encodedResult = jsonEncode(result.data());
        productList.add(Product.fromJson(jsonDecode(encodedResult), result.id));
      }
    });
    return productList;
  }

  static Future<List<Product>> getProductsByKategori(String kategori) async {
    await Firebase.initializeApp();
    final Query productsQuery = FirebaseFirestore.instance
        .collection('products')
        .where('kategori', isEqualTo: kategori);
    List<Product> productsList = [];
    await productsQuery.get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        var encodedResult = jsonEncode(result.data());
        print(encodedResult);
        productsList.add(
          Product.fromJson(jsonDecode(encodedResult), result.id),
        );
      }
    });
    return productsList;
  }
}

class tipeService {
  Future<List<Product>> getProducts(String tipe) async {
    await Firebase.initializeApp();
    final Query productsQuery = FirebaseFirestore.instance
        .collection('products')
        .where('tipe', isEqualTo: tipe);
    List<Product> productList = [];
    await productsQuery.get().then((QuerySnapshot) {
      for (var result in QuerySnapshot.docs) {
        var encodedResult = jsonEncode(result.data());
        productList.add(Product.fromJson(jsonDecode(encodedResult), result.id));
      }
    });
    return productList;
  }
}
