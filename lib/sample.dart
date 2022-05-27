import 'package:flutter/material.dart';
import 'package:reports/models/products.dart';

import 'services/product_services.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  int? productsCount;
  List<Product>? products;
  ProductService? service;

  @override
  void initState() {
    service = ProductService();
    initialize();
    super.initState();
  }

  Future initialize() async {
    products = [];
    products = await service?.getProducts('kopi');
    productsCount = products?.length;
    products = products;
    refresh();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 218, 233, 241),
      body: ListView.builder(
        itemCount: (productsCount == null) ? 0 : productsCount,
        itemBuilder: (context, int position) {
          return Column(
            children: [
              Text(products![position].nama!),
            ],
          );
        },
      ),
    );
  }
}
