import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/avatarTile.dart';
import 'package:project_trading/common/components/wideButton.dart';
import 'package:project_trading/common/components/searchInput.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/customProgress.dart';
import 'package:project_trading/common/components/notificationTile.dart';
import 'package:project_trading/common/components/joinDefaultJitsiCall.dart';

class ExportHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExportHomePageState();
}

class _ExportHomePageState extends State<ExportHomePage> {
  int _selectedIndex = 0;

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
            children: [
              verticalSpace(),
              searchInput("Buscar"),
              verticalSpace(),
              avatarTile(),
              verticalSpace(2),
              Text(
                "Importación",
                style: TextStyle(
                    color: const Color(0xff4E8ED0),
                    fontSize: Sizes.font04,
                    fontWeight: FontWeight.bold),
              ),
              verticalSpace(),
              customProgress(76),
              verticalSpace(),
              Text("Juego de platos (carga delicada)",
                  style: TextStyle(
                      color: const Color(0xff575454),
                      fontSize: Sizes.font12,
                      fontWeight: FontWeight.normal)),
              verticalSpace(),
              notificationTile("Tiempo planificado", "",
                  arrowInsteadOfTime: true, function: () {
                Navigator.of(context).pushNamed("/planned-timeline");
              }),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    vertical: Sizes.padding / 4, horizontal: Sizes.padding),
                child: Text("Se estima una duración 15 días",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: const Color(0xff4E8ED0),
                        fontSize: Sizes.font12,
                        fontWeight: FontWeight.normal)),
              ),
              verticalSpace(),
              notificationTile("Tiempo programado", "",
                  arrowInsteadOfTime: true, function: () {
                Navigator.of(context).pushNamed("/programmed-timeline");
              }),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    vertical: Sizes.padding / 4, horizontal: Sizes.padding),
                child: Text("Se ha planificado 15 días",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: const Color(0xff4E8ED0),
                        fontSize: Sizes.font12,
                        fontWeight: FontWeight.normal)),
              ),
              verticalSpace(),
              notificationTile("Tiempo Real", "",
                  arrowInsteadOfTime: true, function: () {
                Navigator.of(context).pushNamed("/real-timeline");
              }),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    top: Sizes.padding / 4,
                    left: Sizes.padding,
                    right: Sizes.padding),
                child: Text("11 : 02 : 34",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: const Color(0xff4E8ED0),
                        fontSize: Sizes.font08,
                        fontWeight: FontWeight.normal)),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    vertical: Sizes.padding / 4, horizontal: Sizes.padding),
                child: Text("Se estima 2 días más hasta su parada",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: const Color(0xff4E8ED0),
                        fontSize: Sizes.font12,
                        fontWeight: FontWeight.normal)),
              ),
              verticalSpace(),
              wideButton("assets/icons/3_ring_bell.png", "Notificaciones", () {
                Navigator.of(context).pushNamed("/notifications");
              }),
              verticalSpace(),
              wideButton("assets/icons/3_contact.png", "Atención 24 horas", () {
                joinDefaultJitsiCall();
                // Navigator.of(context).pushNamed("/meet");
              }),
              verticalSpace(3),
            ],
          ),
        ),
      ),
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
