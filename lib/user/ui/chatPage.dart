import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/user/model/chatItem.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/components/chatItem.dart';
import 'package:project_trading/common/components/chatAvatar.dart';
import 'package:project_trading/common/components/chatAppBar.dart';
import 'package:project_trading/common/components/chatInputField.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _selectedIndex = 0;
  int? selectedDay;
  int? selectedMonth;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);

    return Scaffold(
      appBar: chatAppBar(context),
      backgroundColor: Colors.white,
      body: SizedBox(
          width: Sizes.width,
          height: Sizes.height,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              width: Sizes.width,
              height: Sizes.tileBig,
              alignment: Alignment.centerLeft,
              color: const Color(0xffB4D8F5),
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  chatAvatar(0),
                  horizontalSpace(),
                  Text(
                    currentChatName,
                    style: const TextStyle(
                        color: Color(0xff4C93D9), fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView(
              scrollDirection: Axis.vertical,
              reverse: true,
              children: myChatItems.reversed
                  .map((e) => chatItem(e.message, e.datetime!,
                      sent: e.sent!, placeholder: e.placeholder))
                  .toList(),
            )),
            chatInputField((message) {
              setState(() {
                myChatItems.add(ChatItem(message, sent: true));
              });
            })
          ])),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color(0xff3075B6),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color(0xff3075B6),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff3075B6),
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff3075B6),
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff3075B6),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff3075B6),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
