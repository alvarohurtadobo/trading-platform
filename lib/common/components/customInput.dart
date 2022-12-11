import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget customInput(String hint) {
  return Container(
    width: Sizes.width - 2 * Sizes.padding,
    height: Sizes.tileBig,
    padding: EdgeInsets.symmetric(horizontal: Sizes.padding/4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
          Radius.circular(Sizes.radius)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: TextField(
      maxLines: 4,
      decoration:
          InputDecoration(hintText: hint, hintStyle: TextStyle(fontSize: Sizes.font12),border: InputBorder.none),
    ),
  );
}
