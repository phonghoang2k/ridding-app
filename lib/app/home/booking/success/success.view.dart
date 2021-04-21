import 'package:flutter/material.dart';
import 'package:riding_app/app/components/appbar/appbar.component.dart';
import 'package:riding_app/themes/style.dart';

import '../../../../config/config_screen.dart';

class SuccessFinding extends StatefulWidget {
  final List<String> data;

  const SuccessFinding({required this.data}) : super();

  @override
  _SuccessFindingState createState() => _SuccessFindingState();
}

class _SuccessFindingState extends State<SuccessFinding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(title: Text("Đã tìm thấy tài xế")),
      body: buildBody(),
      bottomNavigationBar: buildBottomNav(),
    );
  }

  Widget buildBody() => Container(
        color: Color(0xFFF2F2F4),
        child: Column(
          children: [
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
          ],
        ),
      );

  Widget buildBottomNav() => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 4,
        child: Container(
          height: SizeConfig.safeBlockVertical * 12,
          child: Row(
            children: [
              Container(
                width: SizeConfig.safeBlockHorizontal * 20,
                child: Image.asset("assets/images/manh.png"),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Đặng Văn Mạnh", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
                      Row(
                        children: [
                          ...List.generate(5, (index) => Icon(Icons.star, color: index < 4 ? Colors.amber : Colors.black26, size: 16)),
                          SizedBox(width: 10),
                          Text("4.6", style: TextStyle(color: Colors.black, fontSize: 16))
                        ],
                      ),
                      Text("Vinfast Lux SA 2.0 - Advanced - Black", style: TextStyle(color: Color(0xFF363F45), fontSize: 12))
                    ],
                  ),
                ),
              ),
              Container(
                width: SizeConfig.safeBlockHorizontal * 20,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Đã lên lịch", style: TextStyle(color: Color(0xFF27AA0B))),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: Color(0xFF363F45),
                      child: Icon(Icons.call, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
