import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget wideButton(String iconAssetName, String message, VoidCallback function) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: Sizes.width - Sizes.padding,
      height: Sizes.tileNormal,
      margin: EdgeInsets.symmetric(horizontal: Sizes.padding*1.5),
      padding: EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
      decoration: BoxDecoration(
        color: const Color(0xff4E8ED0),
        borderRadius: BorderRadius.all(Radius.circular(Sizes.radius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(iconAssetName, width: Sizes.padding,),
          SizedBox(
            width: Sizes.boxSeparation,
          ),
          Text(
            message,
            style: TextStyle(color: Colors.white, fontSize: Sizes.font10),
          ),
        ],
      ),
    ),
  );
}
