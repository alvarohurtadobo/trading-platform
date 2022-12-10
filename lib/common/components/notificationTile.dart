import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget notificationTile(String message, String time) {
  return Container(
    width: Sizes.width - Sizes.padding,
    height: Sizes.tileNormal,
    padding: EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.radius)),
        border: Border.all(color: const Color(0xffbbbbbb))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          message,
          style:
              TextStyle(color: const Color(0xff575454), fontSize: Sizes.font12),
        ),
        Text(
          time,
          style:
              TextStyle(color: const Color(0xff575454), fontSize: Sizes.font12),
        ),
      ],
    ),
  );
}
