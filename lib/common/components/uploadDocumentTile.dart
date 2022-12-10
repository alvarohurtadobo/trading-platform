import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget uploadDocumentTile(bool value, String documentName) {
  return SizedBox(
      width: Sizes.width - 2 * Sizes.padding,
      height: Sizes.tileSmall,
      child: Row(
        children: [
          Checkbox(value: value, shape: const CircleBorder(), onChanged: null),
          Text(documentName, style: TextStyle(fontSize: Sizes.font12),),
          const Expanded(child: SizedBox()),
          Container(
            width: Sizes.tileSmall * 1.2,
            height: Sizes.tileSmall,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(Sizes.radius)),
                border: Border.all(color: const Color(0xff75B1E5))),
            child: Text(
              "+",
              style: TextStyle(
                fontSize: Sizes.font08,
                color: const Color(0xff75B1E5),
              ),
            ),
          )
        ],
      ));
}
