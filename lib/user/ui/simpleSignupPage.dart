import 'dart:async';
import 'package:flutter/material.dart';
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
  int? countryId;

  @override
  void initState() {}

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
            horizontal: Sizes.padding, vertical: Sizes.padding * 2),
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
            const Text("planificador",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal)),
            SizedBox(
              height: 4 * Sizes.boxSeparation,
            ),
            customTextInput(context, "Nombres y Apellidos", (value) {
              setState(() {
                name = value;
              });
            }),
            SizedBox(
              height: Sizes.boxSeparation,
            ),
            customTextInput(context, "Correo Electrónico", (value) {
              setState(() {
                email = value;
              });
            }),
            SizedBox(
              height: Sizes.boxSeparation,
            ),
            Container(
              width: Sizes.width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
              child: const Text(
                "País",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Sizes.padding),
              child: DropdownButton<int>(
                  value: countryId,
                  isExpanded: true,
                  // dropdownColor: const Color(0xff2F70AF),
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  iconEnabledColor: Colors.white,
                  selectedItemBuilder: (context) {
                    return countries
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(color: Colors.white),
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
            SizedBox(
              height: Sizes.boxSeparation,
            ),
            customButton(context, "Continuar", () {
              Navigator.of(context).pushReplacementNamed("/signin");
            })
          ],
        ),
      ),
    );
  }
}
