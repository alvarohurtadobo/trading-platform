import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

AppBar realtimeAppBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      child: Image.asset("assets/icons/back.png"),
      onTap: () {
        Navigator.of(context).pop();
      },
    ),
    leadingWidth: 30 + 30,
    title: Text(
      "Tiempo real",
      style: TextStyle(fontSize: Sizes.font06, fontWeight: FontWeight.bold, color: const Color(0xff4E8ED0)),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
