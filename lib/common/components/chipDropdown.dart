import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/model/name.dart';

Widget chipDropdown(
    int? currentId, List<Name> items, String hint, Function(int?) onChanged) {
  return Container(
    width: Sizes.width / 5.8,
    height: Sizes.tileMicro,
    padding: EdgeInsets.only(left: Sizes.padding / 8),
    decoration: BoxDecoration(
        color: const Color(0xff3075B6),
        borderRadius: BorderRadius.all(Radius.circular(Sizes.radius))),
    child: DropdownButton(
      hint: Center(
          child: Text(
        hint,
        style: const TextStyle(color: Colors.white),
      )),
      iconEnabledColor: Colors.white,
      icon: const Icon(Icons.keyboard_arrow_down),
      underline: Container(),
      selectedItemBuilder: (context) {
        return items
            .map((e) => DropdownMenuItem(
                  child: Container(
                    width: Sizes.width / 12,
                    height: Sizes.tileMicro,
                    decoration: BoxDecoration(color: const Color(0xff3075B6)),
                    child: Text(
                      e.name,
                      maxLines: 1,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  value: e.id,
                ))
            .toList();
      },
      items: items
          .map((e) => DropdownMenuItem(
                child: Text(
                  e.name,
                  maxLines: 1,
                  style: TextStyle(color: const Color(0xff3075B6)),
                ),
                value: e.id,
              ))
          .toList(),
      onChanged: onChanged,
      value: currentId,
    ),
  );
}
