import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/model/name.dart';

Widget customDropdown(
    int? value, List<Name> items, void Function(int?) onChanged) {
  return Container(
    width: Sizes.width - 2*Sizes.padding,
    height: Sizes.tileNormal,
    padding: EdgeInsets.symmetric(horizontal: Sizes.padding/2),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.radius)),
        border: Border.all(color: const Color(0xffcccccc))),
    child: DropdownButton(
      underline: Container(),
        isExpanded: true,
        icon: const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Color(0xff75B1E5),
        ),
        value: value,
        onChanged: onChanged,
        items: items
            .map((e) => DropdownMenuItem(
                  child: Text(e.name),
                  value: e.id,
                ))
            .toList()),
  );
}
