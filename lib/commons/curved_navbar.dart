import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    text: "Home",
                    icon: Icons.home,
                    selected: _selectedIndex == 0,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    }),
                IconBottomBar(
                    text: "Transaksi",
                    icon: Icons.list_alt_outlined,
                    selected: _selectedIndex == 1,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    }),
                IconBottomBar(
                    text: "Inventory",
                    icon: Icons.inventory_2_outlined,
                    selected: _selectedIndex == 2,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    }),
                IconBottomBar(
                    text: "kasir",
                    icon: Icons.money_outlined,
                    selected: _selectedIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    }),
                IconBottomBar(
                    text: "Report",
                    icon: Icons.notifications_outlined,
                    selected: _selectedIndex == 4,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 4;
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
                size: 25, color: selected ? Colors.white : Colors.black26)),
        Text(text,
            style: TextStyle(
                fontSize: 12,
                height: .1,
                color: selected ? Colors.white : Colors.black54))
      ],
    );
  }
}
