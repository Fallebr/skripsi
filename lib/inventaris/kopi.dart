import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/menu_kopi/brew.dart';
import 'package:reports/menu_kopi/esp.dart';
import 'package:reports/menu_kopi/single_origin.dart';
import '../models/products.dart';
import '../services/product_services.dart';

class Kopi extends StatefulWidget {
  const Kopi({Key? key}) : super(key: key);

  @override
  State<Kopi> createState() => _KopiState();
}

class _KopiState extends State<Kopi> {
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
      appBar: AppBar(
        title: Text("Cek Stok Kopi"),
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
        //     title: new Text("Strawberry Frappucino"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Chocolate"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Macha Latte"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Oreo"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Red Velvet"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Vanilla"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Mocca"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Choco Chezze"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Lemon Tea"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Tarik Tea"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Jasmine Tea"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Lyche Tea"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Lemon Squash"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Lyche Squash"),
        //     onTap: () {},
        //   ),
        // ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
