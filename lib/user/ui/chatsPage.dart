import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/user/model/chatPreview.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/components/chatTile.dart';
import 'package:project_trading/common/components/chatAppBar.dart';
import 'package:project_trading/common/components/searchInput.dart';
import 'package:project_trading/common/components/verticalSpac.dart';

class ChatsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
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
            searchInput("Javier"),
            verticalSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customButton(context, "Llamadas", () {}),
                customButton(context, "Mensajes", () {},
                    backgroundColor: const Color(0xffB4D8F5))
              ],
            ),
            verticalSpace(2),
            Expanded(
                child: ListView(
              children: myChats.map((e) => chatTile(context, e)).toList(),
            )),
            verticalSpace(3),
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
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed("/home");
        break;
      case 1:
        Navigator.of(context).pushNamed("/notifications");
        break;
      case 2:
        Navigator.of(context).pushNamed("/orders");
        break;
      case 3:
        Navigator.of(context).pushNamed("/profile");
        break;
      default:
        Navigator.of(context).pushNamed("/home");
    }
  }
}
