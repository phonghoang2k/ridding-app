import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../themes/style.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    required this.svgSrc,
    required this.press,
    this.numOfItem = 0,
  }) : super();

  final String? svgSrc;
  final int? numOfItem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: AppColor.accentColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc ?? ""),
          ),
          if (numOfItem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfItem",
                    style: TextStyle(
                      fontSize: 10,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
