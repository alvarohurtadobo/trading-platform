import 'package:flutter/material.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/components/customTextInput.dart';

class SimpleSignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SimpleSignupPageState();
}

List<String> countries = [
  "Venezuela",
  "Colombia",
  "Bolivia",
  "Ecuador",
  "Eritrea",
  "Panama",
  "Peru"
];

class _SimpleSignupPageState extends State<SimpleSignupPage> {
  String name = "";
  String email = "";
  int? countryId = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);
    return Scaffold(
      backgroundColor: const Color(0xff2F70AF),
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.padding/2, vertical: Sizes.padding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "REGISTRO",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.font04,
                  fontWeight: FontWeight.bold),
            ),
            Text(userType,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal)),
            verticalSpace(3),
            customTextInput(context, "Nombres y Apellidos", (value) {
              setState(() {
                name = value;
              });
            }, hint: "Marta Torres"),
            SizedBox(
              height: Sizes.boxSeparation,
            ),
            customTextInput(context, "Correo Electrónico", (value) {
              setState(() {
                email = value;
              });
            }, hint: "MartaTorres14@gmail.com"),
            SizedBox(
              height: Sizes.boxSeparation,
            ),
            Container(
              width: Sizes.width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
              child: const Text(
                "País",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Sizes.padding),
              decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.white))),
              child: DropdownButton<int>(
                  value: countryId,
                  isExpanded: true,
                  // dropdownColor: const Color(0xff2F70AF),
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  iconEnabledColor: Colors.white,
                  underline: Container(),
                  selectedItemBuilder: (context) {
                    return countries
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(color: Colors.white60),
                              ),
                              value: countries.indexOf(e),
                            ))
                        .toList();
                  },
                  items: countries
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(color: const Color(0xff2F70AF)),
                            ),
                            value: countries.indexOf(e),
                          ))
                      .toList(),
                  onChanged: (newIndex) {
                    setState(() {
                      countryId = newIndex;
                    });
                  }),
            ),
            verticalSpace(3),
            customButton(context, "Continuar", () {
              Navigator.of(context).pushReplacementNamed("/login");
            })
          ],
        ),
      ),
    );
  }
}
