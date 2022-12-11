import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/trade/model/incoterm.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/logisticTile.dart';
import 'package:project_trading/common/components/verticalSpac.dart';

class LogisticsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogisticsPageState();
}

class _LogisticsPageState extends State<LogisticsPage> {
  int _selectedIndex = 0;
  bool seeAll = false;
  bool order = false;
  bool process = false;
  bool finished = false;
  bool verified = false;
  bool fabric = false;

  int? currentOrderType = 10;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);

    List<Incoterm> displayIncoterms = myIncoterms.sublist(0, 3);
    if (seeAll) {
      displayIncoterms = myIncoterms;
    }

    return Scaffold(
      appBar: myAppBar(context),
      backgroundColor: Colors.white,
      body: SizedBox(
          width: Sizes.width,
          height: Sizes.height,
          child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
              child: Text(
                "Logística de compra",
                style: TextStyle(
                    color: const Color(0xff103E6E),
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.font06),
              ),
              ),
              verticalSpace(2),
              Center(
              child: Text(
                currentOrder,
                style: TextStyle(
                    color: const Color(0xff3075B6),
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.font04),
              ),
              ),
              verticalSpace(),
              Column(
              children: [
                logisticTile(
                    "Transporte Interno",
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ",
                    100),
                logisticTile(
                    "Aduana origen",
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ",
                    50, active: true),
                logisticTile(
                    "Naviera",
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ",
                    0),
                logisticTile(
                    "Aduana destino",
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ",
                    0),
                logisticTile(
                    "Fabrica",
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
                    0),
              ],
              ),
              verticalSpace(3),
            ]))),
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
