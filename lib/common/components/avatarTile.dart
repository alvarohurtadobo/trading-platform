import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget avatarTile() {
  return Container(
    width: Sizes.width - 2 * Sizes.padding,
    height: Sizes.tileBig,
    padding: EdgeInsets.all(Sizes.padding / 4),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffeeeeee)),
        borderRadius: BorderRadius.all(Radius.circular(Sizes.radius))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: Sizes.avatarSide,
            height: Sizes.avatarSide,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/demo/avatar.png")),
                borderRadius:
                    BorderRadius.all(Radius.circular(Sizes.avatarSide / 2)))),
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Sarah!",
                style: TextStyle(
                    color: const Color(0xff4E8ED0),
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.font08),
              ),
              Text(
                "Disfruta tu experiencia con nosotros",
                style: TextStyle(
                    color: const Color(0xff7C7C7C),
                    fontWeight: FontWeight.normal,
                    fontSize: Sizes.font10),
              ),
              Text(
                "PLANIFICADOR",
                style: TextStyle(
                    color: const Color(0xff4E8ED0),
                    fontWeight: FontWeight.normal,
                    fontSize: Sizes.font08),
              ),
            ])
      ],
    ),
  );
}
