import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/trade/model/incoterm.dart';
import 'package:project_trading/common/components/chip.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/customProgress.dart';

class RisksPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RisksPageState();
}

class _RisksPageState extends State<RisksPage> {
  int _selectedIndex = 0;
  bool seeAll = false;
  bool reportRisk = false;
  bool order = false;
  bool process = false;
  bool finished = false;
  bool verified = false;

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
              "Riesgos",
              style: TextStyle(
                  color: Color(0xff103E6E), fontWeight: FontWeight.bold),
            ),
            verticalSpace(2),
            Text(
              "Recorrido: (16 horas)",
              style: TextStyle(
                  color: const Color(0xff575454), fontSize: Sizes.font12),
            ),
            verticalSpace(),
            customProgress(32,
                activeColor: const Color(0xff4E8ED0),
                inactiveColor: const Color(0xffE1E1E1)),
            verticalSpace(2),
            chip("Planificado", width: Sizes.width / 3.5),
            verticalSpace(),
            customProgress(76),
            verticalSpace(2),
            chip("Real", width: Sizes.width / 3.5),
            verticalSpace(),
            customProgress(76),
            verticalSpace(4),
            const Text("Informar de algún riesgo"),
            verticalSpace(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: Checkbox(
                        value: reportRisk,
                        shape: const CircleBorder(),
                        onChanged: (value) {
                          setState(() {
                            reportRisk = value ?? false;
                          });
                        }),
                  ),
                  Text("SI"),
                  Checkbox(
                      value: !reportRisk,
                      shape: const CircleBorder(),
                      onChanged: (value) {
                        setState(() {
                          reportRisk = !value!;
                        });
                      }),
                  Text("NO"),
                ],
              ),
            ),
            verticalSpace(2),
            customButton(context, "Enviar mensaje", () {
              Navigator.of(context).pushNamed("/chats");
            }, backgroundColor: const Color(0xff4E8ED0)),
            verticalSpace(),
            customButton(context, "Reprogramar", () {},
                backgroundColor: const Color(0xff4E8ED0)),
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
