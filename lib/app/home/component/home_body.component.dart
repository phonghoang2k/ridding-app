import 'package:flutter/cupertino.dart';
import 'package:riding_app/app/home/component/categories.component.dart';
import 'package:riding_app/app/home/component/discount_banner.component.dart';
import 'package:riding_app/app/home/component/home_header.component.dart';
import 'package:riding_app/app/home/component/special_offers.component.dart';

import '../../../config/config_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.safeBlockVertical),
            HomeHeader(),
            SizedBox(height: SizeConfig.safeBlockVertical),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: SizeConfig.safeBlockHorizontal * 2),
            // PopularGifts(),
            // SizedBox(height: SizeConfig.safeBlockVertical*30),
          ],
        ),
      ),
    );
  }
}
