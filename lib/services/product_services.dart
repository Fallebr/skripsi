import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reports/models/products.dart';

class ProductService {
  final Query productsQuery = FirebaseFirestore.instance
      .collection('products')
      .orderBy('date', descending: true);

  final CollectionReference productsCollections =
      FirebaseFirestore.instance.collection('products');

  final CollectionReference ownProductsCollections =
      FirebaseFirestore.instance.collection('products');

  Future<List> getProducts() async {
    List productsList = [];
    await productsQuery.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        productsList.add(Product.fromJson(result.data()));
      });
    });
    return productsList;
  }

  Future<List> getOwnProducts(String uid) async {
    List productsList = [];
    await ownProductsCollections
        .where('uid', isEqualTo: uid)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        productsList.add(Product.fromJson(result.data(), result.id));
      });
    });
    return productsList;
  }

  Future<void> addProduct(Product thread) async {
    await productsCollections
        .add(thread.toJson())
        .then((value) => print("Product Added"))
        .catchError((error) => print("Failed to add thread: $error"));
  }

  Future<void> updateProduct(Product thread) async {
    DocumentReference threadDocument =
        FirebaseFirestore.instance.collection('products').doc(thread.id);
    print(thread.id);
    Map<String, dynamic> data = <String, dynamic>{
      "title": thread.title,
      "content": thread.content,
    };
    await threadDocument
        .update(data)
        .whenComplete(() => print("Note thread updated in the database"))
        .catchError((e) => print(e));
  }

  Future<void> deleteProduct(String id) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('products').doc(id);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note thread deleted from the database'))
        .catchError((e) => print(e));
  }
}
