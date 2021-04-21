import 'package:flutter/material.dart';
import 'package:riding_app/app/home/component/home_search_field.component.dart';
import 'package:riding_app/app/home/component/icon_btn_with_counter.component.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader() : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Cart Icon.svg",
          //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
          // ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfItem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
