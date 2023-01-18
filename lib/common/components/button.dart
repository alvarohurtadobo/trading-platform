import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget customButton(BuildContext context, String label, VoidCallback onTap,
    {bool active = true,
    Color backgroundColor = Colors.white,
    double customWidth = 0}) {
  Color textColor = const Color(0xff2F70AF);
  if (backgroundColor != Colors.white) {
    textColor = Colors.white;
  }
  if (customWidth == 0) {
    customWidth = Sizes.width * 0.45;
  }
  return Container(
    width: customWidth,
    height: Sizes.tileNormal,
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(Sizes.tileNormal / 2))),
    child: TextButton(
      onPressed: active ? onTap : null,
      child: Text(
        label,
        style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: Sizes.font10),
      ),
    ),
  );
}
