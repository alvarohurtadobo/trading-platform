import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget profileTextInput(TextEditingController controller, {int heightFactor =1 }){
  return Container(
    height: Sizes.tileMicro*1.1*heightFactor,
    width: Sizes.width-4*Sizes.padding,
    padding: EdgeInsets.symmetric(horizontal: Sizes.boxSeparation),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(Sizes.tileNormal/2)),
      color: const Color(0xff3075B6)
    ),
    child: TextField(
      maxLines: heightFactor,
      decoration: const InputDecoration(border: InputBorder.none),
      controller: controller,
      style: const TextStyle(color: Colors.white),
    ),
  );
}