import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget chip(String text,
    {Color backgroundColor = const Color(0xff4E8ED0), double width = 60}) {
  return Container(
    width: width,
    height: Sizes.tileMicro,
    alignment: Alignment.center,
    padding: EdgeInsets.only(left: Sizes.padding / 4),
    decoration: BoxDecoration(
      color: const Color(0xff4E8ED0),
      borderRadius: BorderRadius.all(Radius.circular(Sizes.tileSmall / 2)),
    ),
    child: Center(child: Text(text, style: const TextStyle(color: Colors.white))),
  );
}
