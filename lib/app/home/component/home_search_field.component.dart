import 'package:flutter/material.dart';

import '../../../config/config_screen.dart';
import '../../../themes/style.dart';

class SearchField extends StatelessWidget {
  const SearchField() : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 80,
      decoration: BoxDecoration(
        color: AppColor.accentColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
