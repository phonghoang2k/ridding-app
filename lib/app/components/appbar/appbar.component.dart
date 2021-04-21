import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/style.dart';

PreferredSizeWidget staticAppbar(
        {double? height,
        Widget? title,
        List<Widget>? actions,
        Widget? leading,
        PreferredSizeWidget? bottomWidget,
        double? titleSpacing,
        bool? centerTitle}) =>
    AppBar(
      toolbarHeight: height,
      backgroundColor: Colors.amber,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      automaticallyImplyLeading: true,
      leading: leading,
      bottom: bottomWidget,
      titleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      elevation: 0,
    );

class BackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset("assets/images/home/back-button.svg"),
      onPressed: Navigator.of(context).pop,
    );
  }
}
