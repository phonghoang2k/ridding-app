import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(text: "Xin chào\n"),
                TextSpan(
                  text: "Đặng Văn Mạnh",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 50,
          ),
          ClipRRect(
            child: Image.asset(
              'assets/images/avatar.jpeg',
              width: 50,
              height: 50,
            ),
            borderRadius: BorderRadius.circular(180),
          ),
        ],
      ),
    );
  }
}
