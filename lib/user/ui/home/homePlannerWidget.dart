import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';
import 'package:project_trading/common/components/button.dart';
import 'package:project_trading/common/components/avatarTile.dart';
import 'package:project_trading/common/components/buttonTile.dart';
import 'package:project_trading/common/components/searchInput.dart';
import 'package:project_trading/common/components/verticalSpac.dart';
import 'package:project_trading/common/components/notificationTile.dart';

Widget homePlanner(BuildContext context) {
  return SizedBox(
    width: Sizes.width,
    height: Sizes.height,
    child: SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(),
          searchInput("Buscar"),
          verticalSpace(),
          avatarTile(),
          verticalSpace(2),
          buttonTile("1_box", "Matriz de incoterms", onTap: () {
            Navigator.of(context).pushNamed("/incoterm-matrix");
          }, lightColor: true),
          buttonTile("1_card", "Ordenes de compras", onTap: () {
            Navigator.of(context).pushNamed("/orders");
          }, lightColor: false),
          buttonTile("1_report", "Logística", onTap: () {
            Navigator.of(context).pushNamed("/logistics");
          }),
          buttonTile("1_profit", "Inspección de calidad", onTap: () {
            Navigator.of(context).pushNamed("/quality");
          }, lightColor: false),
          buttonTile("1_contacts", "Chat", onTap: () {
            Navigator.of(context).pushNamed("/chats");
          }, count: 4),
          verticalSpace(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Sizes.padding / 2),
            alignment: Alignment.centerLeft,
            child: Text(
              "Notificaciones",
              style: TextStyle(
                  color: const Color(0xff4E8ED0),
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.font04),
            ),
          ),
          verticalSpace(),
          notificationTile("El pedido ya paso por el portal", "6:45 PM"),
          verticalSpace(),
          notificationTile(
              "Necesitamos su confirmación de pago.....", "7:23 PM"),
          verticalSpace(),
          notificationTile(
              "Su pedido llegara en aproximadamente 3 días", "8:00 PM"),
          verticalSpace(),
          customButton(context, "Ver más", () {
            Navigator.of(context).pushNamed("/notifications");
          }, backgroundColor: const Color(0xff4E8ED0)),
          verticalSpace(3),
        ],
      ),
    ),
  );
}
