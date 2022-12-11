import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

int date1 = 22;
int date2 = 28;

List<String> myTitles = ["DOM", "LUN", "MAR", "MIE", "JUE", "VIE", "SAB"];
List<int> myList = [
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31
];

Widget calendar({bool small = false}) {
  double side = small ? (0.6 * Sizes.width) : (Sizes.width - 2 * Sizes.padding);
  return Container(
      width: side,
      height: side * 0.92,
      padding: EdgeInsets.all(Sizes.padding / 4),
      decoration: BoxDecoration(
          color: const Color(0xff0D3B79),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.radius))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Sizes.boxSeparation / 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                Text(
                  "OCTUBRE 2022",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.font08,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.arrow_forward_ios, color: Colors.white),
              ],
            ),
          ),
          SizedBox(
            height: Sizes.boxSeparation,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                myTitles.map((e) => titleBullet(e, small: small)).toList(),
          ),
          Wrap(
            children: myList.map((e) => dateBullet(e, small: small)).toList(),
          ),
        ],
      ));
}

Widget titleBullet(String title, {bool small = false}) {
  double parentSide =
      small ? (0.6 * Sizes.width) : (Sizes.width - 2 * Sizes.padding);
  double childSide = (parentSide - Sizes.padding / 2) / 7;
  return SizedBox(
    width: childSide,
    child: Text(
      title, textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: Sizes.font16),
    ),
  );
}

Widget dateBullet(int thisDate, {bool small = false}) {
  double parentSide =
      small ? (0.6 * Sizes.width) : (Sizes.width - 2 * Sizes.padding);
  double childSide = (parentSide - Sizes.padding / 2) / 7;
  Color backgroundColor = Colors.transparent;
  if (thisDate == date1) {
    backgroundColor = const Color(0xffB1D4F2);
  }
  if (thisDate == date2) {
    backgroundColor = const Color(0xff74CF6F);
  }
  return Container(
    width: childSide,
    height: childSide,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(childSide / 2))),
    child: Text(
      thisDate.toString(),
      style: TextStyle(color: Colors.white, fontSize: Sizes.font10),
    ),
  );
}
