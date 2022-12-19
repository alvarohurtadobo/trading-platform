import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget customTextInput(
    BuildContext context, String title, Function(String) setParameter,
    {String hint = "", bool coloured = false}) {
  return Container(
    width: Sizes.width,
    height: Sizes.tileMedium,
    margin: EdgeInsets.symmetric(horizontal: Sizes.padding),
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: coloured ? const Color(0x8f2F2F2F) : Colors.white))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: coloured ? const Color(0xff2B69A6) : Colors.white),
        ),
        TextField(
          onChanged: setParameter,
          style: TextStyle(
              color: coloured ? const Color(0xffA1A1A1) : Colors.white),
          decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              hintStyle: TextStyle(
                  color: coloured ? const Color(0xffA1A1A1) : Colors.white60)),
        )
      ],
    ),
  );
}
