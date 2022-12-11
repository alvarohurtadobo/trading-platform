import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/customProgress.dart';

Widget logisticTile(String title, String body, int progress,
    {bool active = false}) {
  return Container(
      width: Sizes.width,
      height: Sizes.tileHuge,
      color: active ? const Color(0xffCEE8FD) : Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.padding,
        vertical: Sizes.padding / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: Sizes.font08),
          ),
          Text(body, style: TextStyle(fontSize: Sizes.font14)),
          customProgress(progress,
              customWidth: Sizes.width / 2,
              customHeight: Sizes.tileMini * 0.6,
              activeColor: const Color(0xff4E8ED0))
        ],
      ));
}
