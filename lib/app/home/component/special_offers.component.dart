import 'package:flutter/material.dart';
import 'package:riding_app/app/home/component/section_title.component.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers() : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Ưu đãi tử Ridding",
            press: () {},
          ),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/promotion1.jpeg",
                // category: "",
                // numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/promotion2.jpeg",
                // category: "Fashion",
                // numOfBrands: 24,
                press: () {},
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    required this.image,
    required this.press,
    this.category,
    this.numOfBrands,
  }) : super();

  final String? category;
  final String image;
  final int? numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  width: 242,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 15,
                //     vertical: 10,
                //   ),
                //   child: Text.rich(
                //     TextSpan(
                //       style: TextStyle(color: Colors.white),
                //       children: [
                //         TextSpan(
                //           text: "$category\n",
                //           style: TextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         TextSpan(text: "$numOfBrands Brands")
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
