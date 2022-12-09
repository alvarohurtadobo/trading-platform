import 'package:flutter/material.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/sizes.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);
    return Scaffold(
      body: SizedBox(
          width: width,
          height: height,
          child: Stack(children: [
            Positioned(
              left: -Sizes.width * 1,
              top: -Sizes.width * 2.4,
              child: Container(
                width: Sizes.width * 3.2,
                height: Sizes.width * 3.2,
                decoration: BoxDecoration(
                    color: const Color(0xff2F70AF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Sizes.width * 1.6),
                        bottomRight: Radius.circular(Sizes.width * 1.6))),
              ),
            ),
            Positioned(
                left: 0,
                top: Sizes.height * 0.16,
                child: Container(
                    width: width,
                    height: height * 0.1,
                    alignment: Alignment.center,
                    child: Text("REGISTRO",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.font04,
                            fontWeight: FontWeight.bold)))),
            Positioned(
                left: 0,
                top: Sizes.height * 0.55,
                child: Container(
                  width: width,
                  height: height * 0.4,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customButton(context, "Planificador", () {
                        Navigator.of(context).pushReplacementNamed("/signup-simple");
                      },
                          backgroundColor: const Color(0xff2F70AF)),
                      SizedBox(
                        height: Sizes.boxSeparation,
                      ),
                      customButton(context, "Importador", () {},
                          backgroundColor: const Color(0xff2F70AF)),
                      SizedBox(
                        height: Sizes.boxSeparation,
                      ),
                      customButton(context, "Exportador", () {},
                          backgroundColor: const Color(0xff2F70AF)),
                    ],
                  ),
                ))
          ])),
    );
  }
}
