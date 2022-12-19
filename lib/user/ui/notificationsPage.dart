import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/model/name.dart';
import 'package:project_trading/trade/model/notification.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/chipDropdown.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';
import 'package:project_trading/common/components/expandedNotificationTile.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 0;
  int? selectedDay;
  int? selectedMonth;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);

    List<Widget> notificationWidgets = [verticalSpace()];
    notificationWidgets
        .addAll(customNotifications.map((e) => expandedNotificationTile(e)));

    return Scaffold(
      appBar: myAppBar(context),
      backgroundColor: Colors.white,
      body: SizedBox(
          width: Sizes.width,
          height: Sizes.height,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                  setState(() {
                    selectedMonth = value;
                  });
                }),
                horizontalSpace(),
                chipDropdown(selectedDay, days, "DÍA", (value) {
                  setState(() {
                    selectedDay = value;
                  });
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
