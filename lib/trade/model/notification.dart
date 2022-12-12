import 'package:flutter/material.dart';

class CustomNotification {
  int id = 0;
  String title = "";
  String message = "";
  String code = "";
  bool canDelete = false;
  Color backgroundColor = Colors.white;
  CustomNotification(this.id, this.title, this.message, this.code, this.canDelete, this.backgroundColor);
}

List customNotifications = [
  CustomNotification(1, "AGENTE D", "12-08-2022 (pedido de ropa)", "#1281", true, Colors.white),
  CustomNotification(2, "ALERTA A", "Algo anda mal revisa tus mensajes", "#1281", false, Colors.white),
  CustomNotification(3, "¡FELICIDADES!", "Tu alerta fue enviada de manera exitosa", "#1281", false, const Color(0xff9ECCF2)),
  CustomNotification(4, "PARADA", "Falta 2 horas para que el paquete llegue a su parada", "#1281", false, Colors.white),
  CustomNotification(5, "AGENTE D", "Se solicita confirmación del paquete", "#1281", true, Colors.white),
  CustomNotification(6, "AGENTE D", "12-08-2022 (pedido de ropa)", "#1281", false, Colors.white),
  CustomNotification(7, "ALERTA A", "Algo anda mal revisa tus mensajes", "#1281", false, Colors.white),
  CustomNotification(8, "¡FELICIDADES!", "Tu alerta fue enviada de manera exitosa", "#1281", false, const Color(0xff9ECCF2)),
  CustomNotification(9, "PARADA", "Falta 2 horas para que el paquete llegue a su parada", "#1281", false, Colors.white),
  CustomNotification(10, "AGENTE D", "Se solicita confirmación del paquete", "#1281", false, Colors.white),
];