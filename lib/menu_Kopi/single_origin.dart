import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

import '../models/products.dart';
import '../services/product_services.dart';

class Singo extends StatefulWidget {
  const Singo({Key? key}) : super(key: key);

  @override
  State<Singo> createState() => _SingoState();
}

class _SingoState extends State<Singo> {
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
        title: Text("Single Origin"),
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
        //   children: <Widget>[
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Kopi Letek"),
        //       subtitle: new Text("Rp. 7.500,00"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Kopi Letek + susu"),
        //       subtitle: new Text("Rp. 11.500,00"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Tubruk"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Bengkulu"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Kopi Letek Premium"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Toraja"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Aceh Gayo"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Sidikalang"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Lintang"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Bali Kintamani"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Flores Bajawa"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Papua Wamena"),
        //       onTap: () {},
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.arrow_right),
        //       title: new Text("Madailing Sipirok"),
        //       onTap: () {},
        //     ),
        //   ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
