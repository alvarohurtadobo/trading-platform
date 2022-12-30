import 'package:flutter/material.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/chip.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/calendar.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/customProgress.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';

class PlannedTimeLinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlannedTimeLinePageState();
}

class _PlannedTimeLinePageState extends State<PlannedTimeLinePage> {
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
                  chip(
                    "Planificado",
                    width: Sizes.width / 3,
                  ),
                  verticalSpace(),
                  customProgress(76),
                  verticalSpace(),
                  Text(
                    "Tiempo menor a 45 días",
                    style: TextStyle(fontSize: Sizes.font12),
                  ),
                  verticalSpace(),
                  calendar(() {
                    setState(() {});
                  }, small: false),
                  verticalSpace(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: Sizes.tileMini,
                        height: Sizes.tileMini,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xffB1D4F2),
                            borderRadius: BorderRadius.all(
                                Radius.circular(Sizes.bullet))),
                      ),
                      horizontalSpace(),
                      Text(
                        userType == "planificador"
                            ? "Fecha de Salida de Fabrica"
                            : "Salió de fábrica",
                        style: const TextStyle(color: Color(0xff575454)),
                      )
                    ],
                  ),
                  verticalSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: Sizes.tileMini,
                        height: Sizes.tileMini,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff74CF6F),
                            borderRadius: BorderRadius.all(
                                Radius.circular(Sizes.bullet))),
                      ),
                      horizontalSpace(),
                      Text(
                        userType == "planificador"
                            ? "Fecha estimada de llegada al destino"
                            : "Llegada exitosa",
                        style: const TextStyle(color: Color(0xff575454)),
                      )
                    ],
                  ),
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
