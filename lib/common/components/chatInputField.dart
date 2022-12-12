import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget chatInputField(Function(String) update) {
  TextEditingController myController = TextEditingController();
  return Container(
    width: Sizes.width,
    height: Sizes.tileNormal,
    padding: EdgeInsets.symmetric(horizontal: Sizes.boxSeparation),
    margin: EdgeInsets.symmetric(
        vertical: Sizes.padding / 2, horizontal: Sizes.padding / 4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.radius),
        ),
        border: Border.all(color: const Color(0xff4E8ED0))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: TextField(
              controller: myController,
              onSubmitted: (value) {
                update(value);
                myController.clear();
              },
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            update(myController.text);
            myController.clear();
          },
          child: Container(
              width: Sizes.bullet * 2,
              height: Sizes.bullet * 2,
              decoration: BoxDecoration(
                  color: const Color(0xff4E8ED0),
                  borderRadius:
                      BorderRadius.all(Radius.circular(Sizes.bullet))),
              child: const Icon(
                Icons.send,
                color: Colors.white,
              )),
        )
      ],
    ),
  );
}
