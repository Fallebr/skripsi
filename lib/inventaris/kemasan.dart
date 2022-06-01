import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import '../models/products.dart';
import '../services/product_services.dart';

class Kemasan extends StatefulWidget {
  const Kemasan({Key? key}) : super(key: key);

  @override
  State<Kemasan> createState() => _KemasanState();
}

class _KemasanState extends State<Kemasan> {
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
    products = await service?.getProducts('kemasan');
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
      appBar: AppBar(
        title: Text("Cek Kemasan"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView.builder(
        itemCount: (productsCount == null) ? 0 : productsCount,
        itemBuilder: (context, int position) {
          return ListTile(
            leading: const Icon(Icons.arrow_right),
            title: Text(products![position].nama!),
            onTap: () {},
          );
        },
        // children: <Widget>[
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("cup kecil"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("cup besar"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("penutup cup"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("sedotan"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("cup holder"),
        //     onTap: () {},
        //   ),
        // ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
