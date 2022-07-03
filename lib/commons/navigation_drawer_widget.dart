import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/login/logadm.dart';
import 'package:reports/main.dart';
import 'package:reports/pages/kasir.dart';
import 'package:reports/pages/inventaris.dart';
import 'package:reports/pages/report.dart';
import 'package:google_sign_in/google_sign_in.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final Padding = EdgeInsets.symmetric(horizontal: 20);
  // final user = FirebaseAuth.instance.;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xff5ac18e),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 48),
            buildMenuItem(
              text: 'Hello!',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 48),
            buildMenuItem(
              text: 'Kasir',
              icon: Icons.money_outlined,
              onClicked: () => selectedItem(context, 1),
            ),
            // const SizedBox(height: 16),
            // buildMenuItem(
            //   text: 'Inventaris',
            //   icon: Icons.inventory_2_outlined,
            //   onClicked: () => selectedItem(context, 3),
            // ),
            const SizedBox(height: 16),
            Divider(color: Colors.white70),
            const SizedBox(height: 400),
            buildMenuItem(
              text: 'Logout',
              icon: Icons.logout_outlined,
              onClicked: () {
                // Future<void> _signOut() async {
                //   await _auth.signOut();
                // }
                FirebaseAuth.instance.signOut();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LogAdm(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Kasir(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Report(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Inventaris(),
        ));
        break;
    }
  }
}
