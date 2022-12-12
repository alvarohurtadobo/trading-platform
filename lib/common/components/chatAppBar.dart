import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

AppBar chatAppBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      child: Image.asset("assets/icons/back.png"),
      onTap: () {
        Navigator.of(context).pop();
      },
    ),
    leadingWidth: 30 + 30,
    actions: [
      Container(
        width: Sizes.tileMini,
        height: Sizes.tileMini,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: Sizes.padding, vertical: Sizes.padding/2.6),
        decoration: BoxDecoration(
            color: const Color(0xffB1D4F2),
            borderRadius: BorderRadius.all(Radius.circular(Sizes.tileMini/2))),
        child:  Text(
          "+",
          style: TextStyle(color: Colors.white, fontSize: Sizes.font08),
        ),
      )
    ],
    title: Text(
      "Chat",
      style: TextStyle(fontSize: Sizes.font06, fontWeight: FontWeight.bold, color: const Color(0xff4E8ED0)),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
