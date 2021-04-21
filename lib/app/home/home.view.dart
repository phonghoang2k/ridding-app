import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:riding_app/app/home/navbar.view.dart';
import 'package:riding_app/config/config_screen.dart';
import 'package:riding_app/themes/style.dart';

import 'component/home_body.component.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      // backgroundColor: Color(0xFFD2F2FF),
      // drawer: buildDrawer(),
      appBar: buildAppBar(),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  AppBar buildAppBar() => AppBar(
        title: Text('Trang chủ'),
      );

  Widget buildDrawer() => SizedBox(
        width: SizeConfig.safeBlockHorizontal * 45,
        child: Drawer(
          child: Container(
            color: AppColor.accentColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: SizeConfig.safeBlockVertical * 26,
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 5, horizontal: SizeConfig.safeBlockHorizontal * 4),
                  alignment: Alignment.bottomLeft,
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            child: Container(
                              child: Image.network('https://picsum.photos/250?image=9'),
                            ),
                            backgroundColor: Colors.white,
                            radius: 30),
                        SizedBox(height: SizeConfig.safeBlockVertical),
                        Text("Tran Thu Trang", style: TextStyle(color: AppColor.white, fontSize: 13))
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 1, height: 1, color: AppColor.white),
                SizedBox(height: SizeConfig.safeBlockVertical * 4),
                ListTile(
                  title: Text('Statistic', style: TextStyle(color: AppColor.white), textAlign: TextAlign.center),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Settings', style: TextStyle(color: AppColor.white), textAlign: TextAlign.center),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildBody() => Container(
        child: Body(),
      );
}
