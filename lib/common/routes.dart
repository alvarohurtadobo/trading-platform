import 'package:flutter/material.dart';
import 'package:project_trading/common/ui/splash.dart';
import 'package:project_trading/user/ui/chatPage.dart';
import 'package:project_trading/user/ui/homePage.dart';
import 'package:project_trading/user/ui/chatsPage.dart';
import 'package:project_trading/user/ui/loginPage.dart';
import 'package:project_trading/trade/ui/orderPage.dart';
import 'package:project_trading/trade/ui/risksPage.dart';
import 'package:project_trading/user/ui/signupPage.dart';
import 'package:project_trading/trade/ui/ordersPage.dart';
import 'package:project_trading/trade/ui/plannedPage.dart';
import 'package:project_trading/trade/ui/timelinePage.dart';
import 'package:project_trading/common/ui/startAsPage.dart';
import 'package:project_trading/trade/ui/logisticsPage.dart';
import 'package:project_trading/user/ui/simpleSignupPage.dart';
import 'package:project_trading/user/ui/notificationsPage.dart';
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
      case "/signup-complex":
        return MaterialPageRoute(builder: (_) => SimpleSignupPage());
      case "/login":
        return MaterialPageRoute(builder: (_) => LoginPage());
      case "/home":
        return MaterialPageRoute(builder: (_) => HomePage());
      case "/incoterm-matrix":
        return MaterialPageRoute(builder: (_) => IncotermsMatrixPage());
      case "/risks":
        return MaterialPageRoute(builder: (_) => RisksPage());
      case "/orders":
        return MaterialPageRoute(builder: (_) => OrdersPage());
      case "/order":
        return MaterialPageRoute(builder: (_) => OrderPage());
      case "/logistics":
        return MaterialPageRoute(builder: (_) => LogisticsPage());
      case "/programmed-timeline":
        return MaterialPageRoute(builder: (_) => ProgrammedTimeLinePage());
      case "/planned-timeline":
        return MaterialPageRoute(builder: (_) => PlannedTimeLinePage());
      case "/notifications":
        return MaterialPageRoute(builder: (_) => NotificationPage());
      case "/chats":
        return MaterialPageRoute(builder: (_) => ChatsPage());
      case "/chat":
        return MaterialPageRoute(builder: (_) => ChatPage());
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
