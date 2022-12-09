import 'package:flutter/material.dart';
import 'package:project_trading/common/routes.dart';

void main() {
  runApp(const MyApp());
}
// main color 3070AF
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins'
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
