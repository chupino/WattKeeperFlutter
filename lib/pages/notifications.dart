import 'package:flutter/material.dart';
import 'package:wattkeeper/components/notifications/header.dart';
import 'package:wattkeeper/components/settings/switchCustom.dart';
import 'package:wattkeeper/components/settings/tileCustom.dart';
import 'package:wattkeeper/core/helpers/TextStyles.dart';

class NotificationsPage extends StatelessWidget {
  final bool notiEmerg = false;
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      const NotificationHeader(),
      SliverFillRemaining(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Notificaciones Emergentes',
                      style: TextStyles.textH2,
                    ),
                    TileCustom(
                      icon: Icons.notification_add,
                      titleSize: 11,
                      title:
                          'Esto habilitara que las notificaciones se muestren en primer plano cuando se reciban',
                      widgetAdj:
                          SwitchCustom(value: notiEmerg, onToggle: (value) {}),
                    ),
                    Text(
                      'Notificar Cuando',
                      style: TextStyles.textH2,
                    ),
                    Text(
                      'Personaliza cuando quieres recibir notificaciones',
                      style: TextStyles.textH5,
                    ),
                    TileCustom(
                      titleSize: 15,
                      icon: Icons.notification_add,
                      title: 'Cuando se supere un limite',
                      widgetAdj:
                          SwitchCustom(value: notiEmerg, onToggle: (value) {}),
                    ),
                    TileCustom(
                      titleSize: 15,
                      icon: Icons.notification_add,
                      title: 'Consejos Diarios',
                      widgetAdj:
                          SwitchCustom(value: notiEmerg, onToggle: (value) {}),
                    ),
                    TileCustom(
                      titleSize: 15,
                      icon: Icons.notification_add,
                      title: 'Cuando cambie el estado de un dispositivo',
                      widgetAdj:
                          SwitchCustom(value: notiEmerg, onToggle: (value) {}),
                    ),
                  ])))
    ]));
  }
}
