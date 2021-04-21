import 'package:flutter_modular/flutter_modular.dart';
import 'package:riding_app/app/home/booking/booking.view.dart';
import 'package:riding_app/app/home/booking/finding-rider/finding-rider.view.dart';
import 'package:riding_app/app/home/booking/paying/paying.view.dart';
import 'package:riding_app/app/home/booking/picking/picking.view.dart';
import 'package:riding_app/app/home/booking/success/success.view.dart';

class BookingModule extends Module {
  static String picking = "/picking";
  static String paying = "/paying";
  static String findingRider = "/findingRider";
  static String foundRider = "/foundRider";
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => BookingWidget()),
    ChildRoute<DataPicking>(picking, child: (context, args) => Picking(), transition: TransitionType.downToUp),
    ChildRoute(paying,
        child: (context, args) => PayingScreen(data: (args.data as List).map((e) => "$e").toList()), transition: TransitionType.rightToLeftWithFade),
    ChildRoute(findingRider,
        child: (context, args) => FindingRider(data: (args.data as List).map((e) => "$e").toList()), transition: TransitionType.rightToLeftWithFade),
    ChildRoute(foundRider, child: (context, args) => SuccessFinding(data: (args.data as List).map((e) => "$e").toList()), transition: TransitionType.rightToLeftWithFade),
  ];
}
