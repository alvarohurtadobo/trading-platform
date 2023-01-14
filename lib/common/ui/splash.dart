import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_trading/common/components/toast.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Crear un canal de notificación
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null &&
      android != null &&
      (Platform.isAndroid || Platform.isIOS)) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO Personalizar para no utilizar el por defecto
          icon: 'launch_background',
        ),
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
    animationBehavior: AnimationBehavior.preserve,
    reverseDuration: const Duration(seconds: 0),
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  late final AnimationController _lineController = AnimationController(
    duration: const Duration(seconds: 2),
    animationBehavior: AnimationBehavior.preserve,
    reverseDuration: const Duration(seconds: 0),
    vsync: this,
  )..forward();

  @override
  void initState() {
    super.initState();
    setupFlutterNotifications().then((value) {
      FirebaseMessaging.onMessage.listen(showFlutterNotification);
      FirebaseMessaging.onBackgroundMessage((message) async {
        showToast(message.notification!.body ?? "");
      });
    });
    Timer(const Duration(seconds: 3),() {
      Navigator.of(context).pushReplacementNamed("/startAs");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mySize = Size(Sizes.width, Sizes.height);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Sizes.initSizes(width, height);
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Color(0xff9ECCF2),
        ),
        child: Stack(
          children: [
            Positioned(
              top: Sizes.height / 4,
              left: 0,
              child: Image.asset(
                "assets/images/splashSimple.png",
                width: Sizes.width,
              ),
            ),
            Positioned(
                top: Sizes.height / 3.5,
                left: 0,
                child: FadeTransition(
                  opacity: _animation,
                  child: Container(
                    width: Sizes.width,
                    height: Sizes.tileBig,
                    alignment: Alignment.center,
                    child: Center(
                      child: Image.asset(
                        "assets/images/titleAppBar_big.png",
                        height: Sizes.height * 0.07,
                      ),
                    ),
                  ),
                )),
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    Rect.fromLTWH(0, Sizes.height * 1.2, 0, 0), mySize),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(0, Sizes.height / 2.6, 0, 0), mySize),
              ).animate(CurvedAnimation(
                parent: _lineController,
                curve: Curves.linear,
              )),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Sizes.width * 0.1),
                width: Sizes.width,
                alignment: Alignment.topCenter,
                // color: Colors.green,
                child: Image.asset(
                  "assets/images/logo.png",
                  height: Sizes.height * 0.26,
                ),
              ),
            ),
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    Rect.fromLTWH(0, Sizes.height * 1.5, 0, 0), mySize),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(
                        0, Sizes.height / 2.6 + Sizes.height * 0.27, 0, 0),
                    mySize),
              ).animate(CurvedAnimation(
                parent: _lineController,
                curve: Curves.linear,
              )),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Sizes.width * 0.1),
                width: Sizes.width,
                alignment: Alignment.topCenter,
                // color: Colors.green,
                child: Image.asset(
                  "assets/images/shadow.png",
                  width: Sizes.width * 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
