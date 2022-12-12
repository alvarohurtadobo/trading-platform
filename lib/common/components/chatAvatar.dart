import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget chatAvatar(int count) {
  return Container(
      width: Sizes.tileMedium,
      height: Sizes.tileMedium,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.tileMedium / 2)),
          image: const DecorationImage(
            image: AssetImage("assets/demo/chat.png"),
          )),
      child: count == 0
          ? Container()
          : Container(
              width: Sizes.bullet,
              height: Sizes.bullet,
              alignment: Alignment.center,
              margin: EdgeInsets.all(Sizes.bullet / 2),
              decoration: BoxDecoration(
                color: const Color(0xff32CF45),
                borderRadius:
                    BorderRadius.all(Radius.circular(Sizes.bullet / 2)),
              ),
              child: Text(
                count.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.font10,
                    fontWeight: FontWeight.bold),
              ),
            ));
}
