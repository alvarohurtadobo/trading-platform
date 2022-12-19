import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/chip.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/customProgress.dart';
import 'package:project_trading/common/components/notificationTile.dart';
import 'package:project_trading/common/components/joinDefaultJitsiCall.dart';

class RealTimeLinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RealTimeLinePageState();
}

class _RealTimeLinePageState extends State<RealTimeLinePage> {
  int _selectedIndex = 0;
  bool seeAll = false;
  bool order = false;
  bool process = false;
  bool finished = false;
  bool verified = false;
  bool fabric = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);

    return Scaffold(
      appBar: myAppBar(context),
      backgroundColor: Colors.white,
      body: SizedBox(
          width: Sizes.width,
          height: Sizes.height,
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Linea de tiempo",
                        style: TextStyle(
                            color: const Color(0xff103E6E),
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.font06),
                      ),
                    ),
                    verticalSpace(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("/planned-timeline");
                      },
                      child: chip(
                        "Real",
                        width: Sizes.width / 3,
                      ),
                    ),
                    verticalSpace(),
                    customProgress(76),
                    verticalSpace(),
                    Text(
                      "Juego de platos (carga delicada)",
                      style: TextStyle(fontSize: Sizes.font12),
                    ),
                    verticalSpace(2),
                    notificationTile("Mapa del envío", "",
                        arrowInsteadOfTime: true, function: () {
                      Navigator.of(context).pushNamed("/realtime-map");
                    }),
                    verticalSpace(2),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.padding),
                          child: Text(
                            "Salida al puerto",
                            style: TextStyle(
                                fontSize: Sizes.font08,
                                color: const Color(0xff575454)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.padding),
                          child: Text(
                            "Lunes 10 de octubre de 2022 a las 6:40AM",
                            style: TextStyle(
                                fontSize: Sizes.font10,
                                color: const Color(0xff575454)),
                          ),
                        ),
                        verticalSpace(),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.padding),
                          child: Text(
                            "Entrada al aduana",
                            style: TextStyle(
                                fontSize: Sizes.font08,
                                color: const Color(0xff575454)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.padding),
                          child: Text(
                            "Jueves 13 de octubre de 2022 a las 6:40AM",
                            style: TextStyle(
                                fontSize: Sizes.font10,
                                color: const Color(0xff575454)),
                          ),
                        ),
                        verticalSpace(),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.padding),
                          child: Text(
                            "Entrega de paquete",
                            style: TextStyle(
                                fontSize: Sizes.font08,
                                color: const Color(0xff575454)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizes.padding),
                          child: Text(
                            "Martes 18 de octubre de 2022 ",
                            style: TextStyle(
                                fontSize: Sizes.font10,
                                color: const Color(0xff575454)),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(2),
                    customButton(context, "Mensaje", () {
                      Navigator.of(context).pushNamed("/chats");
                    }, backgroundColor: const Color(0xff4E8ED0)),
                    verticalSpace(),
                    customButton(context, "Llamada", () {
                      joinDefaultJitsiCall();
                      // Navigator.of(context).pushNamed("/meet");
                    }, backgroundColor: const Color(0xff4E8ED0)),
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
