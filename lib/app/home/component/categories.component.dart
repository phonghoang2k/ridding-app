import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app.module.dart';
import '../home.module.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/bike.png", "text": "Đặt xe"},
      {"icon": "assets/icons/food.png", "text": "Đồ ăn"},
      {"icon": "assets/icons/bill.png", "text": "Hóa đơn"},
      {"icon": "assets/icons/giftcard.png", "text": "Ưu đãi"},
    ];
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"].toString(),
            text: categories[index]["text"].toString(),
            press: () => Modular.to.pushNamed(AppModule.home + HomeModule.booking),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.icon, required this.text, required this.press}) : super();

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 60,
        child: Column(
          children: [
            Container(
              height: 55,
              width: 55,
              child: Image.asset(icon, width: 150, height: 150),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
