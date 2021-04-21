import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:riding_app/app/components/appbar/appbar.component.dart';
import 'package:riding_app/config/config_screen.dart';

class Picking extends StatefulWidget {
  @override
  _PickingState createState() => _PickingState();
}

class _PickingState extends State<Picking> {
  final List<DataPicking> _data = [
    DataPicking(title: "Nhà", address: "177 Trung Kính, Yên Hoà, Cầu Giấy, Hà Nội.", icon: Icons.home),
    DataPicking(title: "Trường học", address: "144 Xuân Thuỷ, Dịch Vọng Hậu, Cầu Giấy, Hà Nội.", icon: Icons.school),
    DataPicking(title: "Công ty", address: "15 Xuân Đỉnh, Xuân Đỉnh, Cầu Giấy, Hà Nội.", icon: Icons.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(title: Text("Chọn điểm đi/đến")),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Hero(
              tag: "picking",
              child: Card(
                margin: EdgeInsets.all(15),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 2),
                        child: FormBuilderTextField(
                          name: 'departure',
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.emoji_people, color: Colors.black), hintText: "Chọn điểm đi/đến", border: InputBorder.none),
                        ),
                      ),
                      ..._data.map((e) => ListTile(
                            title: Text("${e.title}"),
                            subtitle: Text("${e.address}"),
                            leading: Icon(e.icon),
                            onTap: () => Navigator.pop<DataPicking>(context, e),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataPicking {
  String title;
  String address;
  IconData icon;

  DataPicking({required this.title, required this.address, required this.icon});
}
