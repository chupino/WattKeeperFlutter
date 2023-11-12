import 'package:flutter/material.dart';
import 'package:wattkeeper/components/inbox/header.dart';
import 'package:wattkeeper/components/inbox/notification.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HeaderInbox(),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notificaciones (3)",
                    style:
                        TextStyles.textH3.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  NotificationCard(
                      mensajeNotificacion:
                          "El dispositivo Dispositivo 1 ha superado su limite de 1000W",
                      titulo: "Alerta de desfase",
                      fechaNotificacion: DateTime.now()),
                  SizedBox(
                    height: 15,
                  ),
                  NotificationCard(
                    mensajeNotificacion:
                        "El dispositivo Dispositivo 1 ha superado su límite de 1000W",
                    titulo: "Alerta de desfase",
                    fechaNotificacion:
                        DateTime.now().subtract(Duration(hours: 2)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  NotificationCard(
                      mensajeNotificacion:
                          "El dispositivo Dispositivo 2 ha perdido la conexión",
                      titulo: "Alerta de conexión",
                      fechaNotificacion: DateTime.now().subtract(
                        Duration(hours: 5),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
