import 'package:flutter/material.dart';
import 'package:project_trading/common/components/customDropdown.dart';
import 'package:project_trading/common/components/horizontalSpace.dart';
import 'package:project_trading/common/model/name.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/verticalSpac.dart';

class QualityAssurancePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QualityAssurancePageState();
}

class _QualityAssurancePageState extends State<QualityAssurancePage> {
  int _selectedIndex = 0;
  int qualityIndex1 = 1;
  int qualityIndex2 = 1;
  int qualityIndex3 = 1;
  int choise1 = 0;
  int choise2 = 0;
  int choise3 = 0;

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
                      "Inspección de calidad",
                      style: TextStyle(
                          color: const Color(0xff103E6E),
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.font06),
                    ),
                  ),
                  verticalSpace(),
                  customDropdown(qualityIndex1, quality1, (value) {
                    setState(() {
                      qualityIndex1 = value ?? 1;
                    });
                  }),
                  verticalSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: choise1 == 0,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            if (value!) {
                              setState(() {
                                choise1 = 0;
                              });
                            }
                          }),
                      horizontalSpace(),
                      const Text(
                        "Preparación del producto",
                        maxLines: 1,
                        style: TextStyle(color: Color(0xffA0A0A0)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: choise1 == 1,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            if (value!) {
                              setState(() {
                                choise1 = 1;
                              });
                            }
                          }),
                      horizontalSpace(),
                      const Text(
                        "Producción",
                        maxLines: 1,
                        style: TextStyle(color: Color(0xffA0A0A0)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: choise1 == 2,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            if (value!) {
                              setState(() {
                                choise1 = 2;
                              });
                            }
                          }),
                      horizontalSpace(),
                      const Text(
                        "Preparación del producto terminado",
                        maxLines: 1,
                        style: TextStyle(color: Color(0xffA0A0A0)),
                      )
                    ],
                  ),
                  verticalSpace(),
                  customDropdown(qualityIndex2, quality2, (value) {
                    setState(() {
                      qualityIndex2 = value ?? 1;
                    });
                  }),
                  verticalSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: choise2 == 0,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            if (value!) {
                              setState(() {
                                choise2 = 0;
                              });
                            }
                          }),
                      horizontalSpace(),
                      const Text(
                        "Preparación del producto",
                        maxLines: 1,
                        style: TextStyle(color: Color(0xffA0A0A0)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: choise2 == 1,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            if (value!) {
                              setState(() {
                                choise2 = 1;
                              });
                            }
                          }),
                      horizontalSpace(),
                      const Text(
                        "Producción",
                        maxLines: 1,
                        style: TextStyle(color: Color(0xffA0A0A0)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: choise2 == 2,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            if (value!) {
                              setState(() {
                                choise2 = 2;
                              });
                            }
                          }),
                      horizontalSpace(),
                      const Text(
                        "Preparación del producto terminado",
                        maxLines: 1,
                        style: TextStyle(color: Color(0xffA0A0A0)),
                      )
                    ],
                  ),
                  verticalSpace(),
                  customDropdown(qualityIndex3, quality3, (value) {
                    setState(() {
                      qualityIndex3 = value ?? 1;
                    });
                  }),
                  verticalSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: choise3 == 0,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            if (value!) {
                              setState(() {
                                choise3 = 0;
                              });
                            }
                          }),
                      horizontalSpace(),
                      const Text(
                        "Preparación del producto",
                        maxLines: 1,
                        style: TextStyle(color: Color(0xffA0A0A0)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: choise3 == 1,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            if (value!) {
                              setState(() {
                                choise3 = 1;
                              });
                            }
                          }),
                      horizontalSpace(),
                      const Text(
                        "Producción",
                        maxLines: 1,
                        style: TextStyle(color: Color(0xffA0A0A0)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: choise3 == 2,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            if (value!) {
                              setState(() {
                                choise3 = 2;
                              });
                            }
                          }),
                      horizontalSpace(),
                      const Text(
                        "Preparación del producto terminado",
                        maxLines: 1,
                        style: TextStyle(color: Color(0xffA0A0A0)),
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
