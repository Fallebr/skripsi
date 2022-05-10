import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reports/main.dart';
import 'package:reports/model/navigation_model.dart';
import 'package:reports/model/navigation_model.dart';
import 'package:reports/theme.dart';
import 'collapsing_list_tile.dart';
import 'package:reports/login/login.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 70;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: drawerBackgroundColor,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          CollapsingListTile(title: 'Admin', icon: Icons.person),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, counter) {
                return CollapsingListTile(
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon);
              },
              itemCount: navigationItems.length,
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Color(0xff5ac18e),
                      title: Text(
                        'INFORMASI',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        'Apakah anda yakin ingin Log Out?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      actions: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black87),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 35, left: 35, top: 10, bottom: 10),
                                child: Text(
                                  'NO',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black87),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 35, left: 35, top: 10, bottom: 10),
                                child: Text(
                                  'YES',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    );
                  });
            },
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 50.0,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
