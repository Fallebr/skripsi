import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import '../models/products.dart';
import '../services/product_services.dart';

class Aldap extends StatefulWidget {
  const Aldap({Key? key}) : super(key: key);

  @override
  State<Aldap> createState() => AldapState();
}

class AldapState extends State<Aldap> {
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
    products = await service?.getProducts('alat dapur');
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
        title: Text("Cek Keperluan Dapur"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("sendok"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("garpu"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("piring kaca"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("mangkuk"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("piring kecil"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("piring kecil plastik"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("cawan"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("gunting"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("pisau"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("tisue"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("saus"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("sambal"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("garam"),
            onTap: () {},
          ),
          new ListTile(
            leading: new Icon(Icons.arrow_right),
            title: new Text("bahan dapur"),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
