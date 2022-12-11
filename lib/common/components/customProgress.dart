import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget customProgress(int progress,
    {Color activeColor = const Color(0xff9ECCF2),
    Color inactiveColor = const Color(0xffEBEBEB),
    double? customHeight,
    double? customWidth}) {
  Color textColor = const Color(0xffB0B0B0);
  if (progress > 40) {
    textColor = const Color(0xff26609D);
  }
  customHeight ??= Sizes.tileMini;
  customWidth ??= Sizes.width - 2 * Sizes.padding;

  return Container(
    width: customWidth,
    height: customHeight,
    decoration: BoxDecoration(
        color: inactiveColor,
        borderRadius: BorderRadius.all(Radius.circular(customHeight / 2))),
    child: Stack(children: [
      Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: progress / 100 * customWidth,
            height: customHeight,
            decoration: BoxDecoration(
                color: activeColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(customHeight / 2))),
          )),
      Center(
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
