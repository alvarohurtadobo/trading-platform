import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/user/ui/home/homeExportWidget.dart';
import 'package:project_trading/user/ui/home/homePlannerWidget.dart';
import 'package:project_trading/user/ui/home/notificationsWidget.dart';
import 'package:project_trading/user/ui/home/searchWidget.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;

  const HomePage({super.key, this.initialIndex = 0});
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Notification page
  int? selectedDay;
  int? selectedMonth;

  // Search page
  bool seeAll = false;
  int orderTypeSelected = 0;
  bool order = false;
  bool process = false;
  bool finished = false;
  bool verified = false;

  int? currentOrderType = 1;
  int? currentOrder;

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);

    Widget displayBody = const SizedBox(
      width: 100,
      height: 100,
      child: Text("No widget rendered"),
    );

    switch (_selectedIndex) {
      case 0:
        if (userType == "planificador") {
          displayBody = homePlanner(context);
        } else {
          displayBody = homeExporter(context);
        }
        break;
      case 1:
        displayBody = notificationWidget(
          context,
          selectedDay,
          selectedMonth,
          () {
            setState(() {});
          },
        );
        break;
      case 2:
        displayBody = searchWidget(
          context,
          seeAll,
          orderTypeSelected,
          order,
          process,
          finished,
          verified,
          currentOrderType,
          currentOrder,
          () {
            setState(() {});
          },
        );
        break;
      default:
        displayBody = homePlanner(context);
    }

    return Scaffold(
      appBar: myAppBar(context),
      backgroundColor: Colors.white,
      body: displayBody,
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
    print("Selected item $index");
    setState(() {
      _selectedIndex = index;
    });
  }
}
