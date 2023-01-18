import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/model/name.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/customDropdown.dart';
import 'package:project_trading/common/components/ordersDropdown.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';

Widget searchWidget(
    BuildContext context,
    bool seeAll,
    int orderTypeSelected,
    bool order,
    bool process,
    bool finished,
    bool verified,
    int? currentOrderType,
    int? currentOrder,
    VoidCallback setstate) {
  return SizedBox(
      width: Sizes.width,
      height: Sizes.height,
      child: SingleChildScrollView(
          child: Column(children: [
        const Text(
          "Ordenes de compra",
          style:
              TextStyle(color: Color(0xff103E6E), fontWeight: FontWeight.bold),
        ),
        verticalSpace(),
        const Text("Busca segun el incoterm seleccionado"),
        verticalSpace(),
        customDropdown(currentOrderType, orderTypes, (value) {
          currentOrderType = value;
          setstate();
        }),
        verticalSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: Checkbox(
                  value: orderTypeSelected == 0,
                  shape: const CircleBorder(),
                  onChanged: (value) {
                    if (value!) {
                      orderTypeSelected = 0;
                    }
                    setstate();
                  }),
            ),
            const Text("EXW"),
            horizontalSpace(2),
            Checkbox(
                value: orderTypeSelected == 1,
                shape: const CircleBorder(),
                onChanged: (value) {
                  if (value!) {
                    orderTypeSelected = 1;
                  }
                  setstate();
                }),
            const Text("FOB"),
            horizontalSpace(2),
            Checkbox(
                value: orderTypeSelected == 2,
                shape: const CircleBorder(),
                onChanged: (value) {
                  if (value!) {
                    orderTypeSelected = 2;
                  }
                  setstate();
                }),
            const Text("CIF"),
          ],
        ),
        verticalSpace(),
        ordersDropdown(context, currentOrder, orders),
      ])));
}
