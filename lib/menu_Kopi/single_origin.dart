import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/kasir/kasir2.dart';
import '../kasir/transaction_state.dart';
import '../models/order.dart';
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
  tipeService? service;

  @override
  void initState() {
    service = tipeService();
    initialize();
    super.initState();
  }

  Future initialize() async {
    products = [];
    products = await service?.getProducts('single origin');
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
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SetQty(
                    product: products![position],
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}

class SetQty extends StatelessWidget {
  const SetQty({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    TextEditingController jumlahController = TextEditingController();
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Order order = Order(
          product: product,
          qty: jumlahController.text,
        );
        TransactionState.addOrder(order);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Kasir2(),
          ),
        );
      },
    );
    return AlertDialog(
      backgroundColor: const Color(0xff5ac18e),
      title: const Text(
        'Masukkan Jumlah',
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      content: TextField(
        keyboardType: TextInputType.number,
        controller: jumlahController,
        decoration: const InputDecoration(
          hintText: 'Jumlah',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        okButton,
      ],
    );
  }
}
