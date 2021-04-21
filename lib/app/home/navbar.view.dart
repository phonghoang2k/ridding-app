import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:riding_app/app/transaction/transaction.view.dart';

import 'home.view.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final GlobalKey _bottomNavigationKey = GlobalKey();
  int _index = 0;

  List<Widget> _data = [HomeWidget(), TransactionScreen(), Container()];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: _index,
      height: 50.0,
      items: <Widget>[
        Icon(Icons.home_filled, size: 30),
        Icon(Icons.history, size: 30),
        Icon(Icons.perm_identity, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _index = index;
        });
      },
    );
  }
}
