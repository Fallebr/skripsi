import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import '../models/products.dart';
import '../services/product_services.dart';

class NonKopi extends StatefulWidget {
  const NonKopi({Key? key}) : super(key: key);

  @override
  State<NonKopi> createState() => _NonKopiState();
}

class _NonKopiState extends State<NonKopi> {
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
    products = await service?.getProducts('non kopi');
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
        title: Text("MENU"),
        backgroundColor: Color(0xff5ac18e),
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
        // children: <Widget>[
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Strawberry Frappucino"),
        //     subtitle: new Text("Rp. 18.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Chocolate"),
        //     subtitle: new Text("Rp. 19.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Macha Latte"),
        //     subtitle: new Text("Rp. 19.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Oreo"),
        //     subtitle: new Text("Rp. 18.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Red Velvet"),
        //     subtitle: new Text("Rp. 18.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Vanilla"),
        //     subtitle: new Text("Rp. 18.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Mocca"),
        //     subtitle: new Text("Rp. 18.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Choco Chezze"),
        //     subtitle: new Text("Rp. 18.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Lemon Tea"),
        //     subtitle: new Text("Rp. 17.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Tarik Tea"),
        //     subtitle: new Text("Rp. 17.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Jasmine Tea"),
        //     subtitle: new Text("Rp. 9.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Lyche Tea"),
        //     subtitle: new Text("Rp. 18.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Lemon Squash"),
        //     subtitle: new Text("Rp. 18.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Lyche Squash"),
        //     subtitle: new Text("Rp. 20.000,00"),
        //     onTap: () {},
        //   ),
        // ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
