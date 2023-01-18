import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

AppBar myAppBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(child: Image.asset("assets/icons/back.png", height: Sizes.tileNormal,), onTap: (){
      Navigator.of(context).pop();
    },),
    leadingWidth: 30 + 30,
    title: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 60),
        child: Image.asset("assets/images/titleAppBar.png")),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
