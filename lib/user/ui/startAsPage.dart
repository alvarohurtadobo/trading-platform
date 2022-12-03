import 'package:flutter/material.dart';
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
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash.png"),
                fit: BoxFit.contain)),
      ),
    );
  }
}
