import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/model/name.dart';
import 'package:project_trading/trade/model/incoterm.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/incotermIcon.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/customDropdown.dart';
import 'package:project_trading/common/components/uploadDocumentTile.dart';

class IncotermsMatrixPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IncotermsMatrixPageState();
}

class _IncotermsMatrixPageState extends State<IncotermsMatrixPage> {
  int _selectedIndex = 0;
  int? _currentIncoterm = 1;
  int? _currentSource = 1;
  int? _currentDocument = 1;
  bool seeAll = false;
  bool outOfFabric = false;
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
              "Matriz de incoterms",
              style: TextStyle(
                  color: Color(0xff103E6E), fontWeight: FontWeight.bold),
            ),
            verticalSpace(),
            customDropdown(_currentIncoterm, responsibilities, (value) {
              setState(() {
                _currentIncoterm = value;
              });
            }),
            verticalSpace(),
            SizedBox(
              width: Sizes.width - 2 * Sizes.padding,
              child: Wrap(
                alignment: WrapAlignment.start,
                children: displayIncoterms.map((e) => incotermIcon(e)).toList(),
              ),
            ),
            verticalSpace(),
            customButton(context, seeAll ? "Ver menos" : "Ver todos", () {
              setState(() {
                seeAll = !seeAll;
              });
            }, backgroundColor: const Color(0xff4E8ED0)),
            verticalSpace(2),
            customDropdown(_currentSource, sources, (value) {
              setState(() {
                _currentSource = value;
              });
            }),
            verticalSpace(),
            const Text("Debes confirmar si el paquete a salido de la fabrica"),
            verticalSpace(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: Checkbox(
                        value: outOfFabric,
                        shape: const CircleBorder(),
                        onChanged: (value) {
                          setState(() {
                            outOfFabric = value ?? false;
                          });
                        }),
                  ),
                  const Text("SI"),
                  Checkbox(
                      value: !outOfFabric,
                      shape: const CircleBorder(),
                      onChanged: (value) {
                        setState(() {
                          outOfFabric = !value!;
                        });
                      }),
                  const Text("NO"),
                ],
              ),
            ),
            verticalSpace(),
            customButton(context, "Seleccionar destino en el mapa", () {
              Navigator.of(context).pushNamed("/locations");
            },
                backgroundColor: const Color(0xff4E8ED0),
                customWidth: Sizes.width * 0.6),
            verticalSpace(),
            customDropdown(_currentDocument, documents, (value) {
              setState(() {
                _currentDocument = value;
              });
            }),
            verticalSpace(),
            const Text("Debes confirmar si el paquete a salido de la fabrica"),
            verticalSpace(),
            uploadDocumentTile(order, "Orden de compra"),
            verticalSpace(),
            uploadDocumentTile(process, "Producto en proceso"),
            verticalSpace(),
            uploadDocumentTile(finished, "Producto terminado"),
            verticalSpace(),
            uploadDocumentTile(verified, "Verificación de calidad"),
            verticalSpace(),
            customButton(context, "Riesgos y costos", () {
              Navigator.of(context).pushNamed("/risks");
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
