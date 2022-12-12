import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget chatItem(String message, DateTime datetime,
    {bool sent = false, bool placeholder = false}) {
  if (placeholder) {
    return Expanded(
        child: Center(
      child: Text(datetime.toIso8601String().substring(0, 10)),
    ));
  }
  return Container(
    width: Sizes.width,
    padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
    alignment: sent ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      width: Sizes.width * 0.65,
      // height: Sizes.tileMedium,
      margin: EdgeInsets.symmetric(vertical: Sizes.padding / 4),
      padding: EdgeInsets.symmetric(
          horizontal: Sizes.padding / 2, vertical: Sizes.padding / 4),
      decoration: BoxDecoration(
          color: const Color(0xffE7E7E7),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Sizes.radius),
            bottomRight: Radius.circular(Sizes.radius),
            topRight: Radius.circular(sent ? 0 : Sizes.radius),
            topLeft: Radius.circular(sent ? Sizes.radius : 0),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            message,
            style: TextStyle(
                color: const Color(0xff575454), fontSize: Sizes.font08),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Text(
              datetime.toIso8601String().substring(11, 16),
              style: TextStyle(
                  color: const Color(0xff444444), fontSize: Sizes.font14),
            ),
          )
        ],
      ),
    ),
  );
}
