import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget notificationTile(String message, String time,
    {bool arrowInsteadOfTime = false, VoidCallback? function}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: Sizes.width - Sizes.padding,
      height: Sizes.tileNormal,
      margin: EdgeInsets.symmetric(horizontal: Sizes.padding),
      padding: EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.radius)),
          border: Border.all(color: const Color(0xffbbbbbb))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 0.65*(Sizes.width - Sizes.padding),
            child: Text(
              message,
              maxLines: 1,
              style:
                  TextStyle(color: const Color(0xff575454), fontSize: Sizes.font12),
            ),
          ),
          arrowInsteadOfTime
              ? const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xff9ECCF2),
                )
              : Text(
                  time,
                  style: TextStyle(
                      color: const Color(0xff575454), fontSize: Sizes.font12),
                ),
        ],
      ),
    ),
  );
}
