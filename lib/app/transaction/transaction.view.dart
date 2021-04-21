import 'package:flutter/material.dart';
import 'package:riding_app/app/home/navbar.view.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Container(),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
