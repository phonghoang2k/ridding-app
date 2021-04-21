import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riding_app/app/components/appbar/appbar.component.dart';
import 'package:riding_app/app/components/common-button/common-button.component.dart';
import 'package:riding_app/app/home/booking/booking.module.dart';
import 'package:riding_app/config/config_screen.dart';
import 'package:riding_app/themes/style.dart';

import '../../../app.module.dart';
import '../../home.module.dart';

class FindingRider extends StatefulWidget {
  final List<String> data;

  const FindingRider({required this.data}) : super();

  @override
  _FindingRiderState createState() => _FindingRiderState();
}

class _FindingRiderState extends State<FindingRider> {
  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 3), () => Modular.to.pushNamed(AppModule.home + HomeModule.booking + BookingModule.foundRider, arguments: widget.data));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(title: Text("Tìm tài xế")),
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
                  SvgPicture.asset("assets/images/car-finding.svg", width: SizeConfig.safeBlockHorizontal * 50),
                  Spacer(flex: 2),
                  CupertinoActivityIndicator(),
                  Spacer(),
                  Text("Yêu cầu đang được thực hiện".toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
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
              child: CommonButton(
                onPressed: () => Modular.to.pop(),
                width: SizeConfig.safeBlockHorizontal * 90,
                child: Text("huỷ yêu cầu".toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                backgroundColor: Color(0xFF363F45),
              ),
              margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical),
            ),
          ],
        ),
      );
}
