import 'package:flutter/material.dart';
import 'package:project_trading/common/ui/splash.dart';
import 'package:project_trading/user/ui/loginPage.dart';
import 'package:project_trading/user/ui/signupPage.dart';
import 'package:project_trading/common/ui/startAsPage.dart';
import 'package:project_trading/user/ui/simpleSignupPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashPage());
      case "/startAs":
        return MaterialPageRoute(builder: (_) => StartAsPage());
      case "/presignup":
        return MaterialPageRoute(builder: (_) => SignupPage());
      case "/signup-simple":
        return MaterialPageRoute(builder: (_) => SimpleSignupPage());
      case "/signup-complex":
        return MaterialPageRoute(builder: (_) => SimpleSignupPage());
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Ruta no encontrada"),
        ),
      );
    });
  }
}
