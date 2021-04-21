import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:riding_app/app/home/booking/booking.module.dart';
import 'package:riding_app/app/home/booking/picking/picking.view.dart';
import 'package:riding_app/config/config_screen.dart';
import 'package:riding_app/themes/style.dart';

import '../../app.module.dart';
import '../../components/common-button/common-button.component.dart';
import '../home.module.dart';

class BookingWidget extends StatefulWidget {
  @override
  _BookingWidgetState createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  final controller = MapController(location: LatLng(21.016147, 105.793532));

  String? _departure, _arrival;
  bool _showPriceMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      backgroundColor: Color(0xFFD2F2FF),
      drawer: buildDrawer(),
      appBar: buildAppBar(),
      floatingActionButton: !_showPriceMode
          ? FloatingActionButton(
              onPressed: _gotoDefault,
              tooltip: 'My Location',
              child: Icon(Icons.my_location),
              backgroundColor: Colors.white,
            )
          : null,
    );
  }

  AppBar buildAppBar() => AppBar(
        iconTheme: IconThemeData(color: AppColor.accentColor),
        backgroundColor: Colors.white,
        title: Text("Đặt xe", style: TextStyle(color: Colors.black)),
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
                        CircleAvatar(child: Container(), backgroundColor: Colors.white, radius: 30),
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

  Widget buildBody() => Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onDoubleTap: _onDoubleTap,
            onScaleStart: _onScaleStart,
            onScaleUpdate: _onScaleUpdate,
            onScaleEnd: (details) {
              print("Location: ${controller.center.latitude}, ${controller.center.longitude}");
            },
            child: Stack(
              children: [
                _showPriceMode
                    ? FutureBuilder<bool>(
                        future: Future<bool>.delayed(Duration(seconds: 2), () => true),
                        builder: (context, data) => data.hasData
                            ? Image.asset("assets/images/map.png", width: SizeConfig.screenWidth, fit: BoxFit.fill)
                            : Center(child: CircularProgressIndicator()))
                    : Map(
                        controller: controller,
                        builder: (context, x, y, z) {
                          final url =
                              'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';
                          return CachedNetworkImage(imageUrl: url, fit: BoxFit.cover);
                        },
                      ),
                buildPickListWidget(),
                if (_showPriceMode)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FutureBuilder<bool>(
                      future: Future<bool>.delayed(Duration(seconds: 2), () => true),
                      builder: (context, data) => data.hasData ? buildPriceSelectedWidget() : Container(),
                    ),
                  )
                // Center(child: Icon(Icons.location_pin, color: Colors.red))
              ],
            ),
          )
        ],
      );

  Widget buildPickListWidget() => Hero(
        tag: "picking",
        child: Card(
          margin: EdgeInsets.all(15),
          child: Container(
            height: SizeConfig.safeBlockVertical * 12,
            child: Column(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 2)),
                    onPressed: () => Modular.to.pushNamed<DataPicking>(AppModule.home + HomeModule.booking + BookingModule.picking).then((value) {
                      setState(() {
                        _departure = value?.address;
                        setPickingPrice();
                      });
                    }),
                    child: Row(
                      children: [
                        Icon(Icons.emoji_people, color: Colors.black),
                        SizedBox(width: SizeConfig.safeBlockHorizontal),
                        Expanded(
                            child: Text(_departure ?? "Chọn điểm đi",
                                style: TextStyle(color: Colors.black), overflow: TextOverflow.ellipsis, maxLines: 1)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 2)),
                    onPressed: () => Modular.to.pushNamed<DataPicking>(AppModule.home + HomeModule.booking + BookingModule.picking).then((value) {
                      setState(() {
                        _arrival = value?.address;
                        setPickingPrice();
                      });
                    }),
                    child: Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: SizeConfig.safeBlockHorizontal),
                        Expanded(
                            child: Text(_arrival ?? "Chọn điểm đến",
                                style: TextStyle(color: Colors.black), overflow: TextOverflow.ellipsis, maxLines: 1)),
                        IconButton(icon: Icon(Icons.add), onPressed: () {})
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildPriceSelectedWidget() => Container(
        margin: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockVertical * 2),
        child: CommonButton(
          onPressed: () => Modular.to.pushNamed(AppModule.home + HomeModule.booking + BookingModule.paying, arguments: [_departure, _arrival]),
          child: Text("Tiếp tục", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.amber,
        ),
      );

  void setPickingPrice() => _showPriceMode = (_departure != null && _arrival != null);

  void _gotoDefault() => controller.center = LatLng(21.016147, 105.793532);

  void _onDoubleTap() => controller.zoom += 0.5;

  late Offset _dragStart;
  double _scaleStart = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart;
      _dragStart = now;
      controller.drag(diff.dx, diff.dy);
    }
  }
}
