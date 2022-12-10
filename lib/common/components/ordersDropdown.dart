import 'package:flutter/material.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/model/name.dart';

Widget ordersDropdown( BuildContext context,
    int? value, List<Name> items) {
  return Container(
    width: Sizes.width - 2*Sizes.padding,
    height: Sizes.tileNormal,
    padding: EdgeInsets.symmetric(horizontal: Sizes.padding/2),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.radius)),
        border: Border.all(color: const Color(0xffcccccc))),
    child: DropdownButton(
      hint: const Text("Ordenes de compras (EXW)"),
      underline: Container(),
        isExpanded: true,
        icon: const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Color(0xff75B1E5),
        ),
        value: value,
        onChanged: (value){
          currentOrder = items.firstWhere((element) => element.id==value).name;
          print("Selected order is $currentOrder");
          Navigator.of(context).pushNamed("/order");
        },
        items: items
            .map((e) => DropdownMenuItem(
                  child: Text(e.name),
                  value: e.id,
                ))
            .toList()),
  );
}
