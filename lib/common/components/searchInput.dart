import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget searchInput(String hintText) {
  return Container(
    width: Sizes.width / 2,
    height: Sizes.tileNormal * 0.9,
    padding: EdgeInsets.only(left: Sizes.padding / 2),
    decoration: BoxDecoration(
      color: const Color(0xff9ECCF2),
      borderRadius: BorderRadius.all(Radius.circular(Sizes.tileNormal / 2)),
    ),
    child: TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintStyle: const TextStyle(color: Color(0xff4E8ED0))),
    ),
  );
}
