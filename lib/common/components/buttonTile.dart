import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';

Widget buttonTile(String assetName, String title,
    {VoidCallback? onTap, bool lightColor = true, int count = 0}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: Sizes.width - 2 * Sizes.padding,
      height: Sizes.tileNormal + Sizes.bullet,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: Sizes.width - 2 * Sizes.padding,
              height: Sizes.tileNormal,
              margin: EdgeInsets.symmetric(vertical: Sizes.bullet / 2),
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
              decoration: BoxDecoration(
                  color: lightColor
                      ? const Color(0xffB4D8F5)
                      : const Color(0xff4E8ED0),
                  borderRadius:
                      BorderRadius.all(Radius.circular(Sizes.radius))),
              child: Row(
                children: [
                  Image.asset("assets/icons/$assetName.png"),
                  horizontalSpace(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          count == 0
              ? Container()
              : Positioned(
                  left: Sizes.width - 2 * Sizes.padding - Sizes.bullet,
                  top: 0,
                  child: Container(
                    width: Sizes.bullet,
                    height: Sizes.bullet,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xffDF0001),
                        borderRadius: BorderRadius.all(
                            Radius.circular(Sizes.bullet / 2))),
                    child: Text(
                      count.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
        ],
      ),
    ),
  );
}
