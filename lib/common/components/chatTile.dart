import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/user/model/chatPreview.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/components/chatAvatar.dart';

Widget chatTile(BuildContext context, ChatPreview myPreview) {
  return GestureDetector(
    onTap: () {
      currentChatName = myPreview.name;
      Navigator.of(context).pushNamed("/chat");
    },
    child: Container(
      width: double.infinity,
      height: Sizes.tileHuge,
      margin: EdgeInsets.symmetric(horizontal: Sizes.padding),
      padding:
          EdgeInsets.only(top: Sizes.padding / 4, bottom: Sizes.padding / 3),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0x4f30337A)))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              chatAvatar(myPreview.count),
              Expanded(
                  child: Text(myPreview.name,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: Sizes.font08,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff4C93D9)))),
              Text(myPreview.time,
                  style: TextStyle(
                      fontSize: Sizes.font14, color: const Color(0xff444444)))
            ],
          ),
          Text(
            myPreview.message,
            maxLines: 1,
            style: TextStyle(
                fontSize: Sizes.font12, color: const Color(0xff494949)),
          )
        ],
      ),
    ),
  );
}
