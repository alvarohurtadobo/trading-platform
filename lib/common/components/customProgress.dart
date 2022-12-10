import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget customProgress(int progress,
    {Color activeColor = const Color(0xff9ECCF2),
    Color inactiveColor = const Color(0xffEBEBEB)}) {
  Color textColor = const Color(0xffB0B0B0);
  if (progress > 60) {
    textColor = const Color(0xff4E8ED0);
  }
  return Container(
    width: Sizes.width - 2 * Sizes.padding,
    height: Sizes.tileSmall,
    decoration: BoxDecoration(
        color: inactiveColor,
        borderRadius: BorderRadius.all(Radius.circular(Sizes.tileSmall / 2))),
    child: Stack(children: [
      Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: progress / 100 * (Sizes.width - 2 * Sizes.padding),
            height: Sizes.tileSmall,
            decoration: BoxDecoration(
                color: activeColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(Sizes.tileSmall / 2))),
          )),
      Positioned(
          left: (Sizes.width - 2 * Sizes.padding) / 2,
          child: Expanded(
            child: Center(
              child: Text(
                "$progress \%",
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
          ))
    ]),
  );
}
