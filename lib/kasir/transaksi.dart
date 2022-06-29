import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/kasir/detail_transaksi.dart';
import 'package:reports/kasir/transaction_controller.dart';
import 'package:reports/kasir/transaction_state.dart';
import 'package:reports/models/nota.dart';
import 'package:reports/services/transaction_service.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({Key? key}) : super(key: key);

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  final _controller = Get.put(TransactonController());
  int? notaCount;
  List<Nota>? nota;
  List<Nota>? nota2;
  TransactionService? service;
  int? income;

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  String? startDate;
  String? endDate;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  String? email;

  @override
  void initState() {
    service = TransactionService();
    getCurrentUser();
    // initialize();
    super.initState();
  }

  getCurrentUser() async {
    _user = _auth.currentUser!;
    _controller.emailController.text = _user.email!;
    setState(() {
      email = _user.email!;
    });
    initialize();
  }

  Future initialize() async {
    nota = [];
    nota = await service?.getNota(email);
    notaCount = nota?.length;
    nota = nota;
    refresh();
  }

  Future getNotaFilter(startDate, endDate) async {
    nota = [];
    nota = await service?.getNotaByDate(startDate, endDate, email);
    notaCount = nota?.length;
    nota = nota;
    refresh();
  }

  void refresh() {
    getTotalIncome();
    setState(() {});
  }

  void getTotalIncome() {
    var total = 0;
    for (var i = 0; i < notaCount!; i++) {
      var totalOrder = nota![i].totalOrder;
      total += int.parse(totalOrder!);
      print(total);
    }
    setState(() {
      income = total;
    });
  }

  Future<Null> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    Navigator.pop(context);
    if (picked != null && picked != selectedStartDate)
      setState(() {
        selectedStartDate = picked;
        startDate = DateFormat('dd/MM/yyyy').format(selectedStartDate);
        _modalBottomSheetMenu();
      });
  }

  Future<Null> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedEndDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    Navigator.pop(context);
    if (picked != null && picked != selectedEndDate)
      setState(() {
        selectedEndDate = picked;
        endDate = DateFormat('dd/MM/yyyy').format(selectedEndDate);
        _modalBottomSheetMenu();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Income : Rp. ${income}"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView.builder(
        itemCount: (notaCount == null) ? 0 : notaCount,
        itemBuilder: (context, int position) {
          return ListTile(
            leading: Icon(Icons.arrow_right, size: 40),
            title: Text(
              nota![position].pelanggan!,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              nota![position].tanggal!.toString() +
                  '         ' +
                  'Total : Rp. ' +
                  nota![position].totalOrder.toString(),
              style: TextStyle(fontSize: 20),
            ),
            trailing: (nota![position].status!)
                ? Icon(Icons.check_circle_outline)
                : Icon(Icons.circle_outlined),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailTransaksi(
                  orders: nota![position].orders!,
                  nota: nota![position],
                ),
              ));
            },
            // SizedBox(
            //     height: 50,
            //   ),
          );
        },
      ),
      backgroundColor: Colors.grey[200],
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                _modalBottomSheetMenu();
              },
              label: Icon(
                Icons.filter_alt,
                color: Colors.white,
                size: 40,
              ),
              backgroundColor: Color(0xff5ac18e),
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                notaCount = 0;
                income = 0;
                nota = [];
              });
            },
            label: Icon(
              Icons.restore,
              color: Colors.white,
              size: 40,
            ),
            backgroundColor: Color(0xff5ac18e),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Filter Transaksi:',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => _selectStartDate(context),
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xff5ac18e),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Start Date ',
                            style: TextStyle(color: Colors.white)))),
                Text(' = ${startDate}', style: TextStyle(fontSize: 20)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => _selectEndDate(context),
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Color(0xff5ac18e),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('End Date ',
                            style: TextStyle(color: Colors.white)))),
                Text(' = ${endDate}', style: TextStyle(fontSize: 20)),
              ],
            ),
            InkWell(
              onTap: () {
                getNotaFilter(startDate, endDate);
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff5ac18e),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.filter_alt,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text('Filter', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
