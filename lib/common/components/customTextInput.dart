import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget customTextInput(
  BuildContext context,
  String title,
  Function(String) setParameter, {
  String hint = "",
}) {
  return Container(
    width: Sizes.width,
    height: Sizes.tileMedium,
    padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        TextField(
          onChanged: setParameter,
          decoration: InputDecoration(hintText: hint),
        )
      ],
    ),
  );
}
