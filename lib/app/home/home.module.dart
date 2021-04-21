import 'package:flutter_modular/flutter_modular.dart';
import 'package:riding_app/app/home/booking/booking.module.dart';

import 'home.view.dart';

class HomeModule extends Module {
  static String booking = "/booking";
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => HomeWidget()),
    ModuleRoute(booking, module: BookingModule()),
  ];
}
