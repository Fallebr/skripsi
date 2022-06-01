import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';

import '../models/products.dart';
import '../services/product_services.dart';

class Brew extends StatefulWidget {
  const Brew({Key? key}) : super(key: key);

  @override
  State<Brew> createState() => _BrewState();
}

class _BrewState extends State<Brew> {
  int? productsCount;
  List<Product>? products;
  tipeService? service;

  @override
  void initState() {
    service = tipeService();
    initialize();
    super.initState();
  }

  Future initialize() async {
    products = [];
    products = await service?.getProducts('brew');
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
        title: const Text("Brew Metode"),
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
        // children: <Widget>[
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Tubruk"),
        //     subtitle: new Text("Rp. 10.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Mokapot"),
        //     subtitle: new Text("Rp. 12.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("French Press"),
        //     subtitle: new Text("Rp. 10.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Vietnam Drips"),
        //     subtitle: new Text("Rp. 14.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("V60"),
        //     subtitle: new Text("Rp. 14.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Syphon"),
        //     subtitle: new Text("Rp. 18.000,00"),
        //     onTap: () {},
        //   ),
        //   new ListTile(
        //     leading: new Icon(Icons.arrow_right),
        //     title: new Text("Aero Press"),
        //     subtitle: new Text("Rp. 13.000,00"),
        //     onTap: () {},
        //   ),
        // ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
