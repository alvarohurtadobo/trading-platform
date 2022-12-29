import 'package:flutter/material.dart';
import 'package:project_trading/user/ui/meet.dart';
import 'package:project_trading/common/ui/splash.dart';
import 'package:project_trading/user/ui/chatPage.dart';
import 'package:project_trading/user/ui/homePage.dart';
import 'package:project_trading/user/ui/chatsPage.dart';
import 'package:project_trading/user/ui/loginPage.dart';
import 'package:project_trading/trade/ui/orderPage.dart';
import 'package:project_trading/trade/ui/risksPage.dart';
import 'package:project_trading/user/ui/signupPage.dart';
import 'package:project_trading/trade/ui/plannedPage.dart';
import 'package:project_trading/trade/ui/realtimeMap.dart';
import 'package:project_trading/trade/ui/locationPage.dart';
import 'package:project_trading/trade/ui/timelinePage.dart';
import 'package:project_trading/common/ui/startAsPage.dart';
import 'package:project_trading/trade/ui/logisticsPage.dart';
import 'package:project_trading/user/ui/simpleSignupPage.dart';
import 'package:project_trading/trade/ui/realTimelinePage.dart';
import 'package:project_trading/trade/ui/qualityAssurance.dart';
import 'package:project_trading/user/ui/extendedSignupPage.dart';
import 'package:project_trading/trade/ui/incotermsMatrixPage.dart';

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
      case "/signup-extended":
        return MaterialPageRoute(builder: (_) => ExtendedSignupPage());
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginPage());
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomePage(initialIndex: 0,));
      // case "/export-home": deletethis
      //   return MaterialPageRoute(builder: (_) => ExportHomePage());
      case "/incoterm-matrix":
        return MaterialPageRoute(builder: (_) => IncotermsMatrixPage());
      case "/risks":
        return MaterialPageRoute(builder: (_) => RisksPage());
      case "/orders":
        return MaterialPageRoute(builder: (_) => const HomePage(initialIndex: 2,));
        // return MaterialPageRoute(builder: (_) => OrdersPage());
      case "/order":
        return MaterialPageRoute(builder: (_) => OrderPage());
      case "/logistics":
        return MaterialPageRoute(builder: (_) => LogisticsPage());
      case "/programmed-timeline":
        return MaterialPageRoute(builder: (_) => ProgrammedTimeLinePage());
      case "/real-timeline":
        return MaterialPageRoute(builder: (_) => RealTimeLinePage());
      case "/planned-timeline":
        return MaterialPageRoute(builder: (_) => PlannedTimeLinePage());
      case "/notifications":
        return MaterialPageRoute(builder: (_) => const HomePage(initialIndex: 1,));
        // return MaterialPageRoute(builder: (_) => NotificationPage());
      case "/chats":
        return MaterialPageRoute(builder: (_) => ChatsPage());
      case "/chat":
        return MaterialPageRoute(builder: (_) => ChatPage());
      case "/quality":
        return MaterialPageRoute(builder: (_) => QualityAssurancePage());
      case "/locations":
        return MaterialPageRoute(builder: (_) => LocationsPage());
      case "/realtime-map":
        return MaterialPageRoute(builder: (_) => RealtimeMapPage());
      case "/meet":
        return MaterialPageRoute(builder: (_) => Meeting());
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
