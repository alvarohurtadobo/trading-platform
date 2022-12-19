import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(child: Image.asset("assets/icons/back.png"), onTap: (){
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
