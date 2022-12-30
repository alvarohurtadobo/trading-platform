import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'common/model/currentState.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_trading/common/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Firebase.initializeApp().then((app) {
    FirebaseMessaging.instance.getToken().then((token) {
      fcmToken = token ?? "";
      print("My token is: $fcmToken");
    });
  });
  runApp(const MyApp());
}

// main color 3070AF
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Tradind',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
