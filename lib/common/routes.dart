import 'package:flutter/material.dart';
import 'package:project_trading/common/ui/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_)=>SplashPage());
      case "/home":
        return MaterialPageRoute(builder: (_)=>SplashPage());
      case "/splash":
        return MaterialPageRoute(builder: (_)=>SplashPage());
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
