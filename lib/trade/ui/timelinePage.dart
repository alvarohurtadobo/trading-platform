import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/chip.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/calendar.dart';
import 'package:project_trading/common/components/customInput.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/customProgress.dart';

class ProgrammedTimeLinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProgrammedTimeLinePageState();
}

class _ProgrammedTimeLinePageState extends State<ProgrammedTimeLinePage> {
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
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
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
                      "Programado",
                      width: Sizes.width / 3,
                    ),
                  ),
                  verticalSpace(),
                  customProgress(50),
                  verticalSpace(),
                  Text(
                    "3 notificaciones de alerta",
                    style: TextStyle(fontSize: Sizes.font12),
                  ),
                  verticalSpace(),
                  userType != "planificador"
                      ? Container()
                      : calendar(() {
                          setState(() {});
                        }, small: true),
                  verticalSpace(),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
                    child: Text(
                      "Salida aduana de origen",
                      style: TextStyle(
                          fontSize: Sizes.font08,
                          color: const Color(0xff575454)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
                    child: Text(
                      "${weekdays[date1.weekday]} ${date1.day} de ${months[date1.month]} de ${date1.year} a las 6:40AM",
                      style: TextStyle(
                          fontSize: Sizes.font10,
                          color: const Color(0xff575454)),
                    ),
                  ),
                  verticalSpace(),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
                    child: Text("Entrada a naviera",
                        style: TextStyle(
                            fontSize: Sizes.font08,
                            color: const Color(0xff575454))),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
                    child: Text("${weekdays[date2.weekday]} ${date2.day} de ${months[date2.month]} de ${date2.year} a las 6:40AM",
                        style: TextStyle(
                            fontSize: Sizes.font10,
                            color: const Color(0xff575454))),
                  ),
                  userType != "planificador" ? Container() : verticalSpace(2),
                  userType != "planificador"
                      ? Container()
                      : customInput("Agregar detalles"),
                  userType != "planificador" ? Container() : verticalSpace(),
                  userType != "planificador"
                      ? Container()
                      : Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: customButton(context, "Notificar", () {},
                              backgroundColor: const Color(0xff4E8ED0))),
                  verticalSpace(3),
                ]),
          ))),
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
