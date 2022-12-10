import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/trade/model/incoterm.dart';

Widget incotermIcon(Incoterm myIncoterm) {
  return SizedBox(
      width: Sizes.icon*1.4,
      height: Sizes.icon,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            myIncoterm.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
                fontSize: Sizes.font14, color: const Color(0xff575454)),
          ),
          Text(
            maxLines: 1,
            textAlign: TextAlign.center,
            myIncoterm.code,
            style: TextStyle(
                fontSize: Sizes.font08, color: const Color(0xff575454)),
          ),
          Image.asset("assets/icons/${myIncoterm.assetName}.png")
        ],
      ));
}
