import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/components/myAppBar.dart';
import 'package:project_trading/common/components/customInput.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/customProgress.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Text(
                  "Orden de compra",
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
              Text("Fabrica",
                  style: TextStyle(
                      fontWeight: FontWeight.normal, fontSize: Sizes.font08)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: Checkbox(
                        value: fabric,
                        shape: const CircleBorder(),
                        onChanged: (value) {
                          setState(() {
                            fabric = value ?? false;
                          });
                        }),
                  ),
                  Text("SI"),
                  Checkbox(
                      value: !fabric,
                      shape: const CircleBorder(),
                      onChanged: (value) {
                        setState(() {
                          fabric = !value!;
                        });
                      }),
                  Text("NO"),
                ],
              ),
              verticalSpace(),
              customInput("Agregar detalles del proceso en fábrica"),
              verticalSpace(),
              Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: customButton(context, "Notificar", () {},
                      backgroundColor: const Color(0xff4E8ED0))),
              verticalSpace(),
              Text(
                "EXW",
                style: TextStyle(fontSize: Sizes.font08),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ",
                style: TextStyle(fontSize: Sizes.font14),
              ),
              verticalSpace(),
              customProgress(70,
                  customWidth: Sizes.width / 2,
                  customHeight: Sizes.tileMini * 0.6,
                  activeColor: const Color(0xff4E8ED0)),
              verticalSpace(3),
              Center(
                child: customButton(context, "Enviar mensaje", () {
                  Navigator.of(context).pushNamed("/chats");
                }, backgroundColor: const Color(0xff4E8ED0)),
              )
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
