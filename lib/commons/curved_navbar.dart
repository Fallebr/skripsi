import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/kasir/kasir2.dart';
import 'package:reports/kasir/transaksi.dart';
import 'package:reports/pages/home.dart';
import 'package:reports/pages/inventaris.dart';
import 'package:reports/pages/report.dart';

class CurvedNavigationBar extends StatefulWidget {
  @override
  State<CurvedNavigationBar> createState() => _CurvedNavigationBarState();
}

class _CurvedNavigationBarState extends State<CurvedNavigationBar> {
  int _selectedIndex = 0;

  // final screen = [
  //   Center()
  // ]
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff5ac18e),
      ),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                    text: "Transaksi",
                    icon: Icons.list_alt_outlined,
                    selected: _selectedIndex == 1,
                    onPressed: () {
                      setState(
                        () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Transaksi(),
                          ));
                          _selectedIndex = 1;
                        },
                      );
                    }),
                IconBottomBar(
                    text: "Kasir",
                    icon: Icons.money_outlined,
                    selected: _selectedIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Kasir2(),
                        ));
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconBottomBar(
      {required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(icon,
                size: 30, color: selected ? Colors.white : Colors.white)),
        Text(text,
            style: TextStyle(
                fontSize: 25,
                height: .3,
                color: selected ? Colors.white : Colors.white))
      ],
    );
  }
}
