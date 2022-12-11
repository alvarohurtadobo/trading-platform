import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/model/name.dart';
import 'package:project_trading/trade/model/incoterm.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/customDropdown.dart';
import 'package:project_trading/common/components/ordersDropdown.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';

class OrdersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _selectedIndex = 0;
  bool seeAll = false;
  int orderTypeSelected = 0;
  bool order = false;
  bool process = false;
  bool finished = false;
  bool verified = false;

  int? currentOrderType = 10;
  int? currentOrder;

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
              child: Column(children: [
            const Text(
              "Ordenes de compra",
              style: TextStyle(
                  color: Color(0xff103E6E), fontWeight: FontWeight.bold),
            ),
            verticalSpace(),
            const Text("Busca segun el incoterm seleccionado"),
            verticalSpace(),
            customDropdown(currentOrderType, orderTypes, (value) {
              setState(() {
                currentOrderType = value;
              });
            }),
            verticalSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Checkbox(
                      value: orderTypeSelected == 0,
                      shape: const CircleBorder(),
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            orderTypeSelected = 0;
                          }
                        });
                      }),
                ),
                Text("EXW"),
                horizontalSpace(2),
                Checkbox(
                    value: orderTypeSelected == 1,
                    shape: const CircleBorder(),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          orderTypeSelected = 1;
                        }
                      });
                    }),
                Text("FOB"),
                horizontalSpace(2),
                Checkbox(
                    value: orderTypeSelected == 2,
                    shape: const CircleBorder(),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          orderTypeSelected = 2;
                        }
                      });
                    }),
                Text("CIF"),
              ],
            ),
            verticalSpace(),
            ordersDropdown(context, currentOrder, orders),
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
