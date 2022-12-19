import 'package:flutter/material.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/model/name.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/components/customTextInput.dart';

class ExtendedSignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExtendedSignupPageState();
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

class _ExtendedSignupPageState extends State<ExtendedSignupPage> {
  String name = "";
  String email = "";
  String incoterms = "";
  String buyingOrder = "";
  String productionOrigin = "";
  int? countryId = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(4),
                Text(
                  "REGISTRO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xff74B0EC),
                      fontSize: Sizes.font04,
                      fontWeight: FontWeight.bold),
                ),
                Text(userType,
                    style: const TextStyle(
                        color: Color(0xff3C3C3C),
                        fontWeight: FontWeight.normal)),
                verticalSpace(),
                customTextInput(context, "Nombres y Apellidos", (value) {
                  setState(() {
                    name = value;
                  });
                }, coloured: true, hint: "Marta Torres"),
                SizedBox(
                  height: Sizes.boxSeparation,
                ),
                Container(
                  width: Sizes.width,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
                  child: const Text(
                    "RIF",
                    style: TextStyle(color: Color(0xff2B69A6)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 40,
                        height: Sizes.tileNormal,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0x8f2F2F2F)))),
                        child: DropdownButton<int>(
                            value: countryId,
                            isExpanded: true,
                            // dropdownColor: const Color(0xff2F70AF),
                            icon: const Icon(Icons.keyboard_arrow_down_sharp),
                            iconEnabledColor: const Color(0xffA1A1A1),
                            underline: Container(),
                            selectedItemBuilder: (context) {
                              return rifs
                                  .map((e) => DropdownMenuItem(
                                        child: Text(
                                          e.name,
                                          style: TextStyle(
                                              color: const Color(0xffA1A1A1)),
                                        ),
                                        value: rifs.indexOf(e),
                                      ))
                                  .toList();
                            },
                            items: rifs
                                .map((e) => DropdownMenuItem(
                                      child: Text(
                                        e.name,
                                        style: TextStyle(
                                            color: const Color(0xff2F70AF)),
                                      ),
                                      value: rifs.indexOf(e),
                                    ))
                                .toList(),
                            onChanged: (newIndex) {
                              setState(() {
                                countryId = newIndex;
                              });
                            }),
                      ),
                      Container(
                        width: 20,
                        height: Sizes.tileNormal,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0x8f2F2F2F)))),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Color(0x8f2F2F2F)))),
                          child: TextField(
                            onChanged: (value) {},
                            style: TextStyle(color: const Color(0xffA1A1A1)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "9883578-0",
                                hintStyle:
                                    TextStyle(color: const Color(0xffA1A1A1))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Sizes.boxSeparation,
                ),
                customTextInput(context, "Correo Electrónico", (value) {
                  setState(() {
                    email = value;
                  });
                }, coloured: true, hint: "MartaTorres14@gmail.com"),
                SizedBox(
                  height: Sizes.boxSeparation,
                ),
                Container(
                  width: Sizes.width,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
                  child: const Text(
                    "País",
                    style: TextStyle(color: Color(0xff2B69A6)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Sizes.padding),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Color(0x8f2F2F2F)))),
                  child: DropdownButton<int>(
                      value: countryId,
                      isExpanded: true,
                      // dropdownColor: const Color(0xff2F70AF),
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      iconEnabledColor: const Color(0xffA1A1A1),
                      underline: Container(),
                      selectedItemBuilder: (context) {
                        return countries
                            .map((e) => DropdownMenuItem(
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                        color: const Color(0xffA1A1A1)),
                                  ),
                                  value: countries.indexOf(e),
                                ))
                            .toList();
                      },
                      items: countries
                          .map((e) => DropdownMenuItem(
                                child: Text(
                                  e,
                                  style:
                                      TextStyle(color: const Color(0xff2F70AF)),
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
                customTextInput(context, "Incoterms", (value) {
                  setState(() {
                    incoterms = value;
                  });
                }, coloured: true, hint: "MartaTorres14@gmail.com"),
                SizedBox(
                  height: Sizes.boxSeparation,
                ),
                customTextInput(context, "Orden de compra", (value) {
                  setState(() {
                    buyingOrder = value;
                  });
                }, coloured: true, hint: "#331989"),
                SizedBox(
                  height: Sizes.boxSeparation,
                ),
                customTextInput(context, "Origen de producción", (value) {
                  setState(() {
                    productionOrigin = value;
                  });
                }, coloured: true, hint: "Orlando"),
                SizedBox(
                  height: 3 * Sizes.boxSeparation,
                ),
                customButton(context, "Continuar", () {
                  Navigator.of(context).pushReplacementNamed("/login");
                }, backgroundColor: const Color(0xff2B69A6)),
                verticalSpace(4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
