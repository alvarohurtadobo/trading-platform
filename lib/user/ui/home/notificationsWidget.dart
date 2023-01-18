import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/model/name.dart';
import 'package:project_trading/trade/model/notification.dart';
import 'package:project_trading/common/components/chipDropdown.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';
import 'package:project_trading/common/components/expandedNotificationTile.dart';

Widget notificationWidget(BuildContext context, int? selectedDay,
    int? selectedMonth, VoidCallback setstate) {
  List<Widget> notificationWidgets = [verticalSpace()];
  notificationWidgets
      .addAll(customNotifications.map((e) => expandedNotificationTile(e)));
  return SizedBox(
      width: Sizes.width,
      height: Sizes.height,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Center(
          child: Text(
            "Notificaciones",
            style: TextStyle(
                color: const Color(0xff4E8ED0),
                fontWeight: FontWeight.bold,
                fontSize: Sizes.font06),
          ),
        ),
        verticalSpace(2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            chipDropdown(selectedMonth, months, "MES", (value) {
              selectedMonth = value;
              setstate();
            }),
            horizontalSpace(),
            chipDropdown(selectedDay, days, "DÍA", (value) {
              selectedDay = value;
              setstate();
            }),
          ],
        ),
        verticalSpace(),
        Expanded(
            child: ListView(
          padding: EdgeInsets.all(0),
          children: notificationWidgets,
        )),
        // verticalSpace(3),
      ]));
}
