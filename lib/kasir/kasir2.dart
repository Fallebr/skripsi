import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/commons/curved_navbar.dart';
import 'package:reports/commons/navigation_drawer_widget.dart';
import 'package:reports/pages/menu.dart';

class Kasir2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Kasir"),
        backgroundColor: Color(0xff5ac18e),
      ),
      drawer: NavigationDrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Masukan Nama Pelanggan',
                fillColor: Color(0xff5ac18e),
              ),
            ),
          ),
          RaisedButton(
            color: Color(0xff5ac18e),
            child: Text("tambahkan pesanan"),
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Menu(),
                ),
              );
            },
          ),
          // new ListView.builder(
          //   itemCount: (productsCount == null) ? 0 : productsCount,
          //   itemBuilder: (context, int position) {
          //     return ListTile(
          //       leading: const Icon(Icons.arrow_right),
          //       title: Text(products![position].nama!),
          //       subtitle: Text(products![position].harga!.toString()),
          //       onTap: () {},
          //     );
          //   },
          // ),
          // ListTile(
          //   title: new Text("Strawberry Frappucino"),
          //   subtitle: Text("Rp. 20.000,00"),
          // ),
          // new ListTile(
          //   title: new Text("Ramen"),
          //   subtitle: Text("Rp. 10.000,00"),
          // ),
          // new ListTile(
          //   title: new Text("SKLP"),
          //   subtitle: Text("Rp. 18.000,00"),
          // ),
          // new ListTile(
          //   title: new Text("Coklat"),
          //   subtitle: Text("Rp. 19.000,00"),
          // ),
          // new ListTile(
          //   title: new Text("Indomie gunung"),
          //   subtitle: Text("Rp. 15.000,00"),
          // ),
          Container(
            child: (Text(
              " Total Pesanan : Rp. 82.000,00",
            )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ]),
            height: 60,
            child: TextField(
              obscureText: true,
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon:
                      Icon(Icons.attach_money, color: Color(0xff5ac18e)),
                  hintText: 'Masukan uang diterima',
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          Container(
            child: RaisedButton(
              color: Color(0xff5ac18e),
              child: Text("Bayar Sekarang"),
              textColor: Colors.white,
              shape: StadiumBorder(),
              onPressed: () {},
            ),
          ),
          new ListTile(
            title: new Text("Uang Kembali: Rp.18.000,00"),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
