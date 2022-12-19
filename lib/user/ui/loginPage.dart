import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/model/currentState.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/customTextInput.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
                top: Sizes.height * 0.32,
                left: 0,
                child: Container(
                  width: Sizes.width,
                  height: Sizes.height * 0.68,
                  color: const Color(0xff2F70AF),
                )),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: Sizes.width * 1.2,
                height: Sizes.height * 0.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/ship.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                left: 0,
                top: Sizes.height * 0.45,
                child: Container(
                  width: Sizes.width,
                  height: Sizes.height * 0.55,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "INICIAR SESIÓN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.font04,
                            fontWeight: FontWeight.bold),
                      ),
                      verticalSpace(2),
                      customTextInput(context, "Correo Electrónico", (value) {
                        email = value;
                      }, hint: "MartaTorres14@gmail.com"),
                      verticalSpace(),
                      customTextInput(context, "Contraseña", (value) {
                        password = value;
                      }, hint: "********"),
                      verticalSpace(2),
                      customButton(context, "Entrar", () {
                        if (userType == "planificador") {
                          Navigator.of(context).pushReplacementNamed("/home");
                        } else {
                          Navigator.of(context)
                              .pushReplacementNamed("/export-home");
                        }
                      }, active: true),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
