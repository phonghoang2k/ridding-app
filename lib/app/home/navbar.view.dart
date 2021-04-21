import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:riding_app/app/transaction/transaction.view.dart';

import 'home.view.dart';

class CustomNavBar extends StatelessWidget {
  Widget build(BuildContext context) {
    GlobalKey _bottomNavigationKey = GlobalKey();
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      height: 50.0,
      items: <Widget>[
        Icon(Icons.home_filled, size: 30),
        Icon(Icons.history, size: 30),
        // Icon(Icons.compare_arrows, size: 30),
        // Icon(Icons.call_split, size: 30),
        Icon(Icons.perm_identity, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeWidget()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionScreen()));
            break;
        }
        print(index);
      },
    );
  }
}
