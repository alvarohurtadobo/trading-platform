import 'package:flutter/material.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/sizes.dart';

class StartAsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StartAsPageState();
}

class _StartAsPageState extends State<StartAsPage> {
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
                top: Sizes.height * 0.20,
                left: 0,
                child: Container(
                  width: Sizes.width,
                  height: Sizes.height * 0.8,
                  color: const Color(0xff2F70AF),
                )),
            Positioned(
              left: -Sizes.width * 0.05,
              top: 0,
              child: Container(
                width: Sizes.width * 1.2,
                height: Sizes.height * 0.32,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                    image: const DecorationImage(
                        image: AssetImage("assets/images/handshake.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(Sizes.width * 0.7,Sizes.width * 0.2),
                        bottomRight: Radius.elliptical(Sizes.width * 0.5,Sizes.width * 0.2))),
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
                        "TU PAPEL ES\nIMPORTANTE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.font04,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Sizes.boxSeparation,
                      ),
                      customButton(context, "Planificador", () {
                        Navigator.of(context).pushNamed("/login");
                      },
                          active: true),
                      SizedBox(
                        height: Sizes.boxSeparation,
                      ),
                      customButton(context, "Importador", () {
                        Navigator.of(context).pushNamed("/login");
                      }, active: true),
                      SizedBox(
                        height: Sizes.boxSeparation,
                      ),
                      customButton(context, "Exportador", () {
                        Navigator.of(context).pushNamed("/login");
                      }, active: true),
                      SizedBox(
                        height: Sizes.boxSeparation,
                      ),
                      customButton(context, "Registrar", () {
                        Navigator.of(context)
                            .pushNamed("/presignup");
                      },
                          active: true,
                          backgroundColor: const Color(0xff29315D)),
                      SizedBox(
                        height: Sizes.boxSeparation,
                      ),
                      Padding(
                        padding: EdgeInsets.all(Sizes.padding),
                        child: const Text(
                          "Lorem ipsum dolor sit amet, consecteturadipiscing elit, s",
                        textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
