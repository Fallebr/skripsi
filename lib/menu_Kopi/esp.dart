import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

import '../models/products.dart';
import '../services/product_services.dart';

class Espresso extends StatefulWidget {
  const Espresso({Key? key}) : super(key: key);

  @override
  State<Espresso> createState() => _EspressoState();
}

class _EspressoState extends State<Espresso> {
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
        title: Text("Espresso Based"),
        backgroundColor: const Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView.builder(
        itemCount: (productsCount == null) ? 0 : productsCount,
        itemBuilder: (context, int position) {
          return ListTile(
            leading: const Icon(Icons.arrow_right),
            title: Text(products![position].nama!),
            subtitle: Text(products![position].harga!.toString()),
            onTap: () {},
          );
        },
        //   children: <Widget>[
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Espresso"),
        //       subtitle: new Text("Rp. 9.000,00"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Machiato"),
        //       subtitle: new Text("Rp. 12.000,00"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("SKLP"),
        //       subtitle: new Text("Rp. 18.000,00"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Cappucino"),
        //       subtitle: new Text("Rp. 19.000,00"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Mochacino"),
        //       subtitle: new Text("Rp. 18.000,00"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Dopio"),
        //       subtitle: new Text("Rp. 13.000,00"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Americano"),
        //       subtitle: new Text("Rp. 13.000,00"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Americasu"),
        //       subtitle: new Text("Rp. 15.000,00"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Affogato"),
        //       subtitle: new Text("Rp. 18.000,00"),
        //       onTap: () {},
        //     ),
        //   ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
