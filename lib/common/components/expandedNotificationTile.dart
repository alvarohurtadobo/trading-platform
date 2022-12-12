import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/trade/model/notification.dart';

Widget expandedNotificationTile(CustomNotification notification) {
  Color textColor = const Color(0xffBFBFBF);
  bool special = notification.backgroundColor != Colors.white;
  if (special) {
    textColor = const Color(0xff555555);
  }
  return Container(
    width: Sizes.width,
    height: Sizes.tileMedium,
    padding: EdgeInsets.symmetric(
        horizontal: Sizes.padding, vertical: Sizes.padding / 4),
    margin: EdgeInsets.only(
        bottom: Sizes.boxSeparation, left: Sizes.padding, right: Sizes.padding),
    decoration: BoxDecoration(
        color: notification.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(Sizes.radius))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: TextStyle(color: textColor, fontSize: Sizes.font08, fontWeight: FontWeight.bold),
              ),
              Text(
                notification.message,
                maxLines: 2,
                style: TextStyle(
                    color: const Color(0xff555555), fontSize: Sizes.font14),
              )
            ],
          ),
        ),
        SizedBox(
            width: Sizes.width / 10,
            child: special
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        notification.code,
                        style: TextStyle(
                            color: const Color(0xff555555),
                            fontSize: Sizes.font12,
                            fontWeight: FontWeight.bold),
                      ),
                      notification.canDelete
                          ? const Icon(
                              Icons.close_outlined,
                              color: Colors.red,
                            )
                          : Container()
                    ],
                  )),
      ],
    ),
  );
}
