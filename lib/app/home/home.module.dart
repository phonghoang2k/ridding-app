import 'package:flutter_modular/flutter_modular.dart';
import 'package:riding_app/app/home/home.view.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => HomeWidget()),
  ];
}
