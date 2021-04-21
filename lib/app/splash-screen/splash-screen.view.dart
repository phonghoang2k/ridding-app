import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:riding_app/app/app.module.dart';
import 'package:riding_app/app/components/loading-dots/loading-dots.component.dart';
import 'package:riding_app/config/config_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<Timer> startTime() async => Timer(Duration(milliseconds: 1500), navigationPage);

  void navigationPage() => Modular.to.pushReplacementNamed(AppModule.home);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: LoadingDots(numberDots: 5),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
