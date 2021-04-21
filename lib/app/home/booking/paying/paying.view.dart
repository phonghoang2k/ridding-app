import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:riding_app/app/app.module.dart';
import 'package:riding_app/app/components/appbar/appbar.component.dart';
import 'package:riding_app/app/components/common-button/common-button.component.dart';
import 'package:riding_app/app/home/booking/booking.module.dart';
import 'package:riding_app/app/home/home.module.dart';
import 'package:riding_app/config/config_screen.dart';
import 'package:riding_app/themes/style.dart';

import '../../home.module.dart';

class PayingScreen extends StatefulWidget {
  final List<String> data;

  const PayingScreen({required this.data}) : super();

  @override
  _PayingScreenState createState() => _PayingScreenState();
}

class _PayingScreenState extends State<PayingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(title: Text('Thanh toán')),
      body: buildBody(),
    );
  }

  Widget buildBody() => Container(
        color: Color(0xFFF2F2F4),
        child: Column(
          children: [
            Container(
              height: SizeConfig.safeBlockVertical * 30,
              width: SizeConfig.safeBlockHorizontal * 100,
              color: Colors.amber,
              padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical),
              child: Column(
                children: [
                  Spacer(flex: 3),
                  Text("81.000 VND", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
                  Spacer(flex: 2),
                  Text("Thời gian di chuyển dự kiến: 18 phút".toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Container(
              child: Card(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.data.first, style: TextStyle(color: Colors.black)),
                      leading: Icon(Icons.emoji_people, color: Colors.black),
                    ),
                    Divider(height: 2, thickness: 1, indent: 80),
                    ListTile(
                      title: Text(widget.data.last, style: TextStyle(color: Colors.black)),
                      leading: Icon(Icons.location_pin, color: AppColor.accentColor),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              child: Card(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Tiền mặt", style: TextStyle(color: Colors.black)),
                      trailing: TextButton(child: Text("Thay đổi"), onPressed: () {}),
                      leading: Icon(Icons.money, color: Colors.amber),
                    ),
                    Divider(height: 2, thickness: 1),
                    ListTile(
                      title: Text("Mã giảm giá", style: TextStyle(color: Colors.black)),
                      leading: Icon(Icons.point_of_sale, color: Colors.amber),
                      onTap: () {},
                    ),
                    CommonButton(
                      onPressed: () => Modular.to.pushNamed(AppModule.home + HomeModule.booking + BookingModule.findingRider, arguments: widget.data),
                      width: double.infinity,
                      child: Text("xác nhận đặt xe".toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                      backgroundColor: Color(0xFF363F45),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
